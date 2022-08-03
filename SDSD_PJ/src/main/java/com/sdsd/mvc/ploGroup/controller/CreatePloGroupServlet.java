package com.sdsd.mvc.ploGroup.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.sdsd.mvc.ploGroup.model.service.PloGroupService;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;

import oracle.net.aso.p;

@WebServlet("/plogroup/createPloGroup")
public class CreatePloGroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreatePloGroupServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/ploboard/createClub.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PloGroup plogroup = new PloGroup();
		
		String path = getServletContext().getRealPath("/resources/upload/board");

        // 파일의 최대 사이즈 지정 (10MB)
        int maxSize = 10485760;

        // 인코딩 설정
        String encoding = "UTF-8";

        MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding);
		
		plogroup.setSpbWriterNum(Integer.parseInt(mr.getParameter("leaderNo")));
		plogroup.setSpbWriterName(mr.getParameter("leader"));
		plogroup.setPlogGroupName(mr.getParameter("ploTitle"));
		plogroup.setSpbTitle(mr.getParameter("ploTitle"));
		plogroup.setSpbContent(mr.getParameter("ploIntro"));
		plogroup.setSpbBorFile(mr.getParameter("spbBorFile"));
//		plogroup.setLocal(mr.getParameter("local"));
//		plogroup.setGender(mr.getParameter("gender"));
		
		int result = new PloGroupService().groupJoin(plogroup);
		
		if (result > 0) {
			request.setAttribute("msg", "모임 등록 성공");
    		request.setAttribute("location", "/views/ploboard/createClubCelebrate.jsp");
		} else {
			request.setAttribute("msg", "모임 등록 실패");
    		request.setAttribute("location", "/");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
