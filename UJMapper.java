package com.tjoeun.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tjoeun.vo.AttachVO;
import com.tjoeun.vo.BoardVO;
import com.tjoeun.vo.PagingVO;
import com.tjoeun.vo.UJRVO;
import com.tjoeun.vo.UJVO;


@Mapper
public interface UJMapper {
	
	String login(UJVO uj);
	
	String forgot(UJVO uj);
	
	
	int insertUser(UJVO uj);
	
	UJVO getUserById(String uid);
	
	int updateByMap(Map<String,String> map);
	
	int deleteUser(UJVO uj);
	
	int addBoard(BoardVO board);
	int addFileInfo(AttachVO attach);
	
	List<Map<String, Object>> boardList();
	
	List<Map<String, Object>> bdetail(int num);
	String getFilename(int num);
	
	BoardVO getBoardByNum(int num);
	
	
	int updateBoard(BoardVO board);
	
	int deleteBoard(BoardVO board);
	int deleteFileInfo(int num);
	
	public int countBoard();
	public List<BoardVO> selectBoard(PagingVO vo);
	
	
	int reservation(UJRVO ujr);
	
	UJRVO getList(String rinfo);
	
	
	
	List<UJRVO> reserList();
	
	
	UJRVO getreservation(String rinfo);
	List<Map<String, Object>> reserList2();
	
}
