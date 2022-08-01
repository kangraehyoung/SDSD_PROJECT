package com.sdsd.mvc.groupboard.model.service;

import java.sql.Connection;
import java.util.List;

import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.groupboard.model.dao.GroupDao;
import com.sdsd.mvc.groupboard.model.vo.GroupBoard;

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


}
