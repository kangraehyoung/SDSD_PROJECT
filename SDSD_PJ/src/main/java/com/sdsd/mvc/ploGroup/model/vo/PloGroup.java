package com.sdsd.mvc.ploGroup.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class PloGroup {
	private int ploNum;
	
	private String pploLeader;
	
	private String ploTitle;
	
	private String ploIntro;
	
	private int ploMemNum;
}
