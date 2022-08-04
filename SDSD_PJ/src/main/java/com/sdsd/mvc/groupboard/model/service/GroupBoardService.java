package com.sdsd.mvc.groupboard.model.service;

import static com.sdsd.mvc.common.jdbc.JDBCTemplate.close;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.commit;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.sdsd.mvc.common.util.ContentInfo;
import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.groupboard.model.dao.GroupDao;
import com.sdsd.mvc.groupboard.model.vo.GroupBoard;
import com.sdsd.mvc.groupboard.model.vo.GroupReply;
import com.sdsd.mvc.indiboard.model.dao.BoardDao;
import com.sdsd.mvc.indiboard.model.vo.IndiBoard;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;


public class GroupBoardService {

	public int getBoardCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new GroupDao().getBoardCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<GroupBoard> getBoardList(PageInfo pageInfo) {
		List<GroupBoard> groupBoardList = null;
		Connection connection = getConnection();
		
		groupBoardList = new GroupDao().findAll(connection, pageInfo);
		
		return groupBoardList;
	}

	public int save(GroupBoard groupBoard) {
		int result = 0;
		
		Connection connection = getConnection();
		
//		result = new GroupDao().insertgroupBoard(connection, groupBoard);
// 쿼리문 여러개 실행할때는 메소드 두개 만드는게 간편합니다!! service에서 result1,2 두개 받아서 처리만 하면 됩니다
		if(groupBoard.getGroupBorNo() != 0) {
			result = new GroupDao().updateBoard(connection, groupBoard);
		} else {
			result = new GroupDao().insertGroupBoard(connection, groupBoard);
		}		
	
		// if문 처리
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		return result;
	}
	
	public int delete(int groupBorNo) {
		int result =0;
		Connection connection =getConnection();
		
		result = new GroupDao().updateStatus(connection, groupBorNo, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}



	public int saveGroupReply(GroupReply groupreply) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = new GroupDao().insertGroupReply(connection, groupreply);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public int groupreplydelete(int groupBorNo, int no) {
		int result =0;
		Connection connection =getConnection();
		
		result = new GroupDao().updateGroupReplyStatus(connection, groupBorNo, no);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public GroupBoard getGroupBoardByNo(int groupBorNo, boolean hasRead) {
		int result = 0;
		GroupBoard groupBoard = null;
		
		Connection connection = getConnection();
		
		groupBoard = new GroupDao().findBoardByNo(connection, groupBorNo);
		
		if(groupBoard != null && !hasRead) {
			result = new GroupDao().updateReadCount(connection, groupBoard);
			if(result > 0) {
				commit(connection);
			} else {
				rollback(connection);
			}
		}
		close(connection);
			
		return groupBoard;
	}



	
}
