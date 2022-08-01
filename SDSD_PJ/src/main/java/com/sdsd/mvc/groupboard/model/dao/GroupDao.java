package com.sdsd.mvc.groupboard.model.dao;

import static com.sdsd.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.groupboard.model.vo.GroupBoard;

// 플로깅 모임 게시판 인증 Dao
public class GroupDao {

	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT COUNT(*) FROM GROUP_ACT_BOARD WHERE GROUP_BOARD_ID = 1";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return count;
	}

	public List<GroupBoard> findAll(Connection connection, PageInfo pageInfo) {
		List<GroupBoard> groupBoardList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GroupBoard groupBoard = new GroupBoard();
				
				groupBoard.setRowNum(rs.getInt("RNUM"));
				groupBoard.setGroupBorNo(rs.getInt("GROUP_BOARD_NUMBER"));
				groupBoard.setBorTitle(rs.getString("GROUP_BOARD_TITLE"));
				groupBoard.setEmail(rs.getString("MEM_EMAIL"));
				groupBoard.setWriterName(rs.getString("BOR_WRITER_NAME"));
				groupBoard.setCreateDate(rs.getString("CREATE_DATE"));
				groupBoard.setBorFile(rs.getString("BOR_FILE"));
				groupBoard.setReadCount(rs.getInt("READCOUNT"));
				groupBoard.setBorStatus(rs.getString("BOR_STATUS"));
				
				groupBoardList.add(groupBoard);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return groupBoardList;
	}

	public int insertgroupBoard(Connection connection, GroupBoard groupBoard) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO GROUPBOARD VALUES(SEQ_INDIBOR_NUMBER.NEXTVAL, ?, ?, '제목넣어야함', ?, DEFAULT, DEFAULT, DEFAULT, ?, DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return result;
	}

	
}