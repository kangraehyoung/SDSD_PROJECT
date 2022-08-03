package com.sdsd.mvc.indiboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.indiboard.model.service.IndiBoardService;
import com.sdsd.mvc.indiboard.model.vo.IndiBoard;

@WebServlet("/indiboard/indikeysearch")
public class IndiBoardKeySearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IndiBoardKeySearch() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	List<IndiBoard> keysearchlist = null;
//	String indiketword = request.getParameter("indiketword");
//	keysearchlist = new IndiBoardService().getSearchList(indiketword);
//	request.setAttribute("keysearchlist", keysearchlist);
//	request.getRequestDispatcher("/views/indiboard/individualBoard.jsp").forward(request, response);
//		int page = 0;
//		int listCount = 0;
//		PageInfo pageInfo = null;
//		String indiketword = request.getParameter("indiketword");
//		List<IndiBoard> indiBoard = null;
//		
//		try {
//			page = Integer.parseInt(request.getParameter("page"));
//		} catch (NumberFormatException e) {
//			page = 1;
//		}
//		
//		
//		listCount = new IndiBoardService().getBoardCount();
//		pageInfo = new PageInfo(page, 10, listCount, 8);    
//		keysearchlist = new IndiBoardService().getBoardList(pageInfo);
//		keysearchlist = new IndiBoardService().getSearchList(indiketword);
//		
//		System.out.println(" 1 " + listCount);
//		System.out.println(" 2 " + pageInfo);
//		System.out.println(" 3 " + keysearchlist);
//		
//		request.setAttribute("pageInfo", pageInfo);
//		request.setAttribute("keysearchlist", keysearchlist);
//		request.getRequestDispatcher("/views/indiboard/individualBoard.jsp").forward(request, response);
		
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<IndiBoard> indiboardlist = null;
		String indiketword = request.getParameter("indiketword");
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		
		
		listCount = new IndiBoardService().getBoardCount();
		pageInfo = new PageInfo(page, 10, listCount, 8);    
		indiboardlist = new IndiBoardService().getSearchList(pageInfo, indiketword);
		
		//System.out.println(" 1 " + listCount);
		//System.out.println(" 2 " + pageInfo);
		//System.out.println(" 3 " + indiboardlist);
		
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("indiboardlist", indiboardlist);
		request.getRequestDispatcher("/views/indiboard/individualBoard.jsp").forward(request, response);
		
		}
		
	


}
