package com.sdsd.mvc.ploGroup.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.member.model.vo.Member;
import com.sdsd.mvc.ploGroup.model.service.PloGroupService;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;

@WebServlet("/ploGroup/myPloging")
public class MyPlogingSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPlogingSearchServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<PloGroup> ploGroupList = null;
		String plogGroupName = request.getParameter("plogGroupName");
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1;
		}
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {
    		PloGroup plogroup = new PloGroup();
    		plogroup.setPlogGroupName(loginMember.getMyPloging());
    	}
		
		System.out.println(plogGroupName);
		listCount = new PloGroupService().getBoardCount();
		pageInfo = new PageInfo(page, 10, listCount, 9);    
		ploGroupList = new PloGroupService().getSearchMyPloging(pageInfo, plogGroupName);
		
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("ploGroupList", ploGroupList);
		request.getRequestDispatcher("/views/ploboard/findClub.jsp").forward(request, response);
		
		}
	

}
