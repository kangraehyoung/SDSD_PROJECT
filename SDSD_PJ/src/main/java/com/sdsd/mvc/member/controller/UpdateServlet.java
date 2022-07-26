package com.sdsd.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.member.model.vo.Member;

@WebServlet("/member/myPage")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateServlet() { 
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/member/myPage.jsp").forward(request, response);
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	Member member = new Member();
	
    	// 회원 정보 수정내용들 ..
    	member.setName(request.getParameter("name"));
    	member.setNickName(request.getParameter("nickName"));
    	member.setPhone(request.getParameter("phone"));
    	member.setAddress(request.getParameter("address"));
    	member.setGender(request.getParameter("gender"));
    	member.setIntroduce(request.getParameter("introduce"));
    	
    	System.out.println(member);
    	
    	if (result > 0) {
    		// 회원 정보 수정 성공시.
    		request.setAttribute("msg", "회원님의 정보를 수정했습니다 ><");
    		request.setAttribute("location", "/member/myPage");
    	} else {
    		request.setAttribute("msg", "회원님의 정보 수정을 실패했습니다.");
    		request.setAttribute("location", "/member/myPage");
    	}
    }

}
