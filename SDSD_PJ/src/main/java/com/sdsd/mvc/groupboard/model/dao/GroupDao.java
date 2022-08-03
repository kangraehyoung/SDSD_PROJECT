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
import com.sdsd.mvc.groupboard.model.vo.GroupReply;

// 플로깅 모임 게시판 인증 Dao
public class GroupDao {

	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT COUNT(*) "
				+ "FROM GROUPBOARD ";
		
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
		String query = "SELECT *  "
				+ "FROM ( "
				+ "    SELECT ROWNUM AS RNUM, "
				+ "           GROUPBOR_NUMBER, "
				+ "           GROUPBOR_TITLE, "
				+ "           MEM_EMAIL, "
				+ "           GROUPBOR_WRITER_NAME, "
				+ "           GROUP_CREATE_DATE, "
				+ "           GROUP_UPDATE_DATE, "
				+ "           GROUP_BOR_FILE, "
				+ "           GROUP_READCOUNT, "
				+ "           GROUP_BOR_STATUS "
				+ "    FROM ( "
				+ "            SELECT GB.GROUPBOR_NUMBER, "
				+ "                   GB.GROUPBOR_TITLE, "
				+ "                   M.MEM_EMAIL, "
				+ "                   GB.GROUPBOR_WRITER_NAME, "
				+ "                   GB.GROUP_CREATE_DATE, "
				+ "                   GB.GROUP_UPDATE_DATE, "
				+ "                   GB.GROUP_BOR_FILE, "
				+ "                   GB.GROUP_READCOUNT, "
				+ "                   GB.GROUP_BOR_STATUS "
				+ "            FROM GROUPBOARD GB "
				+ "            JOIN MEMBER M ON (M.MEM_NUMBER = GB.GROUPBOR_WRITER_NO) "
				+ "    ) "
				+ ") WHERE (RNUM BETWEEN ? AND ?) AND GROUP_BOR_STATUS = 'Y'";
		
		
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
		String query = "INSERT INTO GROUPBOARD VALUES(SEQ_GROUPBOR_NUMBER.NEXTVAL, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?, DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, groupBoard.getWriterNo());
			pstmt.setString(2, groupBoard.getWriterName());
			pstmt.setString(3, groupBoard.getGroupName());
			pstmt.setString(4, groupBoard.getBorTitle());
			pstmt.setString(5, groupBoard.getBorContent());
			pstmt.setString(6, groupBoard.getBorFile());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
		
		
	public int updateStatus(Connection connection, int groupBorNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String qurey = "UPDATE GROUPBOARD SET GROUP_BOR_STATUS=? WHERE GROUPBOR_NUMBER=?";
		try {
			pstmt = connection.prepareStatement(qurey);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, groupBorNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public GroupBoard findBoardByNo(Connection connection, int groupBorNo) {
		GroupBoard groupBoard = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * "
					+ "FROM GROUPBOARD IB "
					+ "JOIN MEMBER M ON(IB.GROUPBOR_WRITER_NO = M.MEM_NUMBER) "
					+ "WHERE IB.GROUP_BOR_STATUS = 'Y' AND GROUPBOR_NUMBER = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, groupBorNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				groupBoard = new GroupBoard();
				
				groupBoard.setGroupBorNo(rs.getInt("GROUPBOR_NUMBER"));
				groupBoard.setBorTitle(rs.getString("GROUPBOR_TITLE"));
				groupBoard.setBorContent(rs.getString("GROUPBOR_CONTENT"));
				groupBoard.setWriterName(rs.getString("GROUPBOR_WRITER_NAME"));
				groupBoard.setReadCount(rs.getInt("GROUP_READCOUNT"));
				groupBoard.setBorFile(rs.getString("GROUP_BOR_FILE"));
				groupBoard.setCreateDate(rs.getString("GROUP_CREATE_DATE"));
				groupBoard.setUpdateDate(rs.getString("GROUP_UPDATE_DATE"));
				
//				groupBoard.setReplies(this.getRepliesByNo(connection, groupBorNo));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return groupBoard;
	}

	public int updateReadCount(Connection connection, GroupBoard groupBoard) {
		int result =0;
		PreparedStatement pstmt = null;
		String query = "UPDATE GROUPBOARD SET GROUP_READCOUNT=? WHERE GROUPBOR_NUMBER=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			groupBoard.setReadCount(groupBoard.getReadCount() + 1);
			
			pstmt.setInt(1, groupBoard.getReadCount());
			pstmt.setInt(2, groupBoard.getGroupBorNo());
			
			result = pstmt.executeUpdate();
			System.out.println("몰라" + groupBoard.getReadCount());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertGroupReply(Connection connection, GroupReply groupreply) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "INSERT INTO GBREPLY VALUES(SEQ_GBREP_NUMBER.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setInt(1, groupreply.getRepboardNo());
			pstm.setInt(2, groupreply.getRepwriterNo());
			pstm.setString(3, groupreply.getRepcontent());
			result = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		return result;
	}

	public int updateGroupReplyStatus(Connection connection, int groupBorNo, int no) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE GBREPLY SET IBREP_STATUS ='N' WHERE GBREP_NUMBER=? AND GBREP_BOR_NUMBER=?";
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setInt(1, no);
			pstm.setInt(2, groupBorNo);
			result = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		return result;
	}
	
}