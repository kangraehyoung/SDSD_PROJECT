package com.sdsd.mvc.member.model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;
import com.sdsd.mvc.member.model.vo.Member;

public class MemberDao {
	// 비밀번호 난수 생성 메소드
	public static String randomPassword(int length) {
		int index = 0;
		char[] charSet = new char[] {
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
			'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
			'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
		};
		StringBuffer sb = new StringBuffer();
		
		for (int i=0; i<length; i++) {
			index = (int) (charSet.length * Math.random());
			sb.append(charSet[index]);
		}
		
		return sb.toString();
	}

	public Member findMemberById(Connection connection, String email) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEMBER WHERE MEM_EMAIL=? AND MEM_STATUS='Y'";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1, email);
			
			rs = pstm.executeQuery();
			if(rs != null) {
			System.out.println("여기가 에러일껄");
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
				member.setMyPloging(rs.getString("MEM_MY_PLOGING"));
			}
			} else {
				member = new Member();
				member = null;
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
				member.setMyPloging(rs.getString("MEM_MY_PLOGING"));
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
		
		String query = "INSERT INTO MEMBER VALUES (SEQ_MNO.NEXTVAL,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)";
		
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
				member.setMyPloging(rs.getString("MEM_MY_PLOGING"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(rs);
		}
		
		
		return member;
	}

	public int updatePwd(Connection connection, Member findPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET MEM_PWD=? WHERE MEM_EMAIL=? AND MEM_PHONE=?";
		String rePassword = randomPassword(8);
		findPwd.setPassword(rePassword);
		System.out.println(rePassword + " " + findPwd.getEmail() + " " + findPwd.getPhone());
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, rePassword);
			pstmt.setString(2, findPwd.getEmail());
			pstmt.setString(3, findPwd.getPhone());
	
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(connection);
		}
		
		return result;
	}

	public int updateMemberPassword(Connection connection, int no, String password) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE MEMBER SET MEM_PWD=? WHERE MEM_NUMBER=?";
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setString(1, password);
			pstm.setInt(2, no);
			
			result = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return result;
	}
	
}
