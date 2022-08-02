package com.sdsd.mvc.groupboard.model.service;

import static com.sdsd.mvc.common.jdbc.JDBCTemplate.close;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.commit;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.groupboard.model.dao.GroupDao;
import com.sdsd.mvc.groupboard.model.vo.GroupBoard;

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
		
		result = new GroupDao().insertgroupBoard(connection, groupBoard);
	
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

	public GroupBoard getBoardByNo(int groupBorNo, boolean hasRead) {
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


