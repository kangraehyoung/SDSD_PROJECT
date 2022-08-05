package com.sdsd.mvc.ploGroup.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sdsd.mvc.member.model.vo.Member;
import com.sdsd.mvc.ploGroup.model.service.PloGroupService;
import com.sdsd.mvc.ploGroup.model.vo.Notice;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;

@WebServlet("/ploboard/notice")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PloGroupService service = new PloGroupService();
    public NoticeServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeBorNo = Integer.parseInt(request.getParameter("noticeBorNo"));
		String noticeContent = request.getParameter("noticeContent");
		
		HttpSession session = request.getSession(false);
		Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
    	
    	if(loginMember != null) {
    		Notice notice = new Notice();
    		
    		notice.setNoticeBorNo(noticeBorNo);
    		notice.setNoticeWriterNo(loginMember.getNo());
    		notice.setNoticeWriterId(loginMember.getEmail());
    		notice.setNoticeContent(noticeContent);
    		
    		int result = service.saveNotice(notice);
    		
    		if(result > 0) {
         		request.setAttribute("msg", "공지사항 등록 성공!");
         		request.setAttribute("location", "/ploboard/findDetail?ploGrNo=" + noticeBorNo);
			} else {
				request.setAttribute("msg", "공지사항 등록 실패!");
         		request.setAttribute("location", "/ploboard/findDetail?ploGrNo=" + noticeBorNo);
			}
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
	}

}
