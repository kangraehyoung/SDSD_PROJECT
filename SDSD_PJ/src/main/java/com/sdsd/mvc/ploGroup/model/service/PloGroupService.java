package com.sdsd.mvc.ploGroup.model.service;

import com.sdsd.mvc.common.util.ContentInfo;
import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.indiboard.model.dao.BoardDao;
import com.sdsd.mvc.indiboard.model.vo.IndiBoard;
import com.sdsd.mvc.member.model.dao.MemberDao;
import com.sdsd.mvc.member.model.vo.Member;
import com.sdsd.mvc.ploGroup.model.dao.PloGroupDao;
import com.sdsd.mvc.ploGroup.model.vo.Notice;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;

import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

public class PloGroupService {

	public int createGroup(PloGroup plogroup) {
		int result = 0;
		int result2 = 0;
		
		Connection connection = getConnection();
		System.out.println("모임넘버가 이상해 : " + plogroup.getSpBorNum());
		
		if(plogroup.getSpBorNum() != 0) {
			result = new PloGroupDao().updateGroup(connection, plogroup);
			result2 = new PloGroupDao().memberGroupUpdate(connection, plogroup);
		} else {
			result = new PloGroupDao().save(connection, plogroup);
			result2 = new PloGroupDao().memberGroupUpdate(connection, plogroup);
		}
		
//		result = new PloGroupDao().save(connection, plogroup);
//		System.out.println("result" + result);
//		result2 = new PloGroupDao().memberGroupUpdate(connection, plogroup);
//		System.out.println("result2 : " + result);
		if(result > 0 && result2 > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		return result + result2;
	}


	public int getBoardCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new PloGroupDao().getBoardCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<PloGroup> getBoardList(PageInfo pageInfo) {
		List<PloGroup> ploGroupList = null;
		Connection connection = getConnection();
		
		ploGroupList = new PloGroupDao().findAll(connection, pageInfo);
		
		close(connection);
		return ploGroupList;
	}


	public int joinGroup(PloGroup plogroup, Member loginMember) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new PloGroupDao().join(connection, plogroup, loginMember);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		return result;
	}
	
	public List<PloGroup> getGroupContent(ContentInfo contentInfo) {
		List<PloGroup> ploGroupList = null;
		Connection connection = getConnection();
		
		ploGroupList = new PloGroupDao().findNextContent(connection, contentInfo);
		
		close(connection);
		return ploGroupList;
	}


	public PloGroup getGroupByNo(int ploGrNo, boolean hasRead) {
		int result = 0;
		PloGroup ploGroup = null;
		
		Connection connection = getConnection();
		
		ploGroup = new PloGroupDao().findGroupByNo(connection, ploGrNo);
		
		if(ploGroup != null && !hasRead) {
			result = new PloGroupDao().updateReadCount(connection, ploGroup);
			if(result > 0) {
				commit(connection);
			} else {
				rollback(connection);
			}
		}
		close(connection);
		
		return ploGroup;
	}


	public int deleteGroup(int spBorNum) {
		int result =0;
		Connection connection =getConnection();
		
		result = new PloGroupDao().updateStatus(connection, spBorNum, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int saveNotice(Notice notice) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = new PloGroupDao().insertNotice(connection, notice);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}


	public PloGroup getNoticeByNo(int ploGrNo) {
		int result = 0;
		PloGroup ploGroup = null;
		
		Connection connection = getConnection();
		
		ploGroup = new PloGroupDao().findGroupByNo(connection, ploGrNo);
		
		
			if(result > 0) {
				commit(connection);
			} else {
				rollback(connection);
			}
		
		close(connection);
		
		return ploGroup;

	}


	public int deleteMember(int no) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new PloGroupDao().updateMemberStatus(connection, no, "플로깅모임없음");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		return result;
	}


	public List<PloGroup> getSearchList(PageInfo pageInfo, String spbKeyword) {
		List<PloGroup> ploGroupList = null;
		Connection connection = getConnection();
		ploGroupList = new PloGroupDao().keySearch(connection, spbKeyword);
		close(connection);
		return ploGroupList;
	}


	public int noticeDelete(int spBorNum, int no) {
		int result =0;
		Connection connection =getConnection();
		
		result = new PloGroupDao().updateNoticeStatus(connection, spBorNum, no);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}


	public List<PloGroup> getSearchMyPloging(PageInfo pageInfo, String plogGroupName) {
		List<PloGroup> ploGroupList = null;
		Connection connection = getConnection();
		ploGroupList = new PloGroupDao().myPlogingSearch(connection, plogGroupName);
		close(connection);
		return ploGroupList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
