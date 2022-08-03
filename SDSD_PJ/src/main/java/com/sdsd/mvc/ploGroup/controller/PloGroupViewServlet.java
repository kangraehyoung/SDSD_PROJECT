package com.sdsd.mvc.ploGroup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.indiboard.model.service.IndiBoardService;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;

@WebServlet("/ploboard/ploGroupView")
public class PloGroupViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PloGroupViewServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/ploboard/viewClub.jsp").forward(request, response);
	}

}
