package com.sdsd.mvc.others.model.service;

import com.sdsd.mvc.others.model.dao.rankDao;
import com.sdsd.mvc.others.vo.Rank;
import static com.sdsd.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.sdsd.mvc.member.model.dao.MemberDao;
import com.sdsd.mvc.member.model.vo.Member;
public class rankService {

	public List<Rank> getMember(Rank rank) {
		Connection connection = getConnection();
		List<Rank> rankList = null;
		
		rankList = new rankDao().countRank(connection, rank);
		
		close(connection);
		return rankList;
	}

	public List<Rank> getMember1(Rank rank) {
		Connection connection = getConnection();
		List<Rank> rankList1 = null;
		
		rankList1 = new rankDao().countPloRank(connection, rank);
		
		close(connection);
		return rankList1;
	}

}
