package com.sdsd.mvc.ploGroup.model.service;

import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.indiboard.model.dao.BoardDao;
import com.sdsd.mvc.indiboard.model.vo.IndiBoard;
import com.sdsd.mvc.ploGroup.model.dao.PloGroupDao;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;

import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

public class PloGroupService {

	public int groupJoin(PloGroup plogroup) {
		int result = 0;
		int result2 = 0;
		
		Connection connection = getConnection();
		
		result = new PloGroupDao().save(connection, plogroup);
		System.out.println("result" + result);
		result2 = new PloGroupDao().memberGroupUpdate(connection, plogroup);
		System.out.println("result2 : " + result);
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
	

}
