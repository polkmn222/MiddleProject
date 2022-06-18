package com.tjoeun.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {
	
	@GetMapping("/") // index.page   프로젝트 했을때 망가진거 같으면 만들어서 확인해보기.
	public String index() {
		
		return "index"; // 요청에 대한 응답이 브라우저에 바로 표시(@RestController)
	}
	
	@GetMapping("/json/test") // http://localhost/json/test
	@ResponseBody  // 응답을 바로 내보낼거야.
	public String resString() {
		
		return "{\"key\":\"value\"}";
	}
	
	// Map을 이용한 JSON  문자열 전송하기
	@GetMapping("/map/test") // http://localhost/map/test
	@ResponseBody // 응답의 본체다.
	public Map<String, Object> mapTest() {
		
		Map<String, Object> map = new HashMap<>();
		map.put("name", "smith");
		map.put("level", 7);
		map.put("birth", java.sql.Date.valueOf("2000-01-21"));
		map.put("married", true);
		
		return map;
	}
	
	// View 연결
	@GetMapping("/view/test") // http://localhost/view/test
	public String viewTest() {
		
		return "index";
	}
}
