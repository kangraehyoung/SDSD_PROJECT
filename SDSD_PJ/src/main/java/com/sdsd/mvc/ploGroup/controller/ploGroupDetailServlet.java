package com.sdsd.mvc.ploGroup.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.common.util.ContentInfo;
import com.sdsd.mvc.groupboard.model.service.GroupBoardService;
import com.sdsd.mvc.groupboard.model.vo.GroupBoard;
import com.sdsd.mvc.ploGroup.model.service.PloGroupService;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;


@WebServlet("/ploboard/findDetail")
public class ploGroupDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ploGroupDetailServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PloGroup ploGroup  = null;
    	int ploGrNo = 0;
    	// 이전, 다음 페이지 이동
    	ContentInfo contentInfo = null;
    	List<PloGroup> ploGroupList = null;
    	
	    	try {
	    		ploGrNo = Integer.parseInt(request.getParameter("ploGrNo"));
	    		System.out.println(ploGrNo);
	    	} catch (NumberFormatException e) {
	    		ploGrNo = 1;
	    	}
	    	
    	contentInfo = new ContentInfo(ploGrNo);
    	ploGroupList = new PloGroupService().getGroupContent(contentInfo);
    	
    	request.setAttribute("contentInfo", contentInfo);
    	request.setAttribute("groupboardlist", ploGroupList);
    	
    	// 새로 고침 시 조회 수가 증가하는 것을 방치하는 로직
    	// 쿠키에 조회한 게시글의 번호를 기록하여 한 번 조회하면 그 뒤에는 조회 수가 올라가지 않도록 설정
    	// 1. 쿠키에 조회한 이력이 있는지 확인
    	Cookie[] cookies = request.getCookies();
    	String boardHistory = ""; // 조회한 게시글 번호를 저장하는 변수
    	boolean hasRead = false; // 읽은 글이면 true, 안 읽었으면 false
    	
    	if(cookies != null) {
    		String name = null;
    		String value = null;
    		for (Cookie cookie : cookies) {
				name = cookie.getName();
				value = cookie.getValue();
				
				// boardHistroy인 쿠키 값을 찾기
				if(name.equals("boardHistory")) {
					boardHistory = value;
					
					if(value.contains("|" + ploGrNo + "|")) {
						hasRead = true;
						
						break;
					}
				}
			}
    	}
    	// 2. 읽지 않은 게시글이면 cookie 에 기록
    	if(!hasRead) {
        	Cookie cookie = new Cookie("boardHistory", boardHistory + "|" + ploGrNo + "|");
        	
        	cookie.setMaxAge(-1); // 브라우저 종료 시 삭제
        	response.addCookie(cookie);
    	}
    	
    	ploGroup = new PloGroupService().getGroupByNo(ploGrNo, hasRead);
    	
    	System.out.println(ploGroup);
    	
    	request.setAttribute("ploGroup", ploGroup);
    	request.getRequestDispatcher("/views/ploboard/viewClub.jsp").forward(request, response);
    }

}
