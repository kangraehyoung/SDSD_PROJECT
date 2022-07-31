package com.sdsd.mvc.ploGroup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.ploGroup.model.service.PloGroupService;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;

@WebServlet("/plo/groupjoin")
public class GroupJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GroupJoin() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PloGroup plogroup = new PloGroup();
		
		plogroup.setPloLeader(request.getParameter("plo_leader"));
		plogroup.setPloTitle(request.getParameter("plo_title"));
		plogroup.setPloIntro(request.getParameter("plo_intro"));
		plogroup.setPloMemNum(Integer.parseInt(request.getParameter("plo_memNum")));
		
		int result = new PloGroupService().groupJoin(plogroup);
		
		if (result > 0) {
			request.setAttribute("msg", "모임 등록 성공");
    		request.setAttribute("location", "/");
		} else {
			request.setAttribute("msg", "모임 등록 실패");
    		request.setAttribute("location", "/");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
