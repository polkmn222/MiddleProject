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
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeun.svc.UJService;
import com.tjoeun.vo.BoardVO;
import com.tjoeun.vo.PagingVO;
import com.tjoeun.vo.CommentVO;
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

//	홈
	@GetMapping("/home") // http://localhost/uj/home
	public String home() {

		return "uj/home";
	}

//	미니게임
	@GetMapping("/game")
	public String game() {

		return "game/block";
	}

//	시계
	@GetMapping("/clock")
	public String clock() {

		return "game/clock";
	}

//	소개
	@GetMapping("/info")
	public String info() {

		return "uj/info";
	}

//	미구현
	@GetMapping("/kakao")
	public String kakao() {

		return "uj/kakao";
	}

//	네이버 지도
	@GetMapping("/naverMap")
	public String naverMap() {

		return "uj/naverMap";
	}

//	=================================================================
//	로그인
//	유저 추가
	@GetMapping("/add")
	public String form() {

		return "uj/add";
	}

	@PostMapping("/add")
	@ResponseBody
	public Map<String, Boolean> addUser(UJVO uj) {
		Map<String, Boolean> map = new HashMap<>();

		map.put("add", svc.insertUser(uj) > 0 ? true : false);
		return map;
	}

//	아이디 중복체크
	@PostMapping("/idcheck")
	@ResponseBody
	public Map<String, Boolean> idcheck(UJVO uj) {

		Map<String, Boolean> map = new HashMap<>();
		map.put("check", svc.idcheck(uj));

		return map;
	}

//	로그인
	@GetMapping("/login")
	public String login() {

		return "uj/login";
	}

	@PostMapping("/login")
	@ResponseBody
	public Map<String, Boolean> login(UJVO uj, Model m) {
		boolean ok = svc.login(uj);
		if (ok) {
			m.addAttribute("uid", uj.getUid());
		}
		Map<String, Boolean> map = new HashMap<>();
		map.put("ok", ok);
		return map;
	}

//	비밀번호 찾기
	@GetMapping("/forgot")
	public String forgot() {

		return "uj/forgot";
	}

	@PostMapping("/forgot")
	@ResponseBody
	public Map<String, Boolean> forgot(UJVO uj, Model m) {
		boolean ok = svc.forgot(uj);
		if (ok) {
			m.addAttribute("uid", uj.getUid());
		}
		Map<String, Boolean> map = new HashMap<>();
		map.put("ok", ok);
		return map;
	}

//	로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status) {

		status.setComplete();
		return "redirect:/uj/home";
	}

//	회원정보 수정
	@GetMapping("/edit")
	public String edit(@SessionAttribute(name = "uid", required = false) String uerid, Model model) {
		UJVO user = svc.getUserById(uerid);
		model.addAttribute("user", user);
		return "uj/edit";
	}

	@PostMapping("/update")
	@ResponseBody
	public Map<String, Boolean> update(UJVO uj) {
		Map<String, String> pMap = new HashMap<>();
		pMap.put("uid", uj.getUid());
		pMap.put("pwd", uj.getPwd());
		pMap.put("phone", uj.getPhone());
		boolean updated = svc.updateByMap(pMap);

		Map<String, Boolean> map = new HashMap<>();
		map.put("updated", updated);
		return map;

	}

//	회원정보 삭제
	@PostMapping("/delete")
	@ResponseBody
	public Map<String, Boolean> deleteUser(UJVO uj) {
		Map<String, Boolean> map = new HashMap<>();
		map.put("deleted", svc.deleteUser(uj) > 0 ? true : false);
		return map;
	}

//	=================================================================
//	게시판
//	글쓰기
	@GetMapping("/badd")
	public String badd(@SessionAttribute(name = "uid", required = false) String uerid, Model model) {
		UJVO user = svc.getUserById(uerid);
		model.addAttribute("user", user);
		return "board/addForm";
	}

	@PostMapping("/badd")
	@ResponseBody
	public Map<String, Boolean> badd(
			@SessionAttribute(name = "uid", required = false) @RequestParam(name = "mfiles", required = false) MultipartFile[] mfiles,
			HttpServletRequest request, BoardVO board, Model model) {

		Map<String, Boolean> map = new HashMap<>();
		boolean added = svc.addBoard(request, board, mfiles);
		model.addAttribute("board", board);
		map.put("added", added);
		return map;

	}

//	게시판 리스트 + 페이지
	@GetMapping("/list")
	public String boardList(@SessionAttribute(name = "uid", required = false) String uid, PagingVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		if (uid == null) {
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
			model.addAttribute("list", svc.boardList());

			return "board/list";
		}
	}



//	게시글 수정
	@GetMapping("/bedit")
	public String edit(@SessionAttribute(name = "uid", required = false) String uid, @RequestParam int num, Model model,
			BoardVO board) {
		BoardVO bbs = svc.getBoardByNum(num);
		model.addAttribute("bbs", bbs);
		model.addAttribute("uid", uid);

		return "board/editBoard";

	}

	@RequestMapping(value = "/bupdate")
	@ResponseBody
	public Map<String, Boolean> updateBoard(
			@SessionAttribute(name = "uid", required = false) @RequestParam(name = "mfiles", required = false) MultipartFile[] mfiles,
			HttpServletRequest request, BoardVO board, Model model) {
		Map<String, Boolean> map = new HashMap<>();
		boolean updated = svc.updateBoard(request, board, mfiles);
		map.put("updated", updated);
		return map;
	}

//	파일 다운로드
	@GetMapping("/download/{filename}")
	public ResponseEntity<Resource> download(HttpServletRequest request, @PathVariable String filename) {
//		Resource resource = (Resource)resourceLoader.getResource("WEB-INF/upload/"+filename);
		Resource resource = (Resource) resourceLoader.getResource("/images/" + filename);
		System.out.println("파일명:" + resource.getFilename());
		String contentType = null;
		try {
			contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (contentType == null) {
			contentType = "application/octet-stream";
		}

		return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
				.body(resource);
	}

	@GetMapping("/file/download/{num}")
	public ResponseEntity<Resource> fileDownload(@PathVariable int num, HttpServletRequest request) {
		// attach 테이블에서 att_num 번호를 이용하여 파일명을 구하여 위의 방법을 사용
		String filename = svc.getFilename(num);
//		Resource resource = (Resource)resourceLoader.getResource("WEB-INF/upload/"+filename);
		Resource resource = (Resource) resourceLoader.getResource("/images/" + filename);
		String contentType = null;
		try {
			contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (contentType == null) {
			contentType = "application/octet-stream";
		}

		return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
				.body(resource);
	}

//	게시글 삭제
	@PostMapping("/bdelete")
	@ResponseBody
	public Map<String, Boolean> deleteBoard(BoardVO board) {
		Map<String, Boolean> map = new HashMap<>();
		map.put("deleted", svc.deleteBoard(board) > 0);
		return map;
	}

//	파일 삭제
	@PostMapping("/file/delete")
	@ResponseBody
	public Map<String, Boolean> deleteFileInfo(@RequestParam int num) {
		boolean deleted = svc.deleteFileInfo(num, resourceLoader);
		Map<String, Boolean> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}

//	=================================================================
//	예약
//	예약 리스트
	@GetMapping("/rlist")
	public String rlist(@SessionAttribute(name = "uid", required = false) String uid, Model model) {

		if (uid == null) {
			return "redirect:/uj/login";
		} else {
			List<UJRVO> rList = svc.rList();
			model.addAttribute("list", svc.reserList());
			model.addAttribute("rList", rList);

			return "game/rlist";
		}
	}

//	예약
	@GetMapping("/reservation")
	public String reservation(@SessionAttribute(name = "uid", required = false) String uerid, Model model, UJRVO ujr) {
		UJVO user = svc.getUserById(uerid);
		List<UJRVO> list = svc.reserList();
		model.addAttribute("list", list);
		model.addAttribute("user", user);

		return "game/reservation";

	}

	@PostMapping("/reservation")
	@ResponseBody
	public Map<String, Object> reservation(UJRVO ujr) {

		Map<String, Object> map = new HashMap<>();
		map.put("rv", svc.reservation(ujr) > 0 ? true : false);

		return map;
	}

//	예약 상세정보
	@GetMapping("/rdetail")
	public String rdetail(@SessionAttribute(name = "uid", required = false) String userid, Model model) {

		UJVO user = svc.getUserById(userid);
		model.addAttribute("user", user);
		List<UJRVO> list = svc.getReser(userid);
		model.addAttribute("list", list);

		return "game/rdetail";
	}

//	예약취소
	@PostMapping("/rDeleted")
	@ResponseBody
	public Map<String, Boolean> rDeleted(@RequestParam int num) {
		boolean rDeleted = svc.rDeleted(num);
		Map<String, Boolean> map = new HashMap<>();
		map.put("rDeleted", rDeleted);
		return map;
	}

//	=================================================================
//	댓글
//	게시글 상세보기, 댓글
	@GetMapping("/detail")
	public String detail(@SessionAttribute(name = "uid", required = false) String uid, @RequestParam int num,
			Model model,CommentVO comment) {
		UJVO user = svc.getUserById(uid);
		model.addAttribute("user", user);
		BoardVO bbs = svc.bdetail(num);
		List<CommentVO> cList = svc.cList(num);
		
		model.addAttribute("cList", cList);
		model.addAttribute("bbs", bbs);
		model.addAttribute("check", uid != null && bbs.getAuthor().equals(uid) ? true : false);
		model.addAttribute("reply", comment);
		return "board/detail";
	}
	
//	댓글 등록
	@PostMapping("/cadd")
	@ResponseBody
	public Map<String, Boolean> cadd(@SessionAttribute(name = "uid", required = false)String uid, Model model, CommentVO comment) {

		Map<String, Boolean> map = new HashMap<>();
		boolean cadd = svc.cCreate(comment);
		map.put("cadd", cadd);
		return map;

	}
	
//	댓글 삭제
	@PostMapping("/cDeleted")
	@ResponseBody
	public Map<String, Boolean> cDeleted(@RequestParam int num) {
		boolean cDeleted = svc.cDelete(num);
		Map<String, Boolean> map = new HashMap<>();
		map.put("cDeleted", cDeleted);
		return map;
	}
	
	


}
