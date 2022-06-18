package com.tjoeun.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LogMapper {
	//CRUD, AI필드 값 추출
	int addLog(String contents);

	int updateLog(Map<String, Object> param);

	List<Map<String, Object>> list();
	
	Map<String, Object> getLog(int num);

	int delete(int num);

	int add_get_ai(Map<String, Object> map);
	
}
