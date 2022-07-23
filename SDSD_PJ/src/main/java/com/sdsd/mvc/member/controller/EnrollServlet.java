package com.sdsd.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.member.model.service.MemberService;
import com.sdsd.mvc.member.model.vo.Member;

@WebServlet("/member/enroll")
public class EnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EnrollServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/member/enrollForm.jsp").forward(request, response);
    }
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Member member = new Member();
    	
    	member.setEmail(request.getParameter("email"));
    	member.setPassword(request.getParameter("password"));
    	member.setName(request.getParameter("name"));
    	member.setNickName(request.getParameter("nickName"));
    	member.setPhone(request.getParameter("phone"));
    	member.setAddress(request.getParameter("address"));
    	member.setGender(request.getParameter("gender"));
    	
    	System.out.println(member);
    	
    	int result = new MemberService().save(member);
    	
    	if(result > 0 ) {
    		request.setAttribute("msg", "회원 가입 성공!");
    		request.setAttribute("location", "/");
    	} else {
    		request.setAttribute("msg", "회원 가입 실패");
			request.setAttribute("location", "/");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	
    }	

}
