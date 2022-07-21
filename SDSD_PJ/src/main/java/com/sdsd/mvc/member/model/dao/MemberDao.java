package com.sdsd.mvc.member.model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;
import com.sdsd.mvc.member.model.vo.Member;

public class MemberDao {

	public Member findMemberById(Connection connection, String email) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEMBER WHERE MEM_EMAIL=? AND MEM_STATUS='Y'";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1, email);
			
			rs = pstm.executeQuery();
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		
		
		
		
		
		return member;
	}


}
