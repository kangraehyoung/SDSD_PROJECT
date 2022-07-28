package com.sdsd.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.member.model.service.MemberService;
import com.sdsd.mvc.member.model.vo.Member;

@WebServlet("/SearchPwd")
public class SearchPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchPwdServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String phone = request.getParameter("phone2");
		Member findPwd = new Member();
		
		
		if(!(email == null || phone == null)) {
			findPwd.setEmail(email);
			findPwd.setPhone(phone);
			
			int result = new MemberService().findPwd(findPwd);
			System.out.println(result);
			if (result > 0) {
				request.setAttribute("msg", "임시 비밀번호는 " + findPwd.getPassword() + "입니다.");
				request.setAttribute("location", "/views/login.jsp");
			}
			else {
				request.setAttribute("msg", "원치않는 문제로 인해 종료되었습니다. ");
				request.setAttribute("location", "/views/member/findIDnPW.jsp");
			}
		} else {
			request.setAttribute("msg", "아이디 또는 전화번호가 입력되지 않았습니다.");
			request.setAttribute("location", "/views/findIDnPW.jsp");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

}
