package com.sdsd.mvc.indiboard.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.indiboard.model.vo.IndiBoard;

import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;

public class BoardDao {

	public int getBoardCount(Connection connection) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<IndiBoard> findAll(Connection connection, PageInfo pageInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertIndiBoard(Connection connection, IndiBoard indiBoard) {
		int result = 0;
		int result2 = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String query_board = "INSERT INTO BOARD VALUES (1, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?, DEFAULT)";
		String query_indiBoard = "INSERT INTO MY_ACT_BOARD VALUES(SEQ_MY_BOR_NUM, 1, ?)";
		
		try {
			pstmt = connection.prepareStatement(query_board);
			pstmt2 = connection.prepareStatement(query_indiBoard);
			
			pstmt.setInt(1, indiBoard.getWriterNo());
			pstmt.setString(2, indiBoard.getWriterName());
			pstmt.setString(3, indiBoard.getBorTitle());
			pstmt.setString(4, indiBoard.getBorContent());
			pstmt.setString(5, "파일넣어야함");
			
			pstmt2.setInt(1, indiBoard.getWriterNo());
			
			result = pstmt.executeUpdate();
			result2 = pstmt2.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt2);
			close(pstmt);
		}
		
		return result + result2;
	}

}
