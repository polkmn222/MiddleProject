package com.tjoeun.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeun.mapper.BoardMapper;
import com.tjoeun.vo.AttachVO;
import com.tjoeun.vo.BoardVO;
import com.tjoeun.vo.User;



@Repository
public class BoardDAO {
	
	@Autowired
	private BoardMapper boardMapper;
	
	public boolean addBoard(BoardVO board) {
		
		return boardMapper.addBoard(board)>0;	
	}
	
//	public boolean addFileInfo(Map<String, Object> map) {
//	      return boardMapper.addFileInfo(map)>0;
//	 }
	
	public boolean addFileInfo(AttachVO attach) {
	      return boardMapper.addFileInfo(attach)>0;
	 }
	
	public List<Map<String, Object>> boardList() {
		return boardMapper.boardList();
	}
	
	public List<Map<String, Object>> detail(int num) {
		
		return boardMapper.detail(num);
	}
	
	public String getFilename(int num) {
		return boardMapper.getFilename(num);
	}
	
	public BoardVO getUserByNum(int num) {
	      return boardMapper.getUserByNum(num);
	}
	
	public boolean updateBoard(Map<String,String> map) {
	      return boardMapper.updateBoard(map)>0;
	}
	
	public int updateBoard2(BoardVO b) {
		int update = boardMapper.updateBoard2(b);
		System.out.println("dao"+update);
		return update;
	   }

	
	
	public int deleted(BoardVO b) {
	      return boardMapper.deleted(b);
	}
	
	public boolean deleteFileInfo(int num) {
		return boardMapper.deleteFileInfo(num)>0;
	}
	 
	 
	
}
