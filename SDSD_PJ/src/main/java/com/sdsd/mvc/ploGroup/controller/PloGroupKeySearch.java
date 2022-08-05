package com.sdsd.mvc.ploGroup.controller;

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
import com.sdsd.mvc.ploGroup.model.service.PloGroupService;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;

@WebServlet("/ploGroup/keySearch")
public class PloGroupKeySearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PloGroupKeySearch() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<PloGroup> ploGroupList = null;
		String spbKeyword = request.getParameter("spbKeyword");
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		
		
		listCount = new PloGroupService().getBoardCount();
		pageInfo = new PageInfo(page, 10, listCount, 9);    
		ploGroupList = new PloGroupService().getSearchList(pageInfo, spbKeyword);
		
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("ploGroupList", ploGroupList);
		request.getRequestDispatcher("/views/ploboard/findClub.jsp").forward(request, response);
		
		}
	

}
