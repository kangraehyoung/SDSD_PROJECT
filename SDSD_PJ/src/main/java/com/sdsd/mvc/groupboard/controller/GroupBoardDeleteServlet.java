package com.sdsd.mvc.groupboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.groupboard.model.service.GroupBoardService;

@WebServlet("/groupboard/groupDelete")
public class GroupBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GroupBoardDeleteServlet() {
    }

    // 모임 인증 게시글 삭제 서블릿
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	int groupBorNo = Integer.parseInt(request.getParameter("groupBorNo"));
    	
    	result = new GroupBoardService().delete(groupBorNo);
    	
    	if(result > 0) {
    		request.setAttribute("msg", "게시글 삭제 성공");
    		request.setAttribute("location", "/groupboard/grouplist");
		} else {
			request.setAttribute("msg", "게시글 삭제 실패");
			request.setAttribute("location", "/groupboard/view?groupBorNo=" + groupBorNo);
		}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    }
    


}
