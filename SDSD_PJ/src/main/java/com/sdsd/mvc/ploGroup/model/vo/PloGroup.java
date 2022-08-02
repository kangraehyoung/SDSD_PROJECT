package com.sdsd.mvc.ploGroup.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class PloGroup {
	private int ploNum; // 모임 게시글 번호
	
	private String ploLeader; // 모임 장
	
	private String ploTitle; // 모임 이름
	
	private String ploIntro; // 모임 내용 소개
	
	private int ploMemNum;	// 회원 번호
	
	private String groupBoardFile; // 모임 사진 등록
	
	private String local; // 주 활동 지역
	
	private String gender; // 성별
	
	private int ploNop; // 인원 수
	
}
