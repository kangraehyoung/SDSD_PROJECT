package com.sdsd.mvc.ploGroup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.indiboard.model.service.IndiBoardService;
import com.sdsd.mvc.ploGroup.model.service.PloGroupService;

@WebServlet("/ploboard/deleteGroup")
public class ploGroupDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ploGroupDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	int spBorNum = Integer.parseInt(request.getParameter("spBorNum"));
    	
    	result = new PloGroupService().deleteGroup(spBorNum);
    	
    	System.out.println("딜리트 시작");
    	
    	if(result > 0) {
    		request.setAttribute("msg", "모임 삭제 성공");
    		request.setAttribute("location", "/ploboard/ploGroupList");
		} else {
			request.setAttribute("msg", "모임 삭제 실패");
			request.setAttribute("location", "/ploboard/GroupUpdate?spBorNum=" + spBorNum);
		}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

	}


}
