package com.sdsd.mvc.groupboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/groupboard/groupDelete")
public class GroupBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GroupBoardDeleteServlet() {
    }

    // 모임 인증 게시글 삭제 서블릿
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    }


}
