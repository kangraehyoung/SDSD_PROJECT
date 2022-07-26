package com.sdsd.mvc.member.model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.print.attribute.standard.PresentationDirection;

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
			
			if(rs.next()) {
				member = new Member();
				
				member.setNo(rs.getInt("MEM_NUMBER"));
				member.setName(rs.getString("MEM_NAME"));
				member.setNickName(rs.getString("MEM_NICKNAME"));				
				member.setEmail(rs.getString("MEM_EMAIL"));
				member.setPassword(rs.getString("MEM_PWD"));
				member.setPhone(rs.getString("MEM_PHONE"));
				member.setGender(rs.getString("MEM_GENDER"));
				member.setAddress(rs.getString("MEM_ADDRESS"));
				member.setIntroduce(rs.getString("MEM_INTRODUCE"));
				member.setStatus(rs.getString("MEM_STATUS"));
				member.setBDay(rs.getString("MEM_BDAY"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		return member;
	}
	
	public Member findDuplicatedId(Connection connection, String email) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEMBER WHERE MEM_EMAIL=?";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1, email);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				
				member.setNo(rs.getInt("MEM_NUMBER"));
				member.setName(rs.getString("MEM_NAME"));
				member.setNickName(rs.getString("MEM_NICKNAME"));				
				member.setEmail(rs.getString("MEM_EMAIL"));
				member.setPassword(rs.getString("MEM_PWD"));
				member.setPhone(rs.getString("MEM_PHONE"));
				member.setGender(rs.getString("MEM_GENDER"));
				member.setAddress(rs.getString("MEM_ADDRESS"));
				member.setIntroduce(rs.getString("MEM_INTRODUCE"));
				member.setStatus(rs.getString("MEM_STATUS"));
				member.setBDay(rs.getString("MEM_BDAY"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		return member;
	}


	public int insertMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstm = null;
		
		String query = "INSERT INTO MEMBER VALUES (SEQ_MNO.NEXTVAL,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT)";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1, member.getName());
			pstm.setString(2, member.getNickName());
			pstm.setString(3, member.getEmail());
			pstm.setString(4, member.getPassword());
			pstm.setString(5, member.getPhone());
			pstm.setString(6, member.getGender());
			pstm.setString(7, member.getBDay());
			pstm.setString(8, member.getAddress());
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return result;
	}

	
	public int updateMemberStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE MEMBER SET MEM_STATUS=? WHERE MEM_NUMBER=?";
		
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
	
	
	public int updateMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET MEM_NAME=?,MEM_NICKNAME=?,MEM_PHONE=?,MEM_ADDRESS=?,MEM_GENDER=?,MEM_INTRODUCE=? WHERE MEM_NUMBER=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getNickName());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getIntroduce());
			pstmt.setInt(7, member.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(connection);
		}
		

		return result;
	}

	public int updateMemberMyPage(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET MEM_NICKNAME=?,MEM_PHONE=?,MEM_ADDRESS=? WHERE MEM_NUMBER=? ";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			
			pstmt.setString(1, member.getNickName());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getAddress());
			pstmt.setInt(4, member.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(connection);
		}
		

		return result;
	}

	public Member searchId(Connection connection, String name, String phone) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEMBER WHERE MEM_NAME=? AND MEM_PHONE=?";
		Member member = null;
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setString(1, name);
			pstm.setString(2, phone);
			
			rs = pstm.executeQuery();
			if(rs.next()) {
				member = new Member();
				
				member.setNo(rs.getInt("MEM_NUMBER"));
				member.setName(rs.getString("MEM_NAME"));
				member.setNickName(rs.getString("MEM_NICKNAME"));				
				member.setEmail(rs.getString("MEM_EMAIL"));
				member.setPassword(rs.getString("MEM_PWD"));
				member.setPhone(rs.getString("MEM_PHONE"));
				member.setGender(rs.getString("MEM_GENDER"));
				member.setAddress(rs.getString("MEM_ADDRESS"));
				member.setIntroduce(rs.getString("MEM_INTRODUCE"));
				member.setStatus(rs.getString("MEM_STATUS"));
				member.setBDay(rs.getString("MEM_BDAY"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(rs);
		}
		
		
		return member;
	}
	
}
