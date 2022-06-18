package com.tjoeun.dao;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.tjoeun.vo.User;

@Repository
public class UserDAO {
	
	private static final String fname = "C:/test/users.txt";
	
	public boolean login(User user) {
		
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(fname));
			String line = null;
			while((line=br.readLine())!=null) {
				String[] token = line.split("\\|");
				if(token[0].equals(user.getUid()) &&
						token[1].equals(user.getPwd())) {
						br.close();
						return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	public List<User> getList() {
		
		try {
			BufferedReader br = new BufferedReader(new FileReader(fname));
			List<User> list = new ArrayList<>();
			User user = null;
			String line = null;
			while((line=br.readLine())!=null) {
				String[] token = line.split("\\|");
				user = new User();
				user.setUid(token[0]);
				user.setPwd(token[1]);
				user.setName(token[2]);
				user.setPhone(token[3]);
				list.add(user);
			}
			br.close();
			return list;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return null;
	}
	
	public boolean add(User user) {
		
		try {
			PrintWriter pw = new PrintWriter(new FileWriter(fname, true));
			pw.println(user.getLine());
			pw.close();
			return true;
		} catch (Exception e) {
			
		}
		return false;
	}

	public User detail(String uid) {
		
		try {
			BufferedReader br = new BufferedReader(new FileReader(fname));
			String line = null;
			User user = new User();
			while((line=br.readLine())!=null) {
				String[] token = line.split("\\|");
				if(token[0].equals(uid)) {
					user.setUid(token[0]);
					user.setPwd(token[1]);
					user.setName(token[2]);
					user.setPhone(token[3]);
					br.close();
					return user;
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public boolean update(User user) {
		List<User> list = getList();   // 파일내용 전체 로드
		int idx = list.indexOf(user);  // 객체비교를 위해 equals(), hashcode() 오버라이드해야 함
		if(idx<0) {
			return false;
		}
		list.get(idx).setPhone(user.getPhone());				
		// 리스트의 내용을 기존 파일에 덮어쓴다
		return overwrite(list);
	}

	
	private boolean overwrite(List<User> list) {
		try {
			PrintWriter out = new PrintWriter(new FileWriter(fname));
			for(int i=0;i<list.size();i++) {
				out.println(list.get(i));
			}
			out.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	 

	public boolean deleted(User user) {
		
		List<User> list = getList();
		boolean deleted = list.remove(user);
		
		if(deleted) return overwrite(list);
		else return false;
	}
	
}
