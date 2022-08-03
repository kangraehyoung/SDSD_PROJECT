package com.sdsd.mvc.indiboard.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.sdsd.mvc.indiboard.model.dao.BoardDao;
import com.sdsd.mvc.indiboard.model.service.IndiBoardService;
import com.sdsd.mvc.indiboard.model.vo.IndiBoard;
import com.sdsd.mvc.member.model.vo.Member;

@WebServlet("/indiboard/indiUpdate")
public class IndiBoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IndiBoardUpdate() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		Member loginMember = session == null ? null : (Member) session.getAttribute("loginMember");
		
		if(loginMember != null) {
			IndiBoard indiBoard = null;
			int no = Integer.parseInt(request.getParameter("maBorNo"));
			
			indiBoard = new IndiBoardService().getBoardByNo(no, true);
	    	
	    	//System.out.println(indiBoard);
	    	
	    	request.setAttribute("indiBoard", indiBoard);
	    	//System.out.println("수정페이지로 이동");
			request.getRequestDispatcher("/views/indiboard/individualBoardUpdate.jsp").forward(request, response);
		} 
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("포스트 시작");
		int result=0;
		IndiBoard indiBoard = null;
		// 파일이 저장될 경로
    	String path = getServletContext().getRealPath("/resources/upload/board");
    	
    	// 파일의 최대 사이즈 지정 (10MB)
    	int maxSize = 10485760;
    	
    	// 인코딩 설정
    	String encoding = "UTF-8";
    	
    	// DefaultFileRenamePolicy : 중복되는 이름 뒤에 1 ~ 9999 붙인다.
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding);
    	
    	// update.jsp에는 no값이 없어 input을 hidden으로 숨기고 가져옴
    	//System.out.println(mr.getParameter("no"));
    	
    	indiBoard = new IndiBoard();
    	
    	indiBoard.setMaBorNo(Integer.parseInt(mr.getParameter("no")));
    	indiBoard.setBorTitle(mr.getParameter("title"));
    	indiBoard.setWriterName(mr.getParameter("writer"));
    	indiBoard.setBorContent(mr.getParameter("content"));
    	
    	String fileName = mr.getOriginalFileName("upfile1") + ", " + mr.getOriginalFileName("upfile2") + ", " + mr.getOriginalFileName("upfile3");
    	
    	if(fileName != null && !fileName.equals("")) {
    		File file = new File(path + "/" + mr.getParameter("fileName"));
    		
    		if(file.exists()) {
    			file.delete();
    		}
    		
    		indiBoard.setBorFile(fileName);
    	} else {
    		indiBoard.setBorFile(fileName);
    	}
    	
    	//System.out.println(indiBoard.getBorFile() + "에휴 제발제발");
    	
    	result = new IndiBoardService().save(indiBoard);
    	
    	//System.out.println("제발 제발 : " + result);
    	if(result > 0) {
    		request.setAttribute("msg", "게시글 수정 성공");
    	} else {
    		request.setAttribute("msg", "게시글 수정 실패");
    	}
    	request.setAttribute("location", "/indiboard/detail?maBorNo=" + indiBoard.getMaBorNo());
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
