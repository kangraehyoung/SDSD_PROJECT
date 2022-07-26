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
        HttpSession session = request.getSession(false);
        Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");

        if (loginMember != null) {
            // 2. 사용자가 수정한 내용을 가지고 Member 객체를 생성    	
    	Member member = new Member();
	
    	// 회원 정보 수정내용들 ..
    	member.setNo(Integer.parseInt(request.getParameter("no")));
    	member.setNickName(request.getParameter("nickname"));
    	member.setPhone(request.getParameter("phone"));
    	member.setAddress(request.getParameter("address"));
    	
    	System.out.println(member.getNo());
    	result = new MemberService().save(member);
        
	    	if (result > 0) {
	    		// 회원 정보 수정 성공시.
	    		session.setAttribute("loginMember", new MemberService().login(loginMember.getEmail(), loginMember.getPassword()));
	    		request.setAttribute("msg", "회원님의 정보를 수정했습니다 ><");
	    		request.setAttribute("location", "/member/myPage");
	    	} else {
	    		request.setAttribute("msg", "회원님의 정보 수정을 실패했습니다.");
	    		request.setAttribute("location", "/member/myPage");
	    	}
       } else {
    	   request.setAttribute("msg", "로그인 후 수정해 주세요.");
           request.setAttribute("location", "/");
       }

       request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
   }

}
