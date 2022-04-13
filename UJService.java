package com.tjoeun.svc;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeun.dao.UJDAO;
import com.tjoeun.vo.AttachVO;
import com.tjoeun.vo.BoardVO;
import com.tjoeun.vo.PagingVO;
import com.tjoeun.vo.UJRVO;
import com.tjoeun.vo.UJVO;


@Service
public class UJService {
	
	@Autowired
	UJDAO dao;
	
	
	public int insertUser(UJVO uj) {
		
		return dao.insertUser(uj);
	}

	public boolean idcheck(UJVO uj) {
		
		return dao.idcheck(uj);
	}

	public boolean login(UJVO uj) {
		
		return dao.login(uj);
	}
	
	public boolean forgot(UJVO uj) {
		
		return dao.forgot(uj);
	}
	
	 public UJVO getUserById(String uid) {
//		 System.out.println("svc"+uid);
	      return dao.getUserById(uid);
	 }
	 
	 public boolean updateByMap(Map<String,String> map) {
	      return dao.updateByMap(map);
	 }
	 
	 public int deleteUser(UJVO uj) {
	      return dao.deleteUser(uj);
	 }
	 
	 public boolean addBoard(BoardVO board) {
			
			return dao.addBoard(board);
		}
		
		// public boolean addBoard(HttpServletRequest request, BoardVO board, MultipartFile[] mfiles) {
	     public boolean addBoard(HttpServletRequest request, BoardVO board, MultipartFile[] mfiles) {
		      boolean saved = addBoard(board); // 글 저장
		      int board_num = board.getNum();  // 글 저장시 자동증가 필드
		      if (!saved) {
		         System.out.println("글 저장 실패");
		         return false;
		      }
				/* System.out.println(mfiles); */
				/*
				 * if(mfiles != null) { System.out.println("파일이 전달은 됨"); }
				 */
		      ServletContext context = request.getServletContext();
//		      System.out.println("svc: " + context);
//		      String savePath = context.getRealPath("/WEB-INF/upload");
		      String savePath = context.getRealPath("/images");
//		      String savePath = context.getRealPath("/resources/img");
//		      System.out.println("svc: " + savePath);
		      
		      int fileCnt = mfiles.length;
		      int saveCnt = 0;
		      boolean fSaved = false;
		      
		      if(!mfiles[0].isEmpty()) {	      
		      try {
		         for(int i=0;i<mfiles.length;i++) {
		            String filename = mfiles[i].getOriginalFilename();
//		            System.out.println(filename);
//		            if(mfiles[i]==null) {
//		            	mfiles[i].transferTo(new File(savePath));
//		            } else {
		            	mfiles[i].transferTo(new File(savePath+"/"+System.currentTimeMillis()/100000+filename)); //서버측 디스크	            	
//		            }
		          
//		            Map<String,Object> map = new HashMap<>();
//		            map.put("board_num", board_num);
//		            map.put("filename", filename);
//		            map.put("filesize", mfiles[i].getSize());
//		            fSaved = dao.addFileInfo(map); // attach 테이블에 파일정보 저장
//		            if(fSaved) saveCnt++;
		            AttachVO attach = new AttachVO();
		            attach.setBoard_num(board_num);
		            attach.setFilename(System.currentTimeMillis()/100000+filename);
		            attach.setFilesize(mfiles[i].getSize());
		            fSaved = dao.addFileInfo(attach); // attach 테이블에 파일정보 저장
		            if(fSaved) saveCnt++;		         
		         }
		      
		      } catch(Exception e) {
		         e.printStackTrace();
		      }	
		      return fileCnt==saveCnt ? true : false;//고치기
		      
		   }
			return saved;  	      
		 }
		 
		 public List<BoardVO> boardList() {
				List<Map<String,Object>> list = dao.boardList();
				List<BoardVO> list2 = new ArrayList<>();
				
				int prev_num = 0;
				for(int i=0;i<list.size();i++) {
					int bnum = (int)list.get(i).get("num");
					if(bnum==prev_num) { // 첨부파일이 다수개라서 중복되는 행이 있다면...
						BoardVO _board = list2.get(list2.size()-1);
						AttachVO att = new AttachVO();
						att.setFilename((String)list.get(i).get("filename"));
						att.setFilesize ((int)list.get(i).get("filesize"));
						_board.attach.add(att);
						continue;
					}
					
					// 첨부파일이 없거나 한개인 게시글이라면...
					Map<String, Object> m = list.get(i);
					BoardVO board = new BoardVO();
					board.setNum(bnum);
					board.setTitle((String)m.get("title"));
					board.setAuthor((String) m.get("author"));
					board.setBdate((java.sql.Date)m.get("bdate"));

					if(m.get("filename")!=null) { // 첨부파일을 가진 글이라면...
					
						AttachVO att = new AttachVO();
						att.setNum((int)list.get(i).get("att_num"));
						att.setFilename((String)list.get(i).get("filename"));
						att.setFilesize ((int)list.get(i).get("filesize"));
						board.attach.add(att);
					}
					list2.add(board);
					prev_num = bnum;  // 중복되는 행인지 확인하기 위함
				} // end of for()
				return list2;
			}
		 
		 public BoardVO bdetail(int num) {

				List<Map<String,Object>> list = dao.bdetail(num);
				BoardVO board = new BoardVO();
				int size = list.size();
				for(int i=0;i<size;i++) {
					Map<String,Object> map = list.get(i);
					if(i==0) {
						board.setNum( (int)map.get("num"));
						board.setTitle( (String)map.get("title"));
						board.setAuthor( (String)map.get("author"));
						board.setBdate( (java.sql.Date)map.get("bdate"));					
						board.setContents ( (String)map.get("contents"));
					}
					Object obj = map.get("filename");
					if(obj!=null) {
						AttachVO att = new AttachVO();
						att.setNum( (int)map.get("att_num"));
						att.setFilename((String)map.get("filename"));
						att.setFilesize((int)map.get("filesize"));
						board.attach.add(att);
					}
				}
				return board;
			}

			public String getFilename(int num) {
				return dao.getFilename(num);
			}
			
			public BoardVO getBoardByNum(int num) {
//				System.out.println("5");
				return dao.getBoardByNum(num);
			}
			
			public boolean updateBoard(BoardVO board) {
//				System.out.println("svc"+board.getNum());
				return dao.updateBoard(board);
			}
			
			public boolean updateBoard(HttpServletRequest request, BoardVO board, MultipartFile[] mfiles) {
			      boolean saved = updateBoard(board); // 글 저장
			      int board_num = board.getNum();  // 글 저장시 자동증가 필드
			      if (!saved) {
			         System.out.println("글 저장 실패");
			         return false;
			      }
			      
//			       System.out.println("ser"+mfiles); 
					
//					 if(mfiles != null) { System.out.println("파일이 전달은 됨"); }
					 
					
			      ServletContext context = request.getServletContext();
//			      String savePath = context.getRealPath("/WEB-INF/upload");
			      String savePath = context.getRealPath("/images");
			      int fileCnt = mfiles.length;
			      int saveCnt = 0;
			      boolean fSaved = false;
			      
			      if(!mfiles[0].isEmpty()) {	      
			      try {
			         for(int i=0;i<mfiles.length;i++) {
			            String filename = mfiles[i].getOriginalFilename();
//			            System.out.println(filename);
//			            if(mfiles[i]==null) {
//			            	mfiles[i].transferTo(new File(savePath));
//			            } else {
			            	mfiles[i].transferTo(new File(savePath+"/"+System.currentTimeMillis()/100000+filename)); //서버측 디스크	            	
//			            }
			          
//			            Map<String,Object> map = new HashMap<>();
//			            map.put("board_num", board_num);
//			            map.put("filename", filename);
//			            map.put("filesize", mfiles[i].getSize());
//			            fSaved = dao.addFileInfo(map); // attach 테이블에 파일정보 저장
//			            if(fSaved) saveCnt++;
			            AttachVO attach = new AttachVO();
			            attach.setBoard_num(board_num);
			            attach.setFilename(System.currentTimeMillis()/100000+filename);
			            attach.setFilesize(mfiles[i].getSize());
			            fSaved = dao.addFileInfo(attach); // attach 테이블에 파일정보 저장
			            if(fSaved) saveCnt++;		         
			         }
			      
			      } catch(Exception e) {
			         e.printStackTrace();
			      }	
			      return fileCnt==saveCnt ? true : false;//고치기
			      
			   }
				return saved;  	      
			 }
			

			public int deleteBoard(BoardVO board) {
				
				return dao.deleteBoard(board);
			}
			
			public boolean deleteFileInfo(int num, ResourceLoader resourceLoader) {
				
				String filename = getFilename(num);
//				Resource resource = (Resource)resourceLoader.getResource("WEB-INF/upload/"+filename);
				Resource resource = (Resource)resourceLoader.getResource("/images/"+filename);
			
				boolean deleted = false;
				try {
					String abPath = resource.getFile().getAbsolutePath();
					File fileDel = new File(abPath);
					deleted = fileDel.exists() ? fileDel.delete(): false;
				} catch (Exception e) {
					// TODO: handle exception
				}
				if(deleted) {
					return dao.deleteFileInfo(num);
				}
				return false;
			}
			public int countBoard() {
				return dao.countBoard();
			}

			
			public List<BoardVO> selectBoard(PagingVO vo) {
				return dao.selectBoard(vo);
			}
			
			public int reservation(UJRVO ujr) {
//				System.out.println("svc: " + ujr.getRtime());
//				System.out.println("total"+ujr.getTotal());
//				System.out.println("rp"+ujr.getRp());
				int total = 0;
				List<UJRVO> list= dao.rList();
				for(int i=0; i<list.size(); i++) {
					if(ujr.getRinfo().equals(list.get(i).getRinfo())&&
							ujr.getRtime().equals(list.get(i).getRtime())) {
						
						total +=(list.get(i).getRp());
					}
														
				}
				
				if(total>10) {
					return -1;
				}
				return dao.reservation(ujr);
			}
			
			public List<UJRVO> reserList() {

				return dao.reserList();
			}
			
			public List<UJRVO> selectReservation(PagingVO vo) {
				return dao.selectReservation(vo);
			}
			
			
			public List<UJRVO> getReser(String ruid) {
				return dao.getReser(ruid);
			}
			
			public int countList() {
				return dao.countList();
			}
			
			public List<UJRVO> rList() {
				return dao.rList();
			}
				
			
			public boolean rDeleted(int num) {
				
				return dao.rDeleted(num);
			}
			
			

}
