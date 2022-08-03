package com.sdsd.mvc.groupboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.groupboard.model.service.GroupBoardService;

@WebServlet("/groupboard/groupreplydelete")
public class GroupReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GroupReplyDeleteServlet() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		int groupBorNo = Integer.parseInt(request.getParameter("groupBorNo"));
		int no = Integer.parseInt(request.getParameter("no"));
		
		result = new GroupBoardService().groupreplydelete(groupBorNo, no);
		
		if(result > 0) {
    		request.setAttribute("msg", "댓글 삭제 성공");
    		request.setAttribute("location", "/groupboard/detail?groupBorNo=" + groupBorNo);
		} else {
			request.setAttribute("msg", "댓글 삭제 실패");
			request.setAttribute("location", "/groupboard/detail?groupBorNo=" + groupBorNo);
		}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
