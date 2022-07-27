package com.sdsd.mvc.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.member.model.service.MemberService;
import com.sdsd.mvc.member.model.vo.Member;

@WebServlet(name = "searchId", urlPatterns = "/member/searchId" )
public class SearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchIdServlet() {
    }

	protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		MemberService service = new MemberService();
		Member member = service.searchId(name, phone);
		
		System.out.println(member);
		
		if(member == null) {

			request.setAttribute("msg", "아이디가 존재하지 않습니다!");
			request.setAttribute("loc", "/");
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/msg.jsp");
			rd.forward(request, response);
			
		}else {
			request.setAttribute("msg", member.getEmail() + "입니다");
			request.setAttribute("loc", "/login");
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/msg.jsp");
			rd.forward(request, response);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
