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
		
		String query = "INSERT INTO PLO_GR_BOARD VALUES(SEQ_PLO_GR_NUMBER.NEXTVAL, ?, ?, ?, DEFAULT,  DEFAULT, DEFAULT, ?, DEFAULT, ?, ?, 1)";
		
		try {
			pstmt = connection.prepareStatement(query);
			

			pstmt.setString(1, plogroup.getPloLeader());
			pstmt.setString(2, plogroup.getPloTitle());
			pstmt.setString(3, plogroup.getPloIntro());
			pstmt.setString(4, plogroup.getGroupBoardFile());
			pstmt.setString(5, plogroup.getGender());
			pstmt.setString(6, plogroup.getLocal());
//			pstmt.setInt(4, plogroup.getPloMemNum());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

}
