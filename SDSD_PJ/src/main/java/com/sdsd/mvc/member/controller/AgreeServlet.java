package com.sdsd.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

@WebServlet("/member/agree")
public class AgreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AgreeServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String service = request.getParameter("service");
		String personInfo = request.getParameter("personInfo");
		
		if(service == null || personInfo==null) {
			request.setAttribute("msg", "이용약관에 동의해주세요.");
    		request.setAttribute("location", "/member/agreePage");
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/views/member/enrollForm.jsp").forward(request, response);
			
		}
	}

}
