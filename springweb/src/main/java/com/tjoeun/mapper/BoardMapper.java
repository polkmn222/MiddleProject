package com.tjoeun.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tjoeun.vo.AttachVO;
import com.tjoeun.vo.BoardVO;
import com.tjoeun.vo.User;

@Mapper
public interface BoardMapper {
	
	int addBoard(BoardVO board);
	
//	int addFileInfo(Map<String,Object> map);
	int addFileInfo(AttachVO attach);
	
	List<Map<String, Object>> boardList();
	
	List<Map<String, Object>> detail(int num);
	String getFilename(int num);
	
	BoardVO getUserByNum(int num);
	int updateBoard(Map<String,String> map);
	
	int updateBoard2(BoardVO board);
	
	int deleted(BoardVO board);
	int deleteFileInfo(int num);
	
}
