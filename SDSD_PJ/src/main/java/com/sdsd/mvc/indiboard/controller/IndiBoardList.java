package com.sdsd.mvc.indiboard.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.indiboard.model.service.IndiBoardService;
import com.sdsd.mvc.indiboard.model.vo.IndiBoard;

@WebServlet("/indiboard/indilist")
public class IndiBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IndiBoardList() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int page = 0;
	int listCount = 0;
	PageInfo pageInfo = null;
	List<IndiBoard> indiboardlist = null;
	
	try {
		page = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException e) {
		page = 1;
	}
	

	
	listCount = new IndiBoardService().getBoardCount();
	pageInfo = new PageInfo(page, 10, listCount, 8);    
	indiboardlist = new IndiBoardService().getBoardList(pageInfo);
	

	
	request.setAttribute("pageInfo", pageInfo);
	request.setAttribute("indiboardlist", indiboardlist);
	request.getRequestDispatcher("/views/indiboard/individualBoard.jsp").forward(request, response);
	
	}

	

}
