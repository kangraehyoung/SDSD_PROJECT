package com.sdsd.mvc.ploGroup.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.sdsd.mvc.common.util.ContentInfo;
import com.sdsd.mvc.common.util.PageInfo;
import com.sdsd.mvc.member.model.vo.Member;
import com.sdsd.mvc.ploGroup.model.vo.Notice;
import com.sdsd.mvc.ploGroup.model.vo.PloGroup;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;

public class PloGroupDao {

//	public int save(Connection connection, PloGroup plogroup) {
//		int result = 0;
//		
//		PreparedStatement pstmt = null;
//		
//		String query = "INSERT INTO PLO_GR_BOARD VALUES(SEQ_PLO_GR_NUMBER.NEXTVAL, ?, ?, ?, DEFAULT,  DEFAULT, DEFAULT, ?, DEFAULT, ?, ?, ?)";
//		
//		try {
//			pstmt = connection.prepareStatement(query); 이거뭐지??
//			
//
//			pstmt.setString(1, plogroup.getPloLeader());
//			pstmt.setString(2, plogroup.getPloTitle());
//			pstmt.setString(3, plogroup.getPloIntro());
//			pstmt.setString(4, plogroup.getGroupBoardFile());
//			pstmt.setString(5, plogroup.getGender());
//			pstmt.setString(6, plogroup.getLocal());
//			pstmt.setInt(7, plogroup.getPloMemNum());
////			pstmt.setInt(4, plogroup.getPloMemNum());
//			
//			
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		
//		return result;
//	}

	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) "
				+ "FROM SEARCH_PLOG_BOARD "
				+ "WHERE SPB_BOR_STATUS='Y'";
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

		public int save(Connection connection, PloGroup plogroup) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO SEARCH_PLOG_BOARD VALUES(SEQ_SPBOR_NUMBER.NEXTVAL, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?, DEFAULT, ?, ?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			

			pstmt.setInt(1, plogroup.getSpbWriterNum());
			pstmt.setString(2, plogroup.getSpbWriterName());
			pstmt.setString(3, plogroup.getPlogGroupName());
			pstmt.setString(4, plogroup.getSpbTitle());
			pstmt.setString(5, plogroup.getSpbContent());
			pstmt.setString(6, plogroup.getSpbBorFile());
			pstmt.setString(7, plogroup.getSpbKeyword());
			pstmt.setString(8, plogroup.getAddress());
//			pstmt.setInt(4, plogroup.getPloMemNum());
			
			
			result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }


        return result;
    }
	
	public List<PloGroup> findAll(Connection connection, PageInfo pageInfo) {
		List<PloGroup> ploGroupList = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT *  "
				+ "FROM ( "
				+ "    SELECT ROWNUM AS RNUM, "
				+ "           SPBOR_NUMBER, "
				+ "           SPB_TITLE, "
				+ "           PLOG_GROUP_NAME, "
				+ "           MEM_EMAIL, "
				+ "           SPB_WRITER_NAME, "
				+ "           SPB_CREATE_DATE, "
				+ "           SPB_UPDATE_DATE, "
				+ "           SPB_BOR_FILE, "
				+ "           SPB_READCOUNT, "
				+ "           SPB_BOR_STATUS, "
				+ "           SPB_BOR_ADDRESS "
				+ "    FROM ( "
				+ "            SELECT SPB.SPBOR_NUMBER, "
				+ "                   SPB.SPB_TITLE, "
				+ "                   SPB.PLOG_GROUP_NAME, "
				+ "                   M.MEM_EMAIL, "
				+ "                   SPB.SPB_WRITER_NAME, "
				+ "                   SPB.SPB_CREATE_DATE, "
				+ "                   SPB.SPB_UPDATE_DATE, "
				+ "                   SPB.SPB_BOR_FILE, "
				+ "                   SPB.SPB_READCOUNT, "
				+ "                   SPB.SPB_BOR_STATUS, "
				+ "                   SPB_BOR_ADDRESS "
				+ "            FROM SEARCH_PLOG_BOARD SPB "
				+ "            JOIN MEMBER M ON(M.MEM_NUMBER = SPB.SPB_WRITER_NO) "
				+ "    ) "
				+ ") WHERE (RNUM BETWEEN ? AND ?) AND SPB_BOR_STATUS = 'Y'";
		try {
			pstm = connection.prepareStatement(query);
			pstm.setInt(1, pageInfo.getStartList());
			pstm.setInt(2, pageInfo.getEndList());
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {				
				PloGroup ploGroup = new PloGroup();
				String[] arr = new String[4];
				List<String> list = ploGroup.getSpbFileList();
				
				ploGroup.setSpbRowNum(rs.getInt("RNUM"));
				ploGroup.setSpBorNum(rs.getInt("SPBOR_NUMBER"));
				ploGroup.setSpbTitle(rs.getString("SPB_TITLE"));
				ploGroup.setPlogGroupName(rs.getString("PLOG_GROUP_NAME"));
				ploGroup.setEmail(rs.getString("MEM_EMAIL"));
				ploGroup.setSpbWriterName(rs.getString("SPB_WRITER_NAME"));
				ploGroup.setSpbCreateDate(rs.getString("SPB_CREATE_DATE"));
				ploGroup.setSpbUpdateDate(rs.getString("SPB_UPDATE_DATE"));
				ploGroup.setSpbBorFile(rs.getString("SPB_BOR_FILE"));
				ploGroup.setSpbReadCount(rs.getInt("SPB_READCOUNT"));
				ploGroup.setSpbBorStatus(rs.getString("SPB_BOR_STATUS"));
				ploGroup.setAddress(rs.getString("SPB_BOR_ADDRESS"));
				
				System.out.println("첫번째 : " + ploGroup.getSpbBorFile());
				arr=ploGroup.getSpbBorFile().split(", ");
				System.out.println("두번쨰 : " + Arrays.toString(arr));
				list = Arrays.asList(arr);
				System.out.println("세번째 : " + list);
				ploGroup.setSpbFileList(list);
				
				ploGroupList.add(ploGroup);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		return ploGroupList;
	}

	public int memberGroupUpdate(Connection connection, PloGroup plogroup) {
		int result = 0;
		PreparedStatement pstm = null;
		String qurey = "UPDATE MEMBER SET MEM_MY_PLOGING=? WHERE MEM_NUMBER = ?";
		try {
			pstm = connection.prepareStatement(qurey);
			
			pstm.setString(1, plogroup.getPlogGroupName());
			pstm.setInt(2, plogroup.getSpbWriterNum());
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
	
		return result ;
	}

	public int join(Connection connection, PloGroup plogroup, Member loginMember) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE MEMBER SET MEM_MY_PLOGING=? WHERE MEM_NUMBER =?";
		try {
			pstm = connection.prepareStatement(query);
			pstm.setString(1, plogroup.getPlogGroupName());
			pstm.setInt(2, loginMember.getNo());
			
			result = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		System.out.println("조인다오 결과 " + result);
		return result ;
	}
	
	public List<PloGroup> findNextContent(Connection connection, ContentInfo contentInfo) {
		List<PloGroup> ploGroupList = new ArrayList<>();
		PreparedStatement pstm = null;;
		ResultSet rs = null;
		String query = "SELECT *   "
				+ "				FROM ( "
				+ "				    SELECT ROWNUM AS RNUM, "
				+ "                           SPBOR_NUMBER, "
				+ "				           SPB_WRITER_NO, "
				+ "				           SPB_WRITER_NAME, "
				+ "				           PLOG_GROUP_NAME, "
				+ "				           SPB_TITLE, "
				+ "				           SPB_CONTENT, "
				+ "                           SPB_CREATE_DATE, "
				+ "                           SPB_UPDATE_DATE, "
				+ "                           SPB_READCOUNT, "
				+ "                           SPB_BOR_FILE, "
				+ "                           SPB_BOR_STATUS, "
				+ "                           SPB_BOR_KEYWORD, "
				+ "                           SPB_BOR_ADDRESS "
				+ "				    FROM ( "
				+ "                         SELECT SP.SPBOR_NUMBER, "
				+ "                               SP.SPB_WRITER_NO, "
				+ "                               SP.SPB_WRITER_NAME, "
				+ "                               SP.PLOG_GROUP_NAME, "
				+ "                               SP.SPB_TITLE, "
				+ "                               SP.SPB_CONTENT, "
				+ "                               SP.SPB_CREATE_DATE, "
				+ "                               SP.SPB_UPDATE_DATE, "
				+ "                               SP.SPB_READCOUNT, "
				+ "                               SP.SPB_BOR_FILE, "
				+ "                               SP.SPB_BOR_STATUS, "
				+ "                               SP.SPB_BOR_KEYWORD, "
				+ "                               SPB_BOR_ADDRESS "
				+ "				          FROM SEARCH_PLOG_BOARD SP "
				+ "				            JOIN MEMBER M ON (M.MEM_NUMBER = SP.SPB_WRITER_NO) "
				+ "				    )  "
				+ "				) WHERE (RNUM BETWEEN ? AND ?) AND SPB_BOR_STATUS = 'Y'";
		
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setInt(1, contentInfo.getPrevContent());
			pstm.setInt(2, contentInfo.getNextContent());
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				PloGroup ploGroup = new PloGroup();
				
				ploGroup.setSpbRowNum(rs.getInt("RNUM"));
				ploGroup.setSpBorNum(rs.getInt("SPBOR_NUMBER"));
				ploGroup.setSpbWriterNum(rs.getInt("SPB_WRITER_NO"));
				ploGroup.setSpbWriterName(rs.getString("SPB_WRITER_NAME"));
				ploGroup.setPlogGroupName(rs.getString("PLOG_GROUP_NAME"));
				ploGroup.setSpbTitle(rs.getString("SPB_TITLE"));
				ploGroup.setSpbContent(rs.getString("SPB_CONTENT"));
				ploGroup.setSpbCreateDate(rs.getString("SPB_CREATE_DATE"));
				ploGroup.setSpbUpdateDate(rs.getString("SPB_UPDATE_DATE"));
				ploGroup.setSpbReadCount(rs.getInt("SPB_READCOUNT"));
				ploGroup.setSpbBorFile(rs.getString("SPB_BOR_FILE"));
				ploGroup.setSpbBorStatus(rs.getString("SPB_BOR_STATUS"));
				ploGroup.setSpbKeyword(rs.getString("SPB_BOR_KEYWORD"));
				ploGroup.setAddress(rs.getString("SPB_BOR_ADDRESS"));

								
				ploGroupList.add(ploGroup);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		return ploGroupList;
	}

	public PloGroup findGroupByNo(Connection connection, int ploGrNo) {
		PloGroup ploGroup = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT *  "
				+ "    FROM SEARCH_PLOG_BOARD SPB  "
				+ "    JOIN MEMBER M ON(SPB.SPB_WRITER_NO = M.MEM_NUMBER)  "
				+ "    WHERE SPB_BOR_STATUS = 'Y' AND SPBOR_NUMBER = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, ploGrNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ploGroup = new PloGroup();
				
				String[] arr = new String[4];
				List<String> list = ploGroup.getSpbFileList();
				
				ploGroup.setSpBorNum(rs.getInt("SPBOR_NUMBER"));;
				ploGroup.setSpbWriterNum(rs.getInt("SPB_WRITER_NO"));
				ploGroup.setSpbWriterName(rs.getString("SPB_WRITER_NAME"));
				ploGroup.setPlogGroupName(rs.getString("PLOG_GROUP_NAME"));
				ploGroup.setSpbTitle(rs.getString("SPB_TITLE"));
				ploGroup.setSpbContent(rs.getString("SPB_CONTENT"));
				ploGroup.setSpbCreateDate(rs.getString("SPB_CREATE_DATE"));
				ploGroup.setSpbUpdateDate(rs.getString("SPB_UPDATE_DATE"));
				ploGroup.setSpbReadCount(rs.getInt("SPB_READCOUNT"));
				ploGroup.setSpbBorFile(rs.getString("SPB_BOR_FILE"));
				ploGroup.setSpbBorStatus(rs.getString("SPB_BOR_STATUS"));
				ploGroup.setSpbKeyword(rs.getString("SPB_BOR_KEYWORD"));
				ploGroup.setAddress(rs.getString("SPB_BOR_ADDRESS"));
				
				arr=ploGroup.getSpbBorFile().split(", ");
				list = Arrays.asList(arr);
				
				ploGroup.setSpbFileList(list);
				
				ploGroup.setNotices(this.getNoticesByNo(connection, ploGrNo));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return ploGroup;
	}


	public int updateReadCount(Connection connection, PloGroup ploGroup) {
		int result =0;
		PreparedStatement pstmt = null;
		String query = "UPDATE SEARCH_PLOG_BOARD SET SPB_READCOUNT=? WHERE SPBOR_NUMBER=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			ploGroup.setSpbReadCount(ploGroup.getSpbReadCount() + 1);
			
			pstmt.setInt(1, ploGroup.getSpbReadCount());
			pstmt.setInt(2, ploGroup.getSpBorNum());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	public int updateGroup(Connection connection, PloGroup plogroup) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE SEARCH_PLOG_BOARD SET PLOG_GROUP_NAME=?, SPB_TITLE=?, SPB_CONTENT=?, SPB_BOR_ADDRESS=?, SPB_UPDATE_DATE=SYSDATE, SPB_BOR_FILE=? WHERE SPBOR_NUMBER=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, plogroup.getPlogGroupName());
			pstmt.setString(2, plogroup.getSpbTitle());
			pstmt.setString(3, plogroup.getSpbContent());
			pstmt.setString(4, plogroup.getAddress());
			pstmt.setString(5, plogroup.getSpbBorFile());
			pstmt.setInt(6, plogroup.getSpBorNum());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateStatus(Connection connection, int spBorNum, String status) {
		int result = 0;
		PreparedStatement pstm = null;
		String qurey = "UPDATE SEARCH_PLOG_BOARD SET SPB_BOR_STATUS=?, PLOG_GROUP_NAME = '플로깅모임없음' WHERE SPBOR_NUMBER=? ";
		try {
			pstm = connection.prepareStatement(qurey);
			
			pstm.setString(1, status);
			pstm.setInt(2, spBorNum);
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
	
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int insertNotice(Connection connection, Notice notice) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "INSERT INTO PG_NOTICE VALUES(SEQ_NOTICE_NUMBER.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setInt(1, notice.getNoticeBorNo());
			pstm.setInt(2, notice.getNoticeWriterNo());
			pstm.setString(3, notice.getNoticeContent());
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		return result;
	}
	
	private List<Notice> getNoticesByNo(Connection connection, int noticeBorNo) {
		List<Notice> notices = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT * "
				+ "FROM PG_NOTICE PN "
				+ "JOIN MEMBER M ON(M.MEM_NUMBER = PN.NOTICE_WRITER_NUMBER) "
				+ "WHERE PN.NOTICE_STATUS = 'Y' AND PN.NOTICE_BOR_NUMBER=? "
				+ "ORDER BY PN.NOTICE_NUMBER DESC";
		try {
			pstm = connection.prepareStatement(query);
			pstm.setInt(1, noticeBorNo);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				Notice notice = new Notice();
				notice.setNo(rs.getInt("NOTICE_NUMBER"));
				notice.setNoticeBorNo(rs.getInt("NOTICE_BOR_NUMBER"));
				notice.setNoticeContent(rs.getString("NOTICE_CONTENT"));
				notice.setNoticeWriterId(rs.getString("MEM_NICKNAME"));
				notice.setNoticeCreateDate(rs.getDate("NOTICE_CREATE_DATE"));
				notice.setNoticeModifyDate(rs.getDate("NOTICE_MODIFY_DATE"));
				
				notices.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		
		return notices;
	}

	public int updateMemberStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE MEMBER SET MEM_MY_PLOGING=? WHERE MEM_NUMBER=?";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1, status);
			pstm.setInt(2, no);
			
			result = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return result;
	}

	public List<PloGroup> keySearch(Connection connection, String spbKeyword) {
		List<PloGroup> ploGroupList = new ArrayList<>();
		PreparedStatement pstm = null;;
		ResultSet rs = null;
		String query = "SELECT * "
				+ "FROM SEARCH_PLOG_BOARD "
				+ "WHERE SPB_BOR_KEYWORD=? AND SPB_BOR_STATUS='Y'";
		try {
			pstm = connection.prepareStatement(query);
			pstm.setString(1, spbKeyword);
			rs = pstm.executeQuery();
			while(rs.next()) {
				PloGroup ploGroup = new PloGroup();
				
				String[] arr = new String[4];
				List<String> list = ploGroup.getSpbFileList();
				
				ploGroup.setSpBorNum(rs.getInt("SPBOR_NUMBER"));
				ploGroup.setSpbTitle(rs.getString("SPB_TITLE"));
				ploGroup.setPlogGroupName(rs.getString("PLOG_GROUP_NAME"));
				ploGroup.setSpbWriterName(rs.getString("SPB_WRITER_NAME"));
				ploGroup.setSpbCreateDate(rs.getString("SPB_CREATE_DATE"));
				ploGroup.setSpbUpdateDate(rs.getString("SPB_UPDATE_DATE"));
				ploGroup.setSpbBorFile(rs.getString("SPB_BOR_FILE"));
				ploGroup.setSpbReadCount(rs.getInt("SPB_READCOUNT"));
				ploGroup.setSpbBorStatus(rs.getString("SPB_BOR_STATUS"));
				ploGroup.setAddress(rs.getString("SPB_BOR_ADDRESS"));
				;
				arr=ploGroup.getSpbBorFile().split(", ");
				list = Arrays.asList(arr);
				ploGroup.setSpbFileList(list);
				ploGroupList.add(ploGroup);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		return ploGroupList;
	}

	public int updateNoticeStatus(Connection connection, int spBorNum, int no) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE PG_NOTICE SET NOTICE_STATUS ='N' WHERE NOTICE_NUMBER=? AND NOTICE_BOR_NUMBER=?";
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setInt(1, no);
			pstm.setInt(2, spBorNum);
			result = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		return result;
	}

	public List<PloGroup> myPlogingSearch(Connection connection, String plogGroupName) {
		List<PloGroup> ploGroupList = new ArrayList<>();
		PreparedStatement pstm = null;;
		ResultSet rs = null;
		String query = "SELECT * "
				+ "FROM SEARCH_PLOG_BOARD "
				+ "WHERE PLOG_GROUP_NAME=? AND SPB_BOR_STATUS='Y' ";
		try {
			pstm = connection.prepareStatement(query);
			pstm.setString(1, plogGroupName);
			rs = pstm.executeQuery();
			while(rs.next()) {
				PloGroup ploGroup = new PloGroup();
				String[] arr = new String[4];
				List<String> list = ploGroup.getSpbFileList();
				ploGroup.setSpBorNum(rs.getInt("SPBOR_NUMBER"));
				ploGroup.setSpbTitle(rs.getString("SPB_TITLE"));
				ploGroup.setPlogGroupName(rs.getString("PLOG_GROUP_NAME"));
				ploGroup.setSpbWriterName(rs.getString("SPB_WRITER_NAME"));
				ploGroup.setSpbCreateDate(rs.getString("SPB_CREATE_DATE"));
				ploGroup.setSpbUpdateDate(rs.getString("SPB_UPDATE_DATE"));
				ploGroup.setSpbBorFile(rs.getString("SPB_BOR_FILE"));
				ploGroup.setSpbReadCount(rs.getInt("SPB_READCOUNT"));
				ploGroup.setSpbBorStatus(rs.getString("SPB_BOR_STATUS"));
				ploGroup.setAddress(rs.getString("SPB_BOR_ADDRESS"));
				arr = ploGroup.getSpbBorFile().split(", ");
				list = Arrays.asList(arr);
				ploGroup.setSpbFileList(list);
				ploGroupList.add(ploGroup);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		return ploGroupList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
