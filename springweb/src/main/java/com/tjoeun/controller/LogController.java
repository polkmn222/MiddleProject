package com.tjoeun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tjoeun.dao.LogDAO;

@RestController
//@Controller
@RequestMapping("/log")
public class LogController {
	
	@Autowired
	private LogDAO dao;
	
	@GetMapping("/test")
	public String test() {
		return "/log/test";
	}
//	log 테이블에 저장할 데이터 준비 num, contents
	@GetMapping("/add")
	public String add() {
		boolean added = dao.addLog("contents1");
		return "added="+added;
	}
	
	@GetMapping("/update")
	public String update() {
		Map<String, Object> param = new HashMap<>();
		param.put("num", 1);
		param.put("contents", "수정된 컨텐츠");
		boolean updated = dao.updateLog(param);
		return "updated=" + updated;
	}
	
	@GetMapping("/list")
	public String list() {
		List<Map<String,Object>> list = dao.list();
		return list.toString();
	}
	
	@GetMapping("/get")
	public String getLog(@RequestParam int num) {	
		Map<String,Object> map = dao.getLog(num);
		return map.toString();
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int num) {
		boolean deleted = dao.delete(num);
		return "deleted=" + deleted;
	}
	
	@GetMapping("/add_get_ai")
	public String addAndGetAI() {
		Map<String, Object> map = new HashMap<>();
		map.put("contents", "AI 필드 추출 테스트2");
		boolean added = dao.add_get_ai(map);
		return "added="+added + ", AI=" + map.get("num");
	}
}
