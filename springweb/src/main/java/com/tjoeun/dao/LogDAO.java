package com.tjoeun.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeun.mapper.LogMapper;

@Repository
public class LogDAO {
	@Autowired
	private LogMapper logMapper;
	
	public boolean addLog(String contents) {
		return logMapper.addLog(contents)>0;
	}

	public boolean updateLog(Map<String, Object> param) {
		return logMapper.updateLog(param)>0;
	}

	public List<Map<String, Object>> list() {
		return logMapper.list();
	}
	
	public Map<String,Object> getLog(int num){
		return logMapper.getLog(num);
	}

	public boolean delete(int num) {
		return logMapper.delete(num)>0;
	}

	public boolean add_get_ai(Map<String, Object> map) {
		return logMapper.add_get_ai(map)>0;
	}
	
}
