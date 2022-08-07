package com.sdsd.mvc.ploGroup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sdsd.mvc.indiboard.model.service.IndiBoardService;
import com.sdsd.mvc.indiboard.model.vo.IndiBoard;
import com.sdsd.mvc.member.model.service.MemberService;
import com.sdsd.mvc.member.model.vo.Member;
import com.sdsd.mvc.ploGroup.model.service.PloGroupService;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;

@WebServlet("/ploboard/outGroup")
public class outGroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public outGroupServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		HttpSession session = request.getSession(false);
		
		Member loginMember = session == null ? null : (Member) session.getAttribute("loginMember");
		
		if(loginMember != null) {
    		result = new PloGroupService().deleteMember(loginMember.getNo());
    		if(result > 0) {
    			request.setAttribute("msg", "모임 탈퇴가 완료되었습니다. 다시 로그인해주세요.");
    			session.invalidate();
    			request.setAttribute("location", "/member/login");
    			
    		} else {
    			request.setAttribute("msg", "모임 탈퇴에 실패했습니다. 다시 시도해주세요");
    			request.setAttribute("location", "/member/myPage");
    		}
    	} else {
    		request.setAttribute("msg", "로그인 후 탈퇴해 주세요");
    		request.setAttribute("location", "/");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
