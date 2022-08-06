package com.sdsd.mvc.others.model.dao;

import static com.sdsd.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sdsd.mvc.member.model.vo.Member;
import com.sdsd.mvc.others.vo.Rank;

public class rankDao {

	public List<Rank> countRank(Connection connection, Rank rank) {
		List<Rank> rankList = new ArrayList<Rank>();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = 
				"SELECT INDIBOR_WRITER_NAME, COUNT(*) "
				+ "FROM INDIBOARD "
				+ "GROUP BY ROLLUP(INDIBOR_WRITER_NAME) "
				+ "HAVING GROUPING(INDIBOR_WRITER_NAME)= 0";
		
		try {
			pstm = connection.prepareStatement(query);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				rank = new Rank();
				
				rank.setIndiNickName(rs.getString("INDIBOR_WRITER_NAME"));
				rank.setIndiCount(rs.getInt("COUNT(*)"));
				System.out.println(rank.getIndiCount());
				
				rankList.add(rank);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		return rankList;
	}

}
