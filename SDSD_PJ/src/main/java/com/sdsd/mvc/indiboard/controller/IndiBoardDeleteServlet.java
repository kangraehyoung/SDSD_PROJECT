package com.sdsd.mvc.indiboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.indiboard.model.service.IndiBoardService;

@WebServlet("/indiboard/indidelete")
public class IndiBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IndiBoardDeleteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	int maBorNo = Integer.parseInt(request.getParameter("maBorNo"));
    	
    	result = new IndiBoardService().delete(maBorNo);
    	
    	if(result > 0) {
    		request.setAttribute("msg", "게시글 삭제 성공");
    		request.setAttribute("location", "/indiboard/indilist");
		} else {
			request.setAttribute("msg", "게시글 삭제 실패");
			request.setAttribute("location", "/indiboard/view?maBorNo=" + maBorNo);
		}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    }


}
