package com.sdsd.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sdsd.mvc.member.model.service.MemberService;
import com.sdsd.mvc.member.model.vo.Member;

@WebServlet(name="login", urlPatterns = "/member/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String email = request.getParameter("email");
    	String password = request.getParameter("password");
    	
    	HttpSession session = null;
    	
    	System.out.println(email + ", " + password + ", ");
    	
    	Member loginMember = new MemberService().login(email, password);
    	
    	System.out.println(loginMember);
    	
    	  if(loginMember != null) {
    	         // loginMember 객체를 세션에 저장
    	         // 세션변수에  세션영역객체를 생성한다.
    	         session = request.getSession();
    	         
    	         // 현재 세션에 쿼리문을 실행하여 얻은 결과를 객체로 변경한 loginMember를 저장한다. 
    	         session.setAttribute("loginMember", loginMember);
    	         // 로그인이 완료되면 메인 화면으로 이동시킨다.
    	         response.sendRedirect(request.getContextPath() + "/");
    	      } else {
    	         // 로그인 실패에 대한 메시지를 띄워주고 메인 화면으로 이동
    	         // 로그인 실패 시, 따로 session에 저장할 필요가 없으므로 
    	         // 1. 공용으로 사용하는 에러 메시지 출력 페이지에
    	         //      전달할 메시지와 메시지 출력 후 이동할 페이지를 request 객체에 저장한다.
    	         request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다.");
    	         request.setAttribute("location", "/member/login");
    	         
    	         // 2. request 객체의 데이터를 유지해서 에러 메시지 출력 페이지에 전달하기 위해 forward() 실행
    	         request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	         
    	      }
    }

}


