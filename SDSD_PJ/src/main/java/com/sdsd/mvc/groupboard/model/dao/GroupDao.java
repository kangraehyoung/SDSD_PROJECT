
package com.sdsd.mvc.groupboard.model.dao;

import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.sdsd.mvc.common.util.ContentInfo;
import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.groupboard.model.vo.GroupBoard;
import com.sdsd.mvc.groupboard.model.vo.GroupReply;

// 플로깅 모임 게시판 인증 
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
				String[] arr = new String[3];
				List<String> list = groupBoard.getBorFileList();
				
				
				groupBoard.setRowNum(rs.getInt("RNUM"));
				groupBoard.setGroupBorNo(rs.getInt("GROUPBOR_NUMBER"));
				groupBoard.setBorTitle(rs.getString("GROUPBOR_TITLE"));
				groupBoard.setEmail(rs.getString("MEM_EMAIL"));
				groupBoard.setWriterName(rs.getString("GROUPBOR_WRITER_NAME"));
				groupBoard.setCreateDate(rs.getString("GROUP_CREATE_DATE"));
				groupBoard.setBorFile(rs.getString("GROUP_BOR_FILE"));
				groupBoard.setReadCount(rs.getInt("GROUP_READCOUNT"));
				groupBoard.setBorStatus(rs.getString("GROUP_BOR_STATUS"));
				arr = groupBoard.getBorFile().split(", ");
				list = Arrays.asList(arr);
				
				groupBoard.setBorFileList(list);
				
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

	public int insertGroupBoard(Connection connection, GroupBoard groupBoard) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO GROUPBOARD VALUES(SEQ_GROUPBOR_NUMBER.NEXTVAL, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?, DEFAULT, ?, ?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, groupBoard.getWriterNo()); // 회원 ID
			pstmt.setString(2, groupBoard.getWriterName()); // 작성자
			pstmt.setString(3, groupBoard.getBorTitle()); // 제목
			pstmt.setString(4, groupBoard.getBorContent()); // 내용
			pstmt.setString(5, groupBoard.getBorFile()); // 첨부파일
			pstmt.setString(6, groupBoard.getGroupkeyword()); // 키워드
			pstmt.setString(7, groupBoard.getGroupName()); // 모임명
			
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
					+ "FROM GROUPBOARD GB "
					+ "JOIN MEMBER M ON(GB.GROUPBOR_WRITER_NO = M.MEM_NUMBER) "
					+ "WHERE GB.GROUP_BOR_STATUS = 'Y' AND GROUPBOR_NUMBER = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, groupBorNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				groupBoard = new GroupBoard();
				
				String[] arr = new String[3];
				List<String> list = groupBoard.getBorFileList();
				
				groupBoard.setGroupBorNo(rs.getInt("GROUPBOR_NUMBER"));
				groupBoard.setBorTitle(rs.getString("GROUPBOR_TITLE"));
				groupBoard.setBorContent(rs.getString("GROUPBOR_CONTENT"));
				groupBoard.setWriterName(rs.getString("GROUPBOR_WRITER_NAME"));
				groupBoard.setReadCount(rs.getInt("GROUP_READCOUNT"));
				groupBoard.setBorFile(rs.getString("GROUP_BOR_FILE"));
				groupBoard.setCreateDate(rs.getString("GROUP_CREATE_DATE"));
				groupBoard.setUpdateDate(rs.getString("GROUP_UPDATE_DATE"));
				groupBoard.setGroupkeyword(rs.getString("GROUP_BOR_KEYWORD"));
				groupBoard.setGroupName(rs.getString("GROUPBOR_GROUPNAME"));
				
				arr= groupBoard.getBorFile().split(", ");
				list = Arrays.asList(arr);
				
				groupBoard.setBorFileList(list);
				
				groupBoard.setReplies(this.getRepliesByNo(connection, groupBorNo));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return groupBoard;
	}


	private List<GroupReply> getRepliesByNo(Connection connection, int groupRepboardNo) {
		List<GroupReply> replies = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = null;
		try {
			query = "SELECT * "
					+ "FROM GBREPLY GBR "
					+ "JOIN MEMBER M ON(GBR.GBREP_WRITER_NUMBER = M.MEM_NUMBER) "
					+ "WHERE GBR.GBREP_STATUS = 'Y' AND GBR.GBREP_BOR_NUMBER = ? "
					+ "ORDER BY GBR.GBREP_NUMBER DESC";
			
			
			pstm = connection.prepareStatement(query);
			
			pstm.setInt(1, groupRepboardNo);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				GroupReply groupReply = new GroupReply();
				groupReply.setNo(rs.getInt("GBREP_NUMBER"));
				groupReply.setRepboardNo(rs.getInt("GBREP_BOR_NUMBER"));
				groupReply.setRepcontent(rs.getString("GBREP_CONTENT"));
				groupReply.setRepwriterId(rs.getString("MEM_NICKNAME"));
				groupReply.setRepcreateDate(rs.getDate("GBREP_CREATE_DATE"));
				groupReply.setRepmodifyDate(rs.getDate("GBREP_MODIFY_DATE"));
				
				replies.add(groupReply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		return replies;
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
		String query = "UPDATE GBREPLY SET GBREP_STATUS ='N' WHERE GBREP_NUMBER=? AND GBREP_BOR_NUMBER=?";
		
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

	public List<GroupBoard> findNextContent(Connection connection, ContentInfo contentInfo) {
		List<GroupBoard> groupboardlist = new ArrayList<>();
		PreparedStatement pstm = null;;
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
			pstm = connection.prepareStatement(query);
			pstm.setInt(1, contentInfo.getPrevContent());
			pstm.setInt(2, contentInfo.getNextContent());
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				GroupBoard groupBoard = new GroupBoard();
				String[] arr = new String[3];
				List<String> list = groupBoard.getBorFileList();
				
				
				groupBoard.setRowNum(rs.getInt("RNUM"));
				groupBoard.setGroupBorNo(rs.getInt("GROUPBOR_NUMBER"));
				groupBoard.setBorTitle(rs.getString("GROUPBOR_TITLE"));
				groupBoard.setEmail(rs.getString("MEM_EMAIL"));
				groupBoard.setWriterName(rs.getString("GROUPBOR_WRITER_NAME"));
				groupBoard.setCreateDate(rs.getString("GROUP_CREATE_DATE"));
				groupBoard.setBorFile(rs.getString("GROUP_BOR_FILE"));
				groupBoard.setReadCount(rs.getInt("GROUP_READCOUNT"));
				groupBoard.setBorStatus(rs.getString("GROUP_BOR_STATUS"));
				
				arr= groupBoard.getBorFile().split(", ");
				list = Arrays.asList(arr);
				
				groupBoard.setBorFileList(list);
				
				groupboardlist.add(groupBoard);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		return groupboardlist;
	}

	public int updateBoard(Connection connection, GroupBoard groupBoard) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE GROUPBOARD SET GROUPBOR_TITLE=?, GROUPBOR_CONTENT=?, GROUP_BOR_FILE=?, GROUP_UPDATE_DATE=SYSDATE WHERE GROUPBOR_NUMBER=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, groupBoard.getBorTitle());
			pstmt.setString(2, groupBoard.getBorContent());
			pstmt.setString(3, groupBoard.getBorFile());
			pstmt.setInt(4, groupBoard.getGroupBorNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<GroupBoard> keySearch(Connection connection, PageInfo pageInfo, String groupkeyword) {
		List<GroupBoard> groupboardlist = new ArrayList<>();
		PreparedStatement pstm = null;;
		ResultSet rs = null;
		String query = "SELECT * "
				+ "FROM GROUPBOARD "
				+ "WHERE GROUP_BOR_KEYWORD=? AND GROUP_BOR_STATUS = 'Y' ";
		try {
			pstm = connection.prepareStatement(query);
			pstm.setString(1, groupkeyword);
			rs = pstm.executeQuery();
			while(rs.next()) {
				GroupBoard groupBoard = new GroupBoard();
				
				String[] arr = new String[3];
				List<String> list = groupBoard.getBorFileList();
				groupBoard.setGroupBorNo(rs.getInt("GROUPBOR_NUMBER"));
				groupBoard.setBorTitle(rs.getString("GROUPBOR_TITLE"));
				groupBoard.setWriterName(rs.getString("GROUPBOR_WRITER_NAME"));
				groupBoard.setCreateDate(rs.getString("GROUP_CREATE_DATE"));
				groupBoard.setBorFile(rs.getString("GROUP_BOR_FILE"));
				groupBoard.setReadCount(rs.getInt("GROUP_READCOUNT"));
				groupBoard.setBorStatus(rs.getString("GROUP_BOR_STATUS"));
				groupBoard.setGroupkeyword(rs.getString("GROUP_BOR_KEYWORD"));
				groupBoard.setGroupName(rs.getString("GROUPBOR_GROUPNAME"));
				
				
				arr= groupBoard.getBorFile().split(", ");
				list = Arrays.asList(arr);
				groupBoard.setBorFileList(list);
				
				groupboardlist.add(groupBoard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		return groupboardlist;
	}
}