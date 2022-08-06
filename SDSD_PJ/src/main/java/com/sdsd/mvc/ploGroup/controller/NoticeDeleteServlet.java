package com.sdsd.mvc.ploGroup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.indiboard.model.service.IndiBoardService;
import com.sdsd.mvc.ploGroup.model.service.PloGroupService;

@WebServlet("/ploboard/noticeDelete")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		int spBorNum = Integer.parseInt(request.getParameter("spBorNum"));
		int no = Integer.parseInt(request.getParameter("no"));
		
		result = new PloGroupService().noticeDelete(spBorNum, no);
		
		if(result > 0) {
    		request.setAttribute("msg", "공지 삭제 성공");
    		request.setAttribute("location", "/ploboard/findDetail?ploGrNo=" + spBorNum);
		} else {
			request.setAttribute("msg", "공지 삭제 실패");
			request.setAttribute("location", "/ploboard/findDetail?ploGrNo=" + spBorNum);
		}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
	
}
