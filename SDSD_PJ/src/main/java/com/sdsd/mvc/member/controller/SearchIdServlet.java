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

	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		MemberService service = new MemberService();
		Member member = service.searchId(name, phone);
		
		if(member != null) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/member/searchId.jsp");
			request.setAttribute("members", member);
			rd.forward(request, response);
			
		}else {
			request.setAttribute("msg", "정확한 정보를 입력해 주세요!");
			request.setAttribute("loc", "/");
			RequestDispatcher rd = request.getRequestDispatcher("/views/common/msg.jsp");
			rd.forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
