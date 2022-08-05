package com.sdsd.mvc.ploGroup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.ploGroup.model.service.PloGroupService;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;

@WebServlet("/plogroup/noticeinsert")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeInsertServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PloGroup ploGroup = new PloGroup();
		int ploGrNo = 0;
		

		ploGrNo = Integer.parseInt(request.getParameter("spBorNom"));
		ploGroup = new PloGroupService().getNoticeByNo(ploGrNo);
		
		request.setAttribute("ploGroup", ploGroup);
		
		request.getRequestDispatcher("/views/ploboard/uploadClubNotice.jsp").forward(request, response);
	}

}
