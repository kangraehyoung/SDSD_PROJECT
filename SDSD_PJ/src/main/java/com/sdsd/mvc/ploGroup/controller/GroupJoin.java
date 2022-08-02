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

@WebServlet("/plo/groupjoin")
public class GroupJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GroupJoin() {
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
		
        plogroup.setPloMemNum(Integer.parseInt(mr.getParameter("no")));
		plogroup.setPloLeader(mr.getParameter("ploLeader"));
		plogroup.setPloTitle(mr.getParameter("ploTitle"));
		plogroup.setPloIntro(mr.getParameter("ploIntro"));
//		plogroup.setPloMemNum(Integer.parseInt(request.getParameter("plo_memNum")));
		plogroup.setGroupBoardFile(mr.getParameter("groupBoardFile"));
		plogroup.setLocal(mr.getParameter("local"));
		plogroup.setGender(mr.getParameter("gender"));
//		plogroup.setPloNop(Integer.parseInt(request.getParameter("ploNop")));
		
		int result = new PloGroupService().groupJoin(plogroup);
		
		if (result > 0) {
			request.setAttribute("msg", "모임 등록 성공");
    		request.setAttribute("location", "/club");
		} else {
			request.setAttribute("msg", "모임 등록 실패");
    		request.setAttribute("location", "/");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
