package com.sdsd.mvc.member.model.service;

import java.sql.Connection;

import com.sdsd.mvc.member.model.dao.MemberDao;
import com.sdsd.mvc.member.model.vo.Member;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;
public class MemberService {

	public Member login(String email, String password) {
		Connection connection = getConnection();
		// member에는 db에 조회된 값 객체로 저장한다.
		Member member = new MemberDao().findMemberById(connection, email);
		
		close(connection);
		if(member == null || !member.getPassword().equals(password)) {
			return null;
		} else {
			return member;			
		}
		
		
	}

	public int save(Member member) {
		int result = 0;
        Connection connection = getConnection();
        System.out.println(member.getAddress());
        if (member.getNo() != 0) {
            // update 작업
            result = new MemberDao().updateMemberMyPage(connection, member);
        } else {
            // insert 작업
            result = new MemberDao().insertMember(connection, member);
        }

        if(result > 0) {
            commit(connection);
        } else {
            rollback(connection);
        }

        close(connection);

        return result;
	}

	public Boolean isDuplicateEmail(String email) {
		Connection connection = getConnection();
		Member member = new MemberDao().findDuplicatedId(connection, email);
		
		close(connection);
		

		return member != null;
	}

	public int delete(int no) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new MemberDao().updateMemberStatus(connection, no, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		return result;
	}
	
	public int updateMember (Member member) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = new MemberDao().updateMember(connection, member);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		  
		return result;
	}

	public Member searchId(String name, String phone) {
		Connection connection = getConnection();
		
		Member member = new MemberDao().searchId(connection, name, phone);
		
		close(connection);
		
		return member;
	}

	public int findPwd(Member findPwd) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new MemberDao().updatePwd(connection, findPwd);
		System.out.println("Dao" + result);
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public int updatePassword(int no, String password) {
		int result = 0;
		Connection connection = getConnection();
		result = new MemberDao().updateMemberPassword(connection, no, password);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		return result;
	}



	

}
