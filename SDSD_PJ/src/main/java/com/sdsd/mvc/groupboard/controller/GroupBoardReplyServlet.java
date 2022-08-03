package com.sdsd.mvc.groupboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sdsd.mvc.groupboard.model.service.GroupBoardService;
import com.sdsd.mvc.groupboard.model.vo.GroupReply;
import com.sdsd.mvc.member.model.vo.Member;

@WebServlet("/groupBoard/groupreply")
public class GroupBoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private GroupBoardService service = new GroupBoardService();   // Why?
    public GroupBoardReplyServlet() {
    	
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int repboardNo = Integer.parseInt(request.getParameter("repboardNo"));
		String repcontent = request.getParameter("repcontent");
		
		HttpSession session = request.getSession(false);
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
    	
    	if(loginMember != null) {
			GroupReply groupreply = new GroupReply();
			
			groupreply.setRepboardNo(repboardNo);
			groupreply.setRepwriterNo(loginMember.getNo());
			groupreply.setRepwriterId(loginMember.getEmail());
			groupreply.setRepcontent(repcontent);
			
			int result = service.saveGroupReply(groupreply);
			
			System.out.println();
			if(result > 0) {
         		request.setAttribute("msg", "댓글 등록 성공!");
         		request.setAttribute("location", "/indiboard/detail?maBorNo=" + repboardNo);
			} else {
				request.setAttribute("msg", "댓글 등록 실패!");
         		request.setAttribute("location", "/indiboard/detail?maBorNo=" + repboardNo);
			}
    	} else {
     		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
     		request.setAttribute("location", "/member/login");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
   	}
	
	

}
