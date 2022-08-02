package com.sdsd.mvc.groupboard.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GroupReply {
	private int no;
	
	private int repboardNo;
	
	private int repwriterNo;
	
	private String repwriterId;
	
	private String repcontent;	
	
	private Date repcreateDate;
	
	private Date repmodifyDate;
	
	private int replyCount;
}
