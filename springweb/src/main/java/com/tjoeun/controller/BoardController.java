package com.tjoeun.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeun.svc.BoardSVC;
import com.tjoeun.vo.AttachVO;
import com.tjoeun.vo.BoardVO;
import com.tjoeun.vo.User;

@RequestMapping("/bbs")
@Controller
//@RestController
//@SessionAttributes("num")
public class BoardController {
	
	@Autowired
	private BoardSVC svc;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/add") // http://localhost/bbs/add
	public String add() {
		
//		BoardVO board = new BoardVO();
//		board.setTitle("게시판 테스트2");
//		board.setAuthor("Smith");
//		board.setContents("자동 증가 필드 값 추출하기");
//		boolean added = svc.addBoard(board);
//		int num = board.getNum();
//		return "added=" + added + ", AI= " + num;
		return "board/addForm";
	}
	
	@PostMapping("/add")
	@ResponseBody
	public Map<String,Boolean> add(@RequestParam(name = "files", required=false) MultipartFile[] mfiles,
					HttpServletRequest request,
					BoardVO board) {
		
//		if(mfiles==null) {
//			boolean added = svc.addBoard(board);
//			Map<String,Boolean> map = new HashMap<>();
//			map.put("added", added);
//			return map;			
//		} else {
			Map<String,Boolean> map = new HashMap<>();
			System.out.println();
			boolean added = svc.addBoard(request, board, mfiles);
//			System.out.println("여기는 되니? 3");
			map.put("added", added);
//			System.out.println("여기는 되니? 4");
			return map;
//		}
	}
	
	@PostMapping("/update")
	@ResponseBody
	public Map<String,Boolean> updateBoard2(BoardVO board) {
//		System.out.println("cor"+board.getNum());
		Map<String,Boolean> map = new HashMap<>();
		map.put("updated", svc.updateBoard2(board)>0 ? true : false);
//		System.out.println(board.getContents());
		return map;
	}
	
	
	@GetMapping("/list") // http://localhost/bbs/list
	public String boardList(Model model) {
		model.addAttribute("list",svc.boardList());
		return "board/list";
	}
	
	
	@GetMapping("/detail") // http://localhost/bbs/detail
	public String detail(@RequestParam int num, Model model) { // 일치시켜주면 자동으로 들어감
		BoardVO bbs = svc.detail(num);
		model.addAttribute("bbs", bbs);
//		AttachVO att = svc.detail(num);
		return "board/detail";
	}
	
	
	@GetMapping("/download/{filename}")
	public ResponseEntity<Resource> download( //http://localhost/file/download/sample.zip
			HttpServletRequest request,
			@PathVariable String filename) {
		Resource resource = (Resource)resourceLoader.getResource("WEB-INF/upload/"+filename);
		System.out.println("파일명:"+resource.getFilename());
        String contentType = null;
        try {
            contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
        } catch (IOException e) {
            e.printStackTrace();
        }
 
        if(contentType == null) {
            contentType = "application/octet-stream";
        }
 
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
	}
	
	@GetMapping("/file/download/{num}")
	public ResponseEntity<Resource> fileDownload(@PathVariable int num,
			HttpServletRequest request) {
		// attach 테이블에서 att_num 번호를 이용하여 파일명을 구하여 위의 방법을 사용
		String filename = svc.getFilename(num);
		Resource resource = (Resource)resourceLoader.getResource("WEB-INF/upload/"+filename);
		//System.out.println("파일명:"+resource.getFilename());
        String contentType = null;
        try {
            contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
        } catch (IOException e) {
            e.printStackTrace();
        }
 
        if(contentType == null) {
            contentType = "application/octet-stream";
        }
 
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public Map<String,Boolean> deleted(BoardVO board) {
		Map<String,Boolean> map = new HashMap<>();
		map.put("deleted", svc.deleted(board)>0);
		return map;
	}
	
	@PostMapping("/file/delete")
	@ResponseBody
	public Map<String,Boolean> deleteFileInfo(@RequestParam int num) {
		boolean deleted = svc.deleteFileInfo(num, resourceLoader);
		Map<String,Boolean> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}
	
	
	
	@GetMapping("/edit")
	public String edit(@RequestParam int num, Model model) {
		BoardVO bbs = svc.getUserByNum(num);
		
//		System.out.println(num+" edit "+bbs.getNum());
		model.addAttribute("bbs", bbs);
//		System.out.println("2");
		return "board/editBoard";
	}
	

	
//	@PostMapping("/update")
//	@ResponseBody
//	public Map<String,Boolean> update(BoardVO b) {
//		System.out.println("3");
//		Map<String, String> pMap = new HashMap<>();
//		pMap.put("contents", b.getContents());
//		pMap.put("title", b.getTitle());
//		pMap.put("author", b.getAuthor());
//		
//		boolean updated = svc.updateBoard(pMap);
//		System.out.println("4");
//		Map<String,Boolean> map = new HashMap<>();
//		map.put("updated", updated);
//		return map;
//
//	}
	
	
	
}
