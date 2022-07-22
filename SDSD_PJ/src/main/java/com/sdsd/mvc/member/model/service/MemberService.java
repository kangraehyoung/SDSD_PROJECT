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
		
		result = new MemberDao().insertMember(connection, member);
		
		return result;
	}
	
}
