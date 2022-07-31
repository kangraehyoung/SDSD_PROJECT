package com.sdsd.mvc.indiboard.model.service;

import java.sql.Connection;
import java.util.List;

import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.indiboard.model.dao.BoardDao;
import com.sdsd.mvc.indiboard.model.vo.IndiBoard;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;

public class IndiBoardService {

	public int getBoardCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new BoardDao().getBoardCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<IndiBoard> getBoardList(PageInfo pageInfo) {
		List<IndiBoard> indiboardlist = null;
		Connection connection = getConnection();
		
		indiboardlist = new BoardDao().findAll(connection, pageInfo);
		
		close(connection);
		return indiboardlist;
	}

	public int save(IndiBoard indiBoard) {
		int result = 0;
		int result2 = 0;
		Connection connection = getConnection();
		
		result = new BoardDao().insertIndiBoard(connection, indiBoard);
		result2 = new BoardDao().insertIndiBoard2(connection, indiBoard);
		
		System.out.println("result" + result);
		System.out.println("result2" + result2);
		
		if(result > 0 && result2 > 0) {
            commit(connection);
            
        } else {
            rollback(connection);
        }
		

        close(connection);		
		return result;
	}

}
