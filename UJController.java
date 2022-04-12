package com.tjoeun.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeun.svc.UJService;
import com.tjoeun.vo.BoardVO;
import com.tjoeun.vo.PagingVO;
import com.tjoeun.vo.UJRVO;
import com.tjoeun.vo.UJVO;






@RequestMapping("/uj")
@Controller
@SessionAttributes("uid")

public class UJController {
	
	@Autowired
	private UJService svc;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/home") // http://localhost/uj/home
//	@ResponseBody
	public String home() {
		
		return "uj/home";
	}
	
	@GetMapping("/game") // http://localhost/uj/game
//	@ResponseBody
	public String game() {
		
		return "game/block";
	}
	
	@GetMapping("/clock") // http://localhost/uj/game
//	@ResponseBody
	public String clock() {
		
		return "game/clock";
	}
	
	@GetMapping("/calendar") // http://localhost/uj/calendar
//	@ResponseBody
	public String calendar(@SessionAttribute(name="uid", required=false) String uerid, Model model) {
		UJVO user = svc.getUserById(uerid);
		
		model.addAttribute("user", user);
		return "game/calendar";
	
	}
	
	@GetMapping("/calendar2") // http://localhost/uj/home
//	@ResponseBody
	public String calendar2() {
		
		return "game/calendar2";
	}
	@GetMapping("/calendar3") // http://localhost/uj/home
//	@ResponseBody
	public String calendar3() {
		
		return "game/cal3";
	}
	
	
	
	
	@GetMapping("/reservation") // http://localhost/uj/calendar
//	@ResponseBody
//	@RequestParam String rinfo,
	public String reservation(@SessionAttribute(name="uid", required=false) String uerid,Model model,UJRVO ujr) {
		UJVO user = svc.getUserById(uerid);
		List<UJRVO> list = svc.reserList();
//		System.out.println("con " + rinfo);
//		UJRVO list = svc.getList(rinfo);
		model.addAttribute("list", list);
//		model.addAttribute("list",svc.getreservation());
		model.addAttribute("ujr", ujr);
		model.addAttribute("user", user);
		
//		System.out.println("con1: "+ujr);
//		System.out.println("con1: "+user);
		return "game/reservation";
		
	}
	
//	@GetMapping("/edit")
//	public String edit(@RequestParam int num, Model model) {
//		BoardVO bbs = svc.getUserByNum(num);
//		
////		System.out.println(num+" edit "+bbs.getNum());
//		model.addAttribute("bbs", bbs);
////		System.out.println("2");
//		return "board/editBoard";
//	}
	
	
	
//	@GetMapping("/list") //http://localhost/mb/list
//	public String list(@SessionAttribute(name="uid", required=false) String uid, Model model) {
//		if(uid==null) {
//			return "redirect:/mb/login";  // 로그인 폼으로...
//		} else {
//			List<UJRVO> list = svc.reserList();
//			model.addAttribute("list", list);
//			return "user/userList";
//		}
//	}
	
	
	
	
	@PostMapping("/reservation")
	@ResponseBody
	public Map<String, Boolean> reservation(UJRVO ujr) {
//		System.out.println(ujr);
//		System.out.println("con2: "+ujr.getRinfo());
		Map<String, Boolean> map = new HashMap<>();
		map.put("rv", svc.reservation(ujr)>0 ? true : false);
		return map;
	}
	
	
	
	
	 @GetMapping("/naverMap") 
//	@RequestMapping(value = "/naverMap")
	public String naverMap() {
		
		return "uj/naverMap";
	}
	

	@GetMapping("/add")
	public String form() {
		
		return "uj/add";
	}
	
	@PostMapping("/add")
	@ResponseBody
	public Map<String, Boolean> addUser(UJVO uj) {
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("add", svc.insertUser(uj)>0 ? true : false);
		return map;
	}
	
	@PostMapping("/idcheck")
	@ResponseBody
	public Map<String,Boolean> idcheck(UJVO uj) {
		
		Map<String,Boolean> map = new HashMap<>();
		map.put("check", svc.idcheck(uj));

		return map;
	}
	
	@GetMapping("/login") // get 이면 여기 post 면 밑
	public String login() {
		
		return "uj/login";
	}
	
	
	@PostMapping("/login")
	@ResponseBody
	public Map<String, Boolean> login(UJVO uj, Model m) {
		boolean ok = svc.login(uj);
		if(ok) {
			m.addAttribute("uid", uj.getUid());
		}
		Map<String, Boolean> map = new HashMap<>();		
		map.put("ok", ok);
		return map;
	}
	
	@GetMapping("/forgot") // get 이면 여기 post 면 밑
	public String forgot() {
		
		return "uj/forgot";
	}
	
	
	@PostMapping("/forgot")
	@ResponseBody
	public Map<String, Boolean> forgot(UJVO uj, Model m) {
		boolean ok = svc.forgot(uj);
		if(ok) {
			m.addAttribute("uid", uj.getUid());
		}
		Map<String, Boolean> map = new HashMap<>();		
		map.put("ok", ok);
		return map;
	}
	
	
	
	
	@GetMapping("/logout") // http://localhost/uj/logout
	public String logout(SessionStatus status) {
		
		status.setComplete();
		return "redirect:/uj/home";  
	}
	
	@GetMapping("/edit")
	public String edit(@SessionAttribute(name="uid", required=false) String uerid, Model model) {
//		System.out.println("con"+uerid);
		UJVO user = svc.getUserById(uerid);
		model.addAttribute("user", user);
		return "uj/edit";
	}
	
	
	
	@PostMapping("/update")
	@ResponseBody
	public Map<String,Boolean> update(UJVO uj) {
		Map<String, String> pMap = new HashMap<>();
		pMap.put("uid", uj.getUid());
		pMap.put("pwd", uj.getPwd());		
		pMap.put("phone", uj.getPhone());
		boolean updated = svc.updateByMap(pMap);
	
	  Map<String,Boolean> map = new HashMap<>(); 
	  map.put("updated", updated);
	  return map;
	  
	  }
	
	@PostMapping("/delete")
	@ResponseBody
	public Map<String,Boolean> deleteUser(UJVO uj) {
		Map<String,Boolean> map = new HashMap<>();
		map.put("deleted", svc.deleteUser(uj)>0 ? true : false);
		return map;
	}
	 
	@GetMapping("/badd") // http://localhost/bbs/add
		public String badd(@SessionAttribute(name="uid", required=false) String uerid, Model model) {
		UJVO user = svc.getUserById(uerid);
		model.addAttribute("user", user);
		return "board/addForm";
	}
	
	@PostMapping("/badd")
	@ResponseBody
	public Map<String,Boolean> badd(@SessionAttribute(name="uid", required=false) 
				@RequestParam(name = "mfiles", required=false) MultipartFile[] mfiles,
					HttpServletRequest request,
					BoardVO board,
					Model model) {
//			System.out.println("컨트롤러 파일 : "+mfiles);
			Map<String,Boolean> map = new HashMap<>();
//			System.out.println("con"+mfiles);
			boolean added = svc.addBoard(request, board, mfiles);
			model.addAttribute("board", board);
			map.put("added", added);
//			map.put("added", false);
			return map;

	}
	
	@GetMapping("/list") 
	public String boardList(@SessionAttribute(name="uid", required=false) String uid,PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		if(uid==null) {
			return "redirect:/uj/login";
		} else {
			
			int total = svc.countBoard();
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll", svc.selectBoard(vo));
			model.addAttribute("list",svc.boardList());
			
			return "board/list";
		}
	}
	
	
	
	
	@GetMapping("/detail") // http://localhost/bbs/detail
	public String detail(@RequestParam int num, Model model) { // 일치시켜주면 자동으로 들어감
		BoardVO bbs = svc.bdetail(num);
		model.addAttribute("bbs", bbs);
//		AttachVO att = svc.detail(num);
		return "board/detail";
	}
	
	@GetMapping("/bedit")
	public String edit(@RequestParam int num, Model model) {
		BoardVO bbs = svc.getBoardByNum(num);
		
//		System.out.println(num+" edit "+bbs.getNum());
		model.addAttribute("bbs", bbs);
//		System.out.println("2");
		return "board/editBoard";
	}
	
	@RequestMapping(value = "/bupdate")
	@ResponseBody
	public Map<String,Boolean> updateBoard(@SessionAttribute(name="uid", required=false) 
					@RequestParam(name = "mfiles", required=false) MultipartFile[] mfiles,
					HttpServletRequest request,
					BoardVO board,
					Model model) {
//		System.out.println("cor"+board.getNum());
//		System.out.println("con"+board.getContents());
//		System.out.println("con"+mfiles);
		Map<String,Boolean> map = new HashMap<>();
		boolean updated = svc.updateBoard(request, board, mfiles);
		map.put("updated", updated);
		return map;
	}
	
	
	
	
	@GetMapping("/download/{filename}")
	public ResponseEntity<Resource> download( //http://localhost/file/download/sample.zip
			HttpServletRequest request,
			@PathVariable String filename) {
//		Resource resource = (Resource)resourceLoader.getResource("WEB-INF/upload/"+filename);
		Resource resource = (Resource)resourceLoader.getResource("/images/"+filename);
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
//		Resource resource = (Resource)resourceLoader.getResource("WEB-INF/upload/"+filename);
		Resource resource = (Resource)resourceLoader.getResource("/images/"+filename);
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
	
	@PostMapping("/bdelete")
	@ResponseBody
	public Map<String,Boolean> deleteBoard(BoardVO board) {
		Map<String,Boolean> map = new HashMap<>();
		map.put("deleted", svc.deleteBoard(board)>0);
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
	
	
//	@RequestMapping(value = "/test", method = RequestMethod.GET)
//
//	public ModelAndView test(HttpServletRequest request) {
//
//		Set pathSet = request.getSession().getServletContext().getResourcePaths("/");
//
//		System.out.println(pathSet);	
//		String pdfPath = request.getSession().getServletContext().getRealPath("/upload/dog.jpg");
//		String pdfPath2 = request.getSession().getServletContext().getRealPath("/dog.jpg");
//
//		System.out.println(pdfPath);	
//		System.out.println(pdfPath2);	
//
//
//		return null;
//
//	}
	
	
	
	
}
