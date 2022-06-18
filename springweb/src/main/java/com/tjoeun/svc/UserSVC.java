package com.tjoeun.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeun.dao.UserJdbcDAO;
import com.tjoeun.dao.UserJdbcTemplateDAO;
import com.tjoeun.vo.User;

@Service
public class UserSVC {
	
//	@Autowired
//	private UserDAO dao;
	
	@Autowired
	private UserJdbcDAO dao;
	
	public boolean login(User user) {
		
		return dao.login(user);
	}

	public List<User> getList() {
		
		return dao.getList();
	}
	
	public boolean add(User user) {
		
		return dao.add(user);
	}

	public User detail(String uid) {
		
		return dao.detail(uid);
	}

	public boolean update(User user) {
		
		return dao.update(user);
	}
	
	public boolean deleted(User user) {
		
		return dao.deleted(user);
		
	}
	

}
