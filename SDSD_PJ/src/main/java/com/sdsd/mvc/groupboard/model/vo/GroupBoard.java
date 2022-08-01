package com.sdsd.mvc.groupboard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 플로깅 모임 인증 게시판 vo

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GroupBoard {
	private int borId;
	
	private int writerNo;
	
	private int rowNum;
	
	private String email;
	
	private String writerName;
	
	private String borTitle;
	
	private String borContent;
	
	private String createDate;
	
	private String updateDate;
	
	private int readCount;
	
	private String borFile;
	
	private String borStatus;
	
	private int groupBorNo;
	
	private int groupBorId;
	
	private int groupWriterNo;
	
//	private String groupName;  모임명 변수를 만들지 안만들지 아직 미정
}
