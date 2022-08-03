package com.sdsd.mvc.ploGroup.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.sdsd.mvc.ploGroup.model.vo.PloGroup;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;

public class PloGroupDao {

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
