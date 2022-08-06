package com.sdsd.mvc.groupboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.sdsd.mvc.common.util.FileRename;
import com.sdsd.mvc.groupboard.model.service.GroupBoardService;
import com.sdsd.mvc.groupboard.model.vo.GroupBoard;
import com.sdsd.mvc.member.model.vo.Member;

@WebServlet("/groupboard/groupwrite")
public class GroupBoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GroupBoardWriteServlet() {
    }

    // 모임 플로깅 인증 게시글 작성 서블릿
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {    		
    		request.getRequestDispatcher("/views/ploboard/clubPlogBoardWrite.jsp").forward(request, response);    		
    	} else {
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/views/login.jsp");
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	} 
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
    	GroupBoard groupBoard = null;
    	// 파일이 저장될 경로
    	String path = getServletContext().getRealPath("/resources/upload/board");
    	
    	// 파일의 최대 사이즈 지정 (10MB)
    	int maxSize = 10485760;
    	
    	// 인코딩 설정
    	String encoding = "UTF-8";
    	
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    	
    	// 폼 파라미터로 넘어온 값들 (파일에 대한 정보 X)
    	String writer = mr.getParameter("nickName");
    	String content = mr.getParameter("content");
    	String groupkeyword = mr.getParameter("groupkeyword");
    	String borTitle = mr.getParameter("borTitle");
//    	String originalFileName = mr.getOriginalFileName("upfile1");
    	String originalFileName = mr.getOriginalFileName("upfile1") + ", " + mr.getOriginalFileName("upfile2") + ", " + mr.getOriginalFileName("upfile3") + ", " + mr.getOriginalFileName("upfile4");
    	
    	// 플로깅 모임명 조인해오기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    	String groupName = mr.getParameter("groupName");
    	
    	// 파일에 대한 정보를 가져올 때
    	       	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {
    		groupBoard = new GroupBoard();
    		
    		groupBoard.setWriterNo(loginMember.getNo());
    		groupBoard.setWriterName(writer);
    		groupBoard.setBorContent(content);
    		groupBoard.setBorFile(originalFileName);
    		groupBoard.setGroupkeyword(groupkeyword);
    		groupBoard.setGroupName(groupName); // 플로깅 모임명!!!!!!!!!!!!!!! 
    		result = new GroupBoardService().save(groupBoard);
    		if(result > 0) {
        		request.setAttribute("msg", "게시글 등록 성공");
        		request.setAttribute("location", "/groupboard/grouplist");
    		} else {
    			request.setAttribute("msg", "게시글 등록 실패");
    			request.setAttribute("location", "/groupboard/grouplist");
    		}
    	} else {
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/member/login");
    	}

    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

}
