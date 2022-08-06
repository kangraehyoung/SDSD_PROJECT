package com.sdsd.mvc.others.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Rank {
 // 개인 활동 랭킹
	private int indiRankNo;
	
	private String indiNickName;
	
	private int indiCount;
// 플로깅 모임 인증 랭킹
	private String ploGroupNickname;
	
	private int ploGroupCount;
}
