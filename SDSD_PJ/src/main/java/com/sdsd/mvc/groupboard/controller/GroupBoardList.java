package com.sdsd.mvc.groupboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.groupboard.model.service.GroupBoardService;
import com.sdsd.mvc.groupboard.model.vo.GroupBoard;

@WebServlet("/groupboard/grouplist")
public class GroupBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public GroupBoardList() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<GroupBoard> groupBoardList = null;
    	
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
    		page = 1;
    	}
    	
    	listCount = new GroupBoardService().getBoardCount();
    	pageInfo = new PageInfo(page, 8, listCount, 8);
    	groupBoardList = new GroupBoardService().getBoardList(pageInfo);
    	
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("groupBoardList", groupBoardList);
    	request.getRequestDispatcher("/views/ploboard/clubPlogBoard.jsp").forward(request, response);
    }


}
