package com.sdsd.mvc.others.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/others/course")
public class PloggingCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PloggingCourseServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 구 버전 - 서호정
    	// request.getRequestDispatcher("/views/others/PloggingCourse.jsp").forward(request, response);
    	// 리뉴얼 버전 - 최송희 
    	request.getRequestDispatcher("/views/others/PloggingCourse_ver2.jsp").forward(request, response);
    }

}
