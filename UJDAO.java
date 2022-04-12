package com.tjoeun.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeun.mapper.UJMapper;
import com.tjoeun.vo.AttachVO;
import com.tjoeun.vo.BoardVO;
import com.tjoeun.vo.PagingVO;
import com.tjoeun.vo.UJRVO;
import com.tjoeun.vo.UJVO;


@Repository
public class UJDAO {
	
	@Autowired
	UJMapper mapper;
	
	public int insertUser(UJVO uj) {
		
		return mapper.insertUser(uj);
	}
	
	 public boolean idcheck(UJVO uj) {
		   if(mapper.getUserById(uj.getUid())!=null) {
			   return false;
		   } 
			 return true;  
		   }

	public boolean login(UJVO uj) {
		
		return mapper.login(uj)!=null;
	}
	
	public boolean forgot(UJVO uj) {
		
		return mapper.forgot(uj)!=null;
	}
	
	
	
	public UJVO getUserById(String uid) {
//	     System.out.println("dao"+uid);
		return mapper.getUserById(uid);
	}
	
	public boolean updateByMap(Map<String,String> map) {
	      return mapper.updateByMap(map)>0;
	}
	
	 public int deleteUser(UJVO uj) {
	      return mapper.deleteUser(uj);
	 }
	 
	 public boolean addBoard(BoardVO board) {
			
			return mapper.addBoard(board)>0;	
		}
		
	public boolean addFileInfo(AttachVO attach) {
		     
			return mapper.addFileInfo(attach)>0;
	}
	
	public List<Map<String, Object>> boardList() {
		return mapper.boardList();
	}
	
	public List<Map<String, Object>> bdetail(int num) {
		
		return mapper.bdetail(num);
	}
	
	public String getFilename(int num) {
		return mapper.getFilename(num);
	}
	
	public BoardVO getBoardByNum(int num) {
	      return mapper.getBoardByNum(num);
	}
	
	
	
	public boolean updateBoard(BoardVO b) {
		return  mapper.updateBoard(b)>0;
//		System.out.println("dao"+update);
		
	}
	
	
	 
	
	
	public int deleteBoard(BoardVO b) {
	      return mapper.deleteBoard(b);
	}
	
	public boolean deleteFileInfo(int num) {
		return mapper.deleteFileInfo(num)>0;
	}
	
	public int countBoard() {
		return mapper.countBoard();
	}

	
	public List<BoardVO> selectBoard(PagingVO vo) {
		return mapper.selectBoard(vo);
	}
	
	public int reservation(UJRVO ujr) {
//		System.out.println("dao"+ujr.getRinfo());
		return mapper.reservation(ujr);
	}
	
//	public List<Map<String, Object>> reserList() {
//		return mapper.reserList();
//	}
	public UJRVO getList(String rinfo) {
	      return mapper.getList(rinfo);
	}
	
	
	
	public List<UJRVO> reserList() {
	     
		return mapper.reserList();
	}
	
	
	
	public UJRVO getreservation(String rinfo) {
//	     System.out.println("dao"+uid);
		return mapper.getreservation(rinfo);
	}

	
}
