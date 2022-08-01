package com.sdsd.mvc.groupboard.model.service;

import java.sql.Connection;
import java.util.List;

import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.groupboard.model.dao.GroupDao;
import com.sdsd.mvc.groupboard.model.vo.GroupBoard;
import com.sdsd.mvc.indiboard.model.dao.BoardDao;

import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;

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


}
