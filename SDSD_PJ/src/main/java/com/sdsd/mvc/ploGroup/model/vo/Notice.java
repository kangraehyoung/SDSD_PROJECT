package com.sdsd.mvc.ploGroup.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int no;
	
	private int noticeBorNo;
	
	private int noticeWriterNo;
	
	private String noticeWriterId;
	
	private String noticeContent;	
	
	private Date noticeCreateDate;
	
	private Date noticeModifyDate;
	
	private int noticeCount;
}
