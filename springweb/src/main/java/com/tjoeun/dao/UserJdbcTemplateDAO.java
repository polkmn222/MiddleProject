package com.tjoeun.dao;

import java.sql.Types;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.tjoeun.vo.User;

@Repository
public class UserJdbcTemplateDAO {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<User> getList() {
		String sql = "SELECT * FROM users";
		return jdbcTemplate.query( // list를 가져올때
			sql,
			(rs,i)-> {
				User u = new User();
				u.setUid(rs.getString("UID"));
				u.setPwd(rs.getString("PWD"));
				u.setName(rs.getString("NAME"));
				u.setPhone(rs.getString("PHONE"));
				return u;
			}
		);
	}

	public boolean addUser(User user) {
		String sql = "INSERT INTO users VALUES(?, ?, ?, ?)";
			int rows = jdbcTemplate.update(
					sql,
					new Object[] {user.getUid(), user.getPwd(), user.getName(), user.getPhone()},
					new int[] {Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR}
					);
			return rows>0;
	}

	public User detail(String uid)  {
		String sql = "SELECT * FROM users WHERE uid=?";
		return jdbcTemplate.queryForObject( // 한행만 가져올때
				sql,
				new Object[] {uid},
				new int[] {Types.VARCHAR},
				(rs,i)-> {	// rs = ResultSet	i = rs의 행번호(int) 0 1 2
					User u = new User();	// MapRow
					u.setUid(rs.getString("UID"));
					u.setPwd(rs.getString("PWD"));
					u.setName(rs.getString("NAME"));
					u.setPhone(rs.getString("PHONE"));
					return u;
				}
		);
	}

	public boolean update(User user) {
		String sql = "UPDATE users SET phone=? WHERE uid=?"; 
		int rows = jdbcTemplate.update(
				sql,
				new Object[] { user.getPhone(), user.getUid() },
				new int[] {Types.VARCHAR, Types.VARCHAR}
				);
		return rows>0;
	}

	public boolean deleted(User user) {
		String sql = "DELETE FROM users WHERE uid=?";
		int rows = jdbcTemplate.update(
				sql,
				new Object[] { user.getUid() },
				new int[] {Types.VARCHAR}
				);
		return rows>0;
	}


	public boolean login(User user) {
		String sql = "SELECT * FROM users WHERE uid=?";
		String getpwd = null;	
		try{
			getpwd = jdbcTemplate.queryForObject( // 한행만 가져올때
				sql,
				new Object[] {user.getUid()},
				new int[] {Types.VARCHAR},
				(rs,i)-> {	
					return rs.getString("PWD");
					 }
				);
		if(user.getPwd().equals(getpwd)) {
			return true;
		}
	} catch(Exception e) {
		return false;
	}	
	return false;
}

	public boolean idcheck(User user) {
		String sql = "SELECT * FROM users WHERE uid=?";
		String uid = null;	
		try{
			uid = jdbcTemplate.queryForObject( // 한행만 가져올때
				sql,
				new Object[] {user.getUid()},
				new int[] {Types.VARCHAR},
				(rs,i)-> {	
					return rs.getString("UID");
					 }
				);
		if(uid==null || uid.equals("")) {
			return true;
		} else {
			return false;
		}
	} catch(Exception e) {
		return true;
	}	
	
	}
	
//	public boolean idcheck(String uid) {
//		String sql = "SELECT * FROM users WHERE uid=?";
//		try {
//			jdbcTemplate.queryForObject(
//					sql,
//					new Object[] {uid},
//					new int[] {Types.VARCHAR},
//					(rs,i) -> new User());
//			return true;
//		} catch (Exception e) {
//			return false;
//		}
//	}
	

	
}
	
	
