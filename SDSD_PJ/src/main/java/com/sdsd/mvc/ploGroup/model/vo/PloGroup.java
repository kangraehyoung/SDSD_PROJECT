package com.sdsd.mvc.ploGroup.model.vo;

import java.util.List;

import com.sdsd.mvc.indiboard.model.vo.Reply;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class PloGroup {
//	private int ploNum; // 모임 게시글 번호
//	
//	private String ploLeader; // 모임 장
//	
//	private String ploTitle; // 모임 이름
//	
//	private String ploIntro; // 모임 내용 소개
//	
//	private int ploMemNum;	// 회원 번호
//	
//	private String groupBoardFile; // 모임 사진 등록
//	
//	private String local; // 주 활동 지역
//	
//	private String gender; // 성별
//	
//	private int ploNop; // 인원 수
	

	private int spbRowNum; // 행번호
	
	private int spBorNum; // 플로깅 모임 번호
	
	private int spbWriterNum; // 플로깅 작성자 번호
	
	private String spbWriterName; // 플로깅 작성자 이름 or 닉네임..?
	
	private String plogGroupName; // 멤버테이블의 플로깅 모임명
	
	private String email; // 유저이메일
	
	private String spbTitle; // 플로깅 모임명
	
	private String spbContent; // 플로깅 내용
	
	private String spbCreateDate; // 모임 생성 날짜
	
	private String spbUpdateDate; // 모임 수정 날짜
	
	private int spbReadCount; // 조회수
	
	private String spbBorFile; // 첨부파일
	
	private List<String> spbFileList;
	
	private String spbBorStatus; // 모임 존재 여부
	
	private String spbKeyword; // 키워드
	
	private List<Notice> notices;
	
	private String address;
}
