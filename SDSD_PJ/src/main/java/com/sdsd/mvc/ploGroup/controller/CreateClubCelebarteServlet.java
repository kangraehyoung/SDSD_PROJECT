package com.sdsd.mvc.ploGroup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ploboard/celebrate")
public class CreateClubCelebarteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateClubCelebarteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/ploboard/createClubCelebrate.jsp").forward(request, response);
	}

}
