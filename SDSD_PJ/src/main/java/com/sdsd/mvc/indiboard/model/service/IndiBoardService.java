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
//		int result2 = 0;
		Connection connection = getConnection();
		
		// 쿼리문 여러개 실행할때는 메소드 두개 만드는게 간편합니다!! service에서 result1,2 두개 받아서 처리만 하면 됩니다
		
		result = new BoardDao().insertIndiBoard(connection, indiBoard);
//		result2 = new BoardDao().insertIndiBoard2(connection, indiBoard);
		
		System.out.println("result" + result); // 참고용
//		System.out.println("result2" + result2); // 참고용
		
		// if문 처리
		if(result > 0) {
            commit(connection);
            
        } else {
            rollback(connection);
        }
		

        close(connection);		
		return result;
	}

	public int delete(int maBorNo) {
		int result =0;
		Connection connection =getConnection();
		
		result = new BoardDao().updateStatus(connection, maBorNo, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public IndiBoard getBoardByNo(int maBorNo, boolean hasRead) {
		int result = 0;
		IndiBoard indiBoard = null;
		
		Connection connection = getConnection();
		
		indiBoard = new BoardDao().findBoardByNo(connection, maBorNo);
		
		if(indiBoard != null && !hasRead) {
			result = new BoardDao().updateReadCount(connection, indiBoard);
			if(result > 0) {
				commit(connection);
			} else {
				rollback(connection);
			}
		}
		close(connection);
		
		return indiBoard;
	}
}
