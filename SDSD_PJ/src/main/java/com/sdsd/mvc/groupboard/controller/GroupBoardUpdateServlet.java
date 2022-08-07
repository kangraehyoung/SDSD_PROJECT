package com.sdsd.mvc.groupboard.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.sdsd.mvc.groupboard.model.service.GroupBoardService;
import com.sdsd.mvc.groupboard.model.vo.GroupBoard;
import com.sdsd.mvc.member.model.vo.Member;

@WebServlet("/groupboard/groupUpdate")
public class GroupBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GroupBoardUpdateServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		Member loginMember = session == null ? null : (Member) session.getAttribute("loginMember");
		
		if(loginMember != null) {
			GroupBoard groupBoard = null;
			int no = Integer.parseInt(request.getParameter("groupBorNo"));
			
			groupBoard = new GroupBoardService().getGroupBoardByNo(no, true);
	    	  	
	    	request.setAttribute("groupBoard", groupBoard);
			request.getRequestDispatcher("/views/ploboard/clubPlogBoardUpdate.jsp").forward(request, response);
		} 
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("포스트 시작");
		int result=0;
		GroupBoard groupBoard = null;
		// 파일이 저장될 경로
    	String path = getServletContext().getRealPath("/resources/upload/board");
    	
    	// 파일의 최대 사이즈 지정 (10MB)
    	int maxSize = 10485760;
    	
    	// 인코딩 설정
    	String encoding = "UTF-8";
    	
    	// DefaultFileRenamePolicy : 중복되는 이름 뒤에 1 ~ 9999 붙인다.
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding);
    	
    	// update.jsp에는 no값이 없어 input을 hidden으로 숨기고 가져옴
    	// System.out.println(mr.getParameter("no"));
    	
    	groupBoard = new GroupBoard();
    	
    	groupBoard.setGroupBorNo(Integer.parseInt(mr.getParameter("no")));
    	groupBoard.setBorTitle(mr.getParameter("title"));
    	groupBoard.setWriterName(mr.getParameter("writer"));
    	groupBoard.setBorContent(mr.getParameter("content"));
    	
    	String fileName = mr.getOriginalFileName("upfile1") + ", " + mr.getOriginalFileName("upfile2") + ", " + mr.getOriginalFileName("upfile3") + ", " + mr.getOriginalFileName("upfile4") ;
    	System.out.println(groupBoard);
    	
    	if(fileName != null && !fileName.equals("")) {
    		File file = new File(path + "/" + mr.getParameter("fileName"));
    		
    		if(file.exists()) {
    			file.delete();
    		}
    		
    		groupBoard.setBorFile(fileName);
    	} else {
    		groupBoard.setBorFile(fileName);
    	}
    	
    	//System.out.println(groupBoard.getBorFile() + "비 많이 온다..");
    	result = new GroupBoardService().save(groupBoard);
    	
    	//System.out.println("추적 추적 : " + result);
    	if(result > 0) {
    		request.setAttribute("msg", "게시글 수정 성공");
    	} else {
    		request.setAttribute("msg", "게시글 수정 실패");
    	}
    	request.setAttribute("location", "/groupboard/detail?groupBorNo=" + groupBoard.getGroupBorNo());
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
