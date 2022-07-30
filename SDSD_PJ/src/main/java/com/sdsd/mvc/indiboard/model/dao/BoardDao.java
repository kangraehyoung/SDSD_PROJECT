package com.sdsd.mvc.indiboard.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.indiboard.model.vo.IndiBoard;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;

public class BoardDao {

	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) "
						+ "FROM MY_ACT_BOARD M JOIN BOARD B ON (M.MA_WRITER_NUMBER = B.BOR_WRITER_NO) "
						+ "WHERE B.BOR_STATUS = 'Y'";
		
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
		String query = "SELECT RNUM, MA_BOARD_NUMBER, BOR_TITLE, MEM_EMAIL, CREATE_DATE, BOR_FILE, READCOUNT, BOR_STATUS "
						+ "FROM ( "
						+ "    SELECT ROWNUM AS RNUM, "
						+ "       MA_BOARD_NUMBER, "
						+ "       BOR_TITLE, "
						+ "       MEM_EMAIL, "
						+ "       CREATE_DATE, "
						+ "       BOR_FILE, "
						+ "       READCOUNT, "
						+ "       BOR_STATUS "
						+ "    FROM ( "
						+ "        SELECT MA.MA_BOARD_NUMBER, "
						+ "               B.BOR_TITLE, "
						+ "               M.MEM_EMAIL, "
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
				indiBoard.setBorTitle(rs.getString("BOR_TITLE"));
				indiBoard.setEmail(rs.getString("MEM_EMAIL"));
				indiBoard.setCreateDate(rs.getString("CREATE_DATE"));
				indiBoard.setBorFile(rs.getString("BOR_FILE"));
				indiBoard.setReadCount(rs.getInt("READCOUNT"));
				indiBoard.setBorStatus(rs.getString("BOR_STATUS"));
				
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

}
