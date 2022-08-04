package com.sdsd.mvc.ploGroup.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sdsd.mvc.common.util.PageInfo;
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
//			pstmt = connection.prepareStatement(query);
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
				+ "FROM SEARCH_PLOG_BOARD ";
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
		
		String query = "INSERT INTO SEARCH_PLOG_BOARD VALUES(SEQ_SPBOR_NUMBER.NEXTVAL, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?, DEFAULT, DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			

			pstmt.setInt(1, plogroup.getSpbWriterNum());
			pstmt.setString(2, plogroup.getSpbWriterName());
			pstmt.setString(3, plogroup.getPlogGroupName());
			pstmt.setString(4, plogroup.getSpbTitle());
			pstmt.setString(5, plogroup.getSpbContent());
			pstmt.setString(6, plogroup.getSpbBorFile());
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
				+ "           SPB_BOR_STATUS "
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
				+ "                   SPB.SPB_BOR_STATUS "
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


}
