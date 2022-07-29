package com.sdsd.mvc.member.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.member.model.service.MemberService;
import com.sdsd.mvc.member.model.vo.Member;

import oracle.sql.DATE;

@WebServlet(name="enroll", urlPatterns = "/member/enroll")
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
    	member.setPassword2(request.getParameter("password2"));
    	member.setName(request.getParameter("name"));
    	member.setNickName(request.getParameter("nickName"));
    	member.setPhone(request.getParameter("phone"));
    	member.setAddress(request.getParameter("address"));
    	member.setGender(request.getParameter("gender"));
    	member.setBDay(request.getParameter("birthDate"));
    	
    	System.out.println(member);
    	
    	int result = new MemberService().save(member);
    	if(member.getPassword().equals(member.getPassword2())) {
    		if(result > 0 ) {
    			request.setAttribute("msg", "회원 가입 성공!");
    			request.setAttribute("location", "/views/member/joinCelebrate.jsp");
    		} else {
    			request.setAttribute("msg", "회원 가입 실패");
    			request.setAttribute("location", "/views/member/enrollForm.jsp");
    		}
    	} else {
    		request.setAttribute("msg", "비밀번호를 확인해 주세요");
			request.setAttribute("location", "/views/member/enrollForm.jsp");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	
    }	

}
