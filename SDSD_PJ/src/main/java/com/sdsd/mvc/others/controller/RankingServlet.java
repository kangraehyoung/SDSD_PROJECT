package com.sdsd.mvc.others.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sdsd.mvc.others.model.service.rankService;
import com.sdsd.mvc.others.vo.Rank;

@WebServlet("/others/ranking")
public class RankingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RankingServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Rank rank = null;
    	
    	List<Rank> rankList = null;
    	List<Rank> rankList1 = null;
    	
    	rankList = new rankService().getMember(rank); 
    	rankList1 = new rankService().getMember1(rank); 
    	
    	System.out.println(rankList);
    	System.out.println(rankList1);
    	request.setAttribute("rank", rank);
    	request.setAttribute("rankList", rankList);
    	request.setAttribute("rankList1", rankList1);
    	request.getRequestDispatcher("/views/others/Ranking.jsp").forward(request, response);
    	
    }
    
    
}
