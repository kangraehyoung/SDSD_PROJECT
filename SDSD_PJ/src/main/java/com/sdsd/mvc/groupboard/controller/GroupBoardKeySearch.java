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


@WebServlet("/groupboard/groupkeysearch")
public class GroupBoardKeySearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public GroupBoardKeySearch() {
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<GroupBoard> groupboardlist = null;
		String groupkeyword = request.getParameter("groupkeyword");
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		
		
		listCount = new GroupBoardService().getBoardCount();
		pageInfo = new PageInfo(page, 10, listCount, 8);    
		groupboardlist = new GroupBoardService().getSearchList(pageInfo, groupkeyword);
		System.out.println("키워드 테스트" + groupboardlist);
		System.out.println("키워드");
		//System.out.println(" 1 " + listCount);
		//System.out.println(" 2 " + pageInfo);
		//System.out.println(" 3 " + groupboardlist);
		
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("groupBoardList", groupboardlist);
		request.getRequestDispatcher("/views/ploboard/clubPlogBoard.jsp").forward(request, response);
		
		}

}
