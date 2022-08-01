package com.sdsd.mvc.indiboard.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.indiboard.model.vo.IndiBoard;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;

import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;

public class BoardDao {

	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstm = null;
		ResultSet rs = null;
//		String query = "SELECT COUNT(*) "
//						+ "FROM MY_ACT_BOARD M JOIN BOARD B ON (M.MA_WRITER_NUMBER = B.BOR_WRITER_NO) "
//						+ "WHERE B.BOR_STATUS = 'Y'";
		String query = "SELECT COUNT(*) "
					+ "FROM MY_ACT_BOARD "
					+ "WHERE MA_BOARD_ID = 1";
		
		try {
			pstm = connection.prepareStatement(query);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}		
		return count;
	}

	public List<IndiBoard> findAll(Connection connection, PageInfo pageInfo) {
		List<IndiBoard> indiboardlist = new ArrayList<>();
		PreparedStatement pstm = null;;
		ResultSet rs = null;
		String query = "SELECT RNUM, MA_BOARD_NUMBER, MA_BOARD_TITLE, MEM_EMAIL, BOR_WRITER_NAME, CREATE_DATE, BOR_FILE, READCOUNT, BOR_STATUS "
				+ " FROM ( "
				+ "    SELECT ROWNUM AS RNUM, "
				+ "       MA_BOARD_NUMBER, "
				+ "       MA_BOARD_TITLE, "
				+ "       MEM_EMAIL, "
				+ "       BOR_WRITER_NAME, "
				+ "       CREATE_DATE, "
				+ "       BOR_FILE, "
				+ "       READCOUNT, "
				+ "       BOR_STATUS "
				+ "    FROM ( "
				+ "        SELECT MA.MA_BOARD_NUMBER, "
				+ "               MA.MA_BOARD_TITLE, "
				+ "               M.MEM_EMAIL, "
				+ "               B.BOR_WRITER_NAME, "
				+ "               B.CREATE_DATE, "
				+ "               B.BOR_FILE, "
				+ "               B.READCOUNT, "
				+ "               B.BOR_STATUS "
				+ "         FROM MY_ACT_BOARD MA "
				+ "         JOIN BOARD B ON (B.BOR_WRITER_NO = MA.MA_WRITER_NUMBER) "
				+ "         JOIN MEMBER M ON (M.MEM_NUMBER = MA.MA_WRITER_NUMBER) "
				+ "        ) "
				+ ") WHERE RNUM BETWEEN ? AND ?";
		
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setInt(1, pageInfo.getStartList());
			pstm.setInt(2, pageInfo.getEndList());
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				IndiBoard indiBoard = new IndiBoard();
				
				indiBoard.setRowNum(rs.getInt("RNUM"));
				indiBoard.setMaBorNo(rs.getInt("MA_BOARD_NUMBER"));
				indiBoard.setBorTitle(rs.getString("MA_BOARD_TITLE"));
				indiBoard.setEmail(rs.getString("MEM_EMAIL"));
				indiBoard.setWriterName(rs.getString("BOR_WRITER_NAME"));
				indiBoard.setCreateDate(rs.getString("CREATE_DATE"));
				indiBoard.setBorFile(rs.getString("BOR_FILE"));
				indiBoard.setReadCount(rs.getInt("READCOUNT"));
				indiBoard.setBorStatus(rs.getString("BOR_STATUS"));
				
				System.out.println(indiBoard.getEmail() + "에후");
				System.out.println(indiBoard.getBorContent() + "에후후후");
				System.out.println(indiBoard.getBorFile() + "에후");
				indiboardlist.add(indiBoard);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		return indiboardlist;
	}

	public int insertIndiBoard(Connection connection, IndiBoard indiBoard) {
		int result = 0;
		//int result2 = 0;
		PreparedStatement pstmt = null;
//		PreparedStatement pstmt2 = null;
		String query_board = "INSERT INTO BOARD VALUES (SEQ_ALL_BOR_NUMBER.NEXTVAL, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?, DEFAULT)";
		//String query_indiBoard = "INSERT INTO MY_ACT_BOARD VALUES(SEQ_MY_BOR_NUM, 1, ?)";
		
		try {
			pstmt = connection.prepareStatement(query_board);
			//pstmt2 = connection.prepareStatement(query_indiBoard);
			
			pstmt.setInt(1, indiBoard.getWriterNo());
			pstmt.setString(2, indiBoard.getWriterName());
			pstmt.setString(3, indiBoard.getBorFile());
			
			//pstmt2.setInt(1, indiBoard.getWriterNo());
			
			result = pstmt.executeUpdate();
			//result2 = pstmt2.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//			close(pstmt2);
			close(pstmt);
		}
		
		return result;
	}

	public int insertIndiBoard2(Connection connection, IndiBoard indiBoard) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "INSERT INTO MY_ACT_BOARD VALUES(SEQ_MA_BOARD_NUMBER.NEXTVAL, 1, ?, '제목넣는공간', ?)";
		// 제목은 jsp 파일 수정 후 넣어야합니다 
		try {
			pstm = connection.prepareStatement(query);
			pstm.setInt(1, indiBoard.getWriterNo());
			pstm.setString(2, indiBoard.getBorContent());

			result = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		return result;
		
	}

	public int updateStatus(Connection connection, int maBorNo, String status) {
		int result = 0;
		PreparedStatement pstm = null;
		String qurey = "UPDATE BOARD SET BOR_STATUS=? WHERE ALL_BOR_NUMBER=?";
		try {
			pstm = connection.prepareStatement(qurey);
			
			pstm.setString(1, status);
			pstm.setInt(2, maBorNo);
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
	
		return result;
	}


	public IndiBoard findBoardByNo(Connection connection, int maBorNo) {
		IndiBoard indiBoard = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT MA.MA_BOARD_NUMBER, "
				+ "       MA.MA_BOARD_TITLE, "
				+ "       MA.MA_BOARD_CONTENT, "
				+ "       M.MEM_NICKNAME, "
				+ "       B.READCOUNT, "
				+ "       B.BOR_FILE, "
				+ "       B.CREATE_DATE, "
				+ "       B.UPDATE_DATE "
				+ "FROM MY_ACT_BOARD MA "
				+ "JOIN MEMBER M ON(MA.MA_WRITER_NUMBER = M.MEM_NUMBER) "
				+ "JOIN BOARD B ON(B.BOR_WRITER_NO = MA.MA_WRITER_NUMBER) "
				+ "WHERE B.BOR_STATUS = 'Y' AND MA.MA_BOARD_NUMBER = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, maBorNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				indiBoard = new IndiBoard();
				
				indiBoard.setMaBorNo(rs.getInt("MA_BOARD_NUMBER"));
				indiBoard.setBorTitle(rs.getString("MA_BOARD_TITLE"));
				indiBoard.setBorContent(rs.getString("MA_BOARD_CONTENT"));
				indiBoard.setWriterName(rs.getString("MEM_NICKNAME"));
				indiBoard.setReadCount(rs.getInt("READCOUNT"));
				indiBoard.setBorFile(rs.getString("BOR_FILE"));
				indiBoard.setCreateDate(rs.getString("CREATE_DATE"));
				indiBoard.setUpdateDate(rs.getString("UPDATE_DATE"));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return indiBoard;
	}

	public int updateReadCount(Connection connection, IndiBoard indiBoard) {
		// TODO Auto-generated method stub
		return 0;
	}

}
