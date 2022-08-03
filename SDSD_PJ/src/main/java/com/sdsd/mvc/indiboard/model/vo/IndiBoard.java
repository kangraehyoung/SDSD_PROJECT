package com.sdsd.mvc.indiboard.model.vo;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IndiBoard {
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

	private List<String> borFileList;
	
	private String borStatus;
	
	private int maBorNo;
	
	private int maBorId;
	
	private int maWriterNo;
	
	private List<Reply> replies;
	
	private String indikeyword;

}
