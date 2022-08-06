package com.sdsd.mvc.groupboard.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 플로깅 모임 인증 게시판

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GroupBoard {
	private int borId;
	
	private int writerNo;
	
	private int rowNum;
	
	private String email;
	
	private String writerName; // 닉네임
	
	private String borTitle;
	
	private String borContent;
	
	private String createDate;
	
	private String updateDate;
	
	private int readCount;
	
	private String borFile;
	
	private List<String> borFileList;
	
	private String borStatus;
	
	private int groupBorNo;
	
	private int groupBorId;
	
	private int groupWriterNo;
	
	private List<GroupReply> replies;
	
	private String groupkeyword;
	
	private String groupName; // 모임명

}
