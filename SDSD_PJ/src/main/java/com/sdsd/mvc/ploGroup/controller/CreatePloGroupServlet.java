package com.sdsd.mvc.ploGroup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.sdsd.mvc.member.model.vo.Member;
import com.sdsd.mvc.ploGroup.model.service.PloGroupService;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;

import oracle.net.aso.p;

@WebServlet("/plogroup/createPloGroup")
public class CreatePloGroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreatePloGroupServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/ploboard/createClub.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		PloGroup plogroup = new PloGroup();
		
		String path = getServletContext().getRealPath("/resources/upload/board");

        // 파일의 최대 사이즈 지정 (10MB)
        int maxSize = 10485760;

        // 인코딩 설정
        String encoding = "UTF-8";

        MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding);
        
        String writer = mr.getParameter("nickName");
    	String content = mr.getParameter("content");
    	String pgName = mr.getParameter("pgName");
    	String spbKeyword = mr.getParameter("spbKeyword");
//        String originalFileName = mr.getOriginalFileName("upfile1");
        String originalFileName = mr.getOriginalFileName("upfile1") + ", " + mr.getOriginalFileName("upfile2") + ", " + mr.getOriginalFileName("upfile3") + ", " + mr.getOriginalFileName("upfile4");
        String address = mr.getParameter("local");
        
        HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
        
        if (loginMember != null) {   
        	
			plogroup.setSpbWriterNum(loginMember.getNo());
			plogroup.setSpbWriterName(writer);
			plogroup.setPlogGroupName(pgName);
			plogroup.setSpbContent(content);
			System.out.println(originalFileName);
			plogroup.setSpbBorFile(originalFileName);
			plogroup.setSpbKeyword(spbKeyword);
			plogroup.setAddress(address);
			
			result = new PloGroupService().createGroup(plogroup);
			System.out.println(plogroup.getSpbFileList());
			if (result > 0) {
				request.setAttribute("msg", "모임 등록 성공");
	    		request.setAttribute("location", "/views/ploboard/createClubCelebrate.jsp");
			} else {
				request.setAttribute("msg", "모임 등록 실패");
	    		request.setAttribute("location", "/");
			}
        } else {
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/member/login");
    	}
		System.out.println("플로깅모임생성" + plogroup);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
