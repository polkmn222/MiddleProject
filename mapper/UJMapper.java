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
	
//	로그인
	String login(UJVO uj);
	
//	아이디 찾기
	String forgot(UJVO uj);
	
//	유저 추가
	int insertUser(UJVO uj);
	
//	특정 아이디 찾기
	UJVO getUserById(String uid);
	
//	회원정보 수정
	int updateByMap(Map<String,String> map);
	
//	회원 삭제
	int deleteUser(UJVO uj);
	
//	=================================================================
//	게시판

//	글쓰기
	int addBoard(BoardVO board);
	
//	파일 업로드
	int addFileInfo(AttachVO attach);
	
//	게시판 리스트
	List<Map<String, Object>> boardList();
	
//	게시판 상세보기
	List<Map<String, Object>> bdetail(int num);
	
//	특정 파일 불러오기
	String getFilename(int num);
	
//	특정 게시판 번호 불러오기
	BoardVO getBoardByNum(int num);
	
//	글 수정
	int updateBoard(BoardVO board);
	
//	글 삭제
	int deleteBoard(BoardVO board);
	
//	파일 삭제
	int deleteFileInfo(int num);
	
//	게시글 전체 갯수
	public int countBoard();
	
//	게시판 페이지
	public List<BoardVO> selectBoard(PagingVO vo);
	
//	=================================================================
//	예약
	
//	예약
	int reservation(UJRVO ujr);
	
//	예약 일자, 타임, 인원
	List<UJRVO> reserList();
	
//	특정 예약 번호
	List<UJRVO> getReser(String ruid);
	
//	총 예약 명단
	List<UJRVO> rList();
	
//	예약 취소
	int rDeleted(int num);
	
}
