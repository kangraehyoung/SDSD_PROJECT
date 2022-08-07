package com.sdsd.mvc.ploGroup.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.sdsd.mvc.indiboard.model.service.IndiBoardService;
import com.sdsd.mvc.indiboard.model.vo.IndiBoard;
import com.sdsd.mvc.member.model.vo.Member;
import com.sdsd.mvc.ploGroup.model.service.PloGroupService;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;

/**
 * Servlet implementation class PloGroupUpdateServlet
 */
@WebServlet("/ploboard/GroupUpdate")
public class PloGroupUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public PloGroupUpdateServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		Member loginMember = session == null ? null : (Member) session.getAttribute("loginMember");
		
		if(loginMember != null) {
		PloGroup ploGroup = null;
		int no = Integer.parseInt(request.getParameter("spBorNum"));
		ploGroup = new PloGroupService().getGroupByNo(no, true);
    	System.out.println(no);
    	//System.out.println(indiBoard);
    	
    	request.setAttribute("ploGroup", ploGroup);
    	//System.out.println("수정페이지로 이동");
		request.getRequestDispatcher("/views/ploboard/updateClub.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result=0;
		PloGroup ploGroup = null;
		// 파일이 저장될 경로
    	String path = getServletContext().getRealPath("/resources/upload/board");
    	
    	// 파일의 최대 사이즈 지정 (10MB)
    	int maxSize = 10485760;
    	
    	// 인코딩 설정
    	String encoding = "UTF-8";
    	
    	// DefaultFileRenamePolicy : 중복되는 이름 뒤에 1 ~ 9999 붙인다.
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding);
    	
    	// update.jsp에는 no값이 없어 input을 hidden으로 숨기고 가져옴
    	//System.out.println(mr.getParameter("no"));
    	
    	
    	
    	ploGroup = new PloGroup();
    	 int no = Integer.parseInt(mr.getParameter("spBorNum"));
    	 String writer = mr.getParameter("nickName");
	     String content = mr.getParameter("content");
	     String pgName = mr.getParameter("pgName");
	     String spbKeyword = mr.getParameter("spbKeyword");
//         String originalFileName = mr.getOriginalFileName("upfile1");
         String address = mr.getParameter("local");
         
    	 String fileName = mr.getOriginalFileName("upfile1") + ", " + mr.getOriginalFileName("upfile2") + ", " + mr.getOriginalFileName("upfile3") + ", " + mr.getOriginalFileName("upfile4");
    	if(fileName != null && !fileName.equals("")) {
    		File file = new File(path + "/" + mr.getParameter("fileName"));
    		
    		if(file.exists()) {
    			file.delete();
    		}
    		
    		ploGroup.setSpbBorFile(fileName);
    	} else {
    		ploGroup.setSpbBorFile(fileName);
    	}
//    	
    	//System.out.println(indiBoard.getBorFile() + "에휴 제발제발");
        HttpSession session = request.getSession(false);
     	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
         
         
         
         if (loginMember != null) {   
         	
        	ploGroup.setSpBorNum(no);
 			ploGroup.setSpbWriterNum(loginMember.getNo());
 			ploGroup.setSpbWriterName(writer);
 			ploGroup.setPlogGroupName(pgName);
 			ploGroup.setSpbContent(content);
 			ploGroup.setSpbBorFile(fileName);
 			ploGroup.setSpbKeyword(spbKeyword);
 			ploGroup.setAddress(address);
 			
 			result = new PloGroupService().createGroup(ploGroup);
 			
 			if (result > 0) {
 				request.setAttribute("msg", "모임 수정 성공");
 	    		request.setAttribute("location", "/views/ploboard/createClubCelebrate.jsp");
 			} else {
 				request.setAttribute("msg", "모임 수정 실패");
 	    		request.setAttribute("location", "/views/ploboard/createClubCelebrate.jsp");
 			}
         } else {
     		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
     		request.setAttribute("location", "/member/login");
     	}
 		System.out.println("플로깅모임수정" + ploGroup);
 		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
 	}
}


