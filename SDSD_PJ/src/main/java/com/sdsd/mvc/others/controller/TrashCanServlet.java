package com.sdsd.mvc.others.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/others/trash")
public class TrashCanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TrashCanServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/others/TrashCan.jsp").forward(request, response);
    }

}
