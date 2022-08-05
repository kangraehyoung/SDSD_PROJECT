package com.sdsd.mvc.ploGroup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sdsd.mvc.member.model.vo.Member;
import com.sdsd.mvc.ploGroup.model.service.PloGroupService;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;

@WebServlet("/plogroup/joinPloGroup")
public class JoinPloGroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinPloGroupServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		String pgName = request.getParameter("pgName");
		PloGroup plogroup = new PloGroup();
		
		HttpSession session = request.getSession(false);
	    Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
	    
	    if (loginMember != null) {
	    	plogroup.setPlogGroupName(pgName);
	    	result = new PloGroupService().joinGroup(plogroup, loginMember);
	    	
	    	if (result > 0) {
				request.setAttribute("msg", "모임 가입 성공 다시 로그인해 주세요");
				session.invalidate();
	    		request.setAttribute("location", "/views/ploboard/createClubCelebrate.jsp");
			} else {
				request.setAttribute("msg", "모임 가입 실패");
	    		request.setAttribute("location", "/");
			}
	    } else {
	    	request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/member/login");
	    }
	    System.out.println("조인서블릿 결과" + pgName);
	    request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
