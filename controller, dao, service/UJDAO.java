package com.tjoeun.dao;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeun.mapper.UJMapper;
import com.tjoeun.vo.AttachVO;
import com.tjoeun.vo.BoardVO;
import com.tjoeun.vo.PagingVO;
import com.tjoeun.vo.CommentVO;
import com.tjoeun.vo.UJRVO;
import com.tjoeun.vo.UJVO;

@Repository
public class UJDAO {

	@Autowired
	UJMapper mapper;

//	=================================================================
//	로그인
//	회원가입
	public int insertUser(UJVO uj) {

		return mapper.insertUser(uj);
	}

//	아이디 중복 체크
	public boolean idcheck(UJVO uj) {

		if (mapper.getUserById(uj.getUid()) != null) {
			return false;
		}
		return true;
	}

//	로그인 
	public boolean login(UJVO uj) {

		return mapper.login(uj) != null;
	}

//	아이디 찾기
	public boolean forgot(UJVO uj) {

		return mapper.forgot(uj) != null;
	}

//	특정 아이디 불러오기
	public UJVO getUserById(String uid) {

		return mapper.getUserById(uid);
	}

//	회원정보 수정
	public boolean updateByMap(Map<String, String> map) {
		return mapper.updateByMap(map) > 0;
	}

//	회원 탈퇴
	public int deleteUser(UJVO uj) {
		return mapper.deleteUser(uj);
	}
//	=================================================================
//	게시판
//	게시글 쓰기
	public boolean addBoard(BoardVO board) {

		return mapper.addBoard(board) > 0;
	}

//	파일 업로드
	public boolean addFileInfo(AttachVO attach) {

		return mapper.addFileInfo(attach) > 0;
	}

//	게시판 리스트
	public List<Map<String, Object>> boardList() {
		return mapper.boardList();
	}

//	게시글 상세보기
	public List<Map<String, Object>> bdetail(int num) {

		return mapper.bdetail(num);
	}

//	특정 파일 불러오기
	public String getFilename(int num) {

		return mapper.getFilename(num);
	}

//	특정 게시판 번호 불러오기
	public BoardVO getBoardByNum(int num) {

		return mapper.getBoardByNum(num);
	}

//	게시판 수정
	public boolean updateBoard(BoardVO b) {

		return mapper.updateBoard(b) > 0;

	}

//	게시글 삭제
	public int deleteBoard(BoardVO b) {
		return mapper.deleteBoard(b);
	}

//	파일 삭제
	public boolean deleteFileInfo(int num) {
		return mapper.deleteFileInfo(num) > 0;
	}

//	게시판 글 총 수
	public int countBoard() {
		return mapper.countBoard();
	}

//	게시판 페이지
	public List<BoardVO> selectBoard(PagingVO vo) {

		return mapper.selectBoard(vo);
	}

//	=================================================================
//	예약
//	예약
	public int reservation(UJRVO ujr) {

		return mapper.reservation(ujr);
	}

//	예약 일자, 타임, 인원
	public List<UJRVO> reserList() {

		return mapper.reserList();
	}

//	특정 예약 번호
	public List<UJRVO> getReser(String ruid) {

		return mapper.getReser(ruid);
	}

//	총 예약 명단
	public List<UJRVO> rList() {

		return mapper.rList();
	}

//	예약 취소
	public boolean rDeleted(int num) {
		return mapper.rDeleted(num) > 0;
	}
	
//	=================================================================
//	댓글
//	특정글 댓글 리스트
	public List<CommentVO> cList(int comment_num) { 
		return mapper.cList(comment_num); 
	} 
//	댓글 등록
	public boolean cCreate(CommentVO comment)  { 
		return mapper.cCreate(comment)>0; 
	}  
	
//	댓글 삭제
	public boolean cDelete(int cnum)  { 
		return mapper.cDelete(cnum)>0; 
		
	} 

}
