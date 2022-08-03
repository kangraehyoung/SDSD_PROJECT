package com.sdsd.mvc.indiboard.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.sdsd.mvc.common.util.FileRename;
import com.sdsd.mvc.indiboard.model.service.IndiBoardService;
import com.sdsd.mvc.indiboard.model.vo.IndiBoard;
import com.sdsd.mvc.member.model.vo.Member;

@WebServlet("/indiboard/indiwrite")
public class IndiBoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IndiBoardWriteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {    		
    		request.getRequestDispatcher("/views/indiboard/individualBoardPrepare.jsp").forward(request, response);    		
    	} else {
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/views/login.jsp");
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
    	IndiBoard indiBoard = null;

    	
    	// 파일이 저장될 경로
    	String path = getServletContext().getRealPath("/resources/upload/board");
    	
    	// 파일의 최대 사이즈 지정 (10MB)
    	int maxSize = 10485760;
    	
    	// 인코딩 설정
    	String encoding = "UTF-8";
    	
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding);
    	
    	// 폼 파라미터로 넘어온 값들 (파일에 대한 정보 X)
    	String writer = mr.getParameter("nickName");
    	String content = mr.getParameter("content");
    	String indikeyword = mr.getParameter("indikeyword");
//    	String title = mr.getParameter("제목은 나중에 넣을것");
    	
//    	String originalFileName = mr.getOriginalFileName("upfile1");
    	String originalFileName = mr.getOriginalFileName("upfile1") + ", " + mr.getOriginalFileName("upfile2") + ", " + mr.getOriginalFileName("upfile3");
    	
    	
    	//System.out.println(writer);
    	// 파일에 대한 정보를 가져올 때
    	
       	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {    		
    		indiBoard = new IndiBoard();
    		
    		indiBoard.setWriterNo(loginMember.getNo());
    		indiBoard.setWriterName(writer);
    		indiBoard.setBorContent(content);
    		indiBoard.setBorFile(originalFileName);
//    		indiBoard.setBorTitle("위의 title 매개값 입력"); //게시글 set입니다
    		indiBoard.setIndikeyword(indikeyword);
    		
    		//System.out.println(indiBoard.getBorFile());
    		result = new IndiBoardService().save(indiBoard);
    		//System.out.println("서블릿 result : " + result);
    		if(result > 0) {
        		request.setAttribute("msg", "게시글 등록 성공");
        		request.setAttribute("location", "/indiboard/indilist");
    		} else {
    			request.setAttribute("msg", "게시글 등록 실패");
    			request.setAttribute("location", "/indiboard/indilist");
    		}
    	} else {
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/member/login");
    	}

    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

}
