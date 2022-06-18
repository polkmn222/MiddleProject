package com.tjoeun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
//@RestController
@RequestMapping("/layout")
public class LayoutController {
	
	@GetMapping("/lay")
	public String layout() {
		
		return "layout/lay";
	}
	
	@GetMapping("/lay2")
	public String layout2() {
		
		return "layout/lay2";
	}
	
	@GetMapping("/lay3")
	public String layout3() {

		return "layout/lay3";
	}
	
	@GetMapping("/lay4")
	public String layout4() {
		
		return "layout/lay4";
	}
	
	@PostMapping("/lay4")
	@ResponseBody
	public Map<String, String> layout44(@RequestParam String hobby) {
		
		String msg = hobby + "를 선택했군요...";
		Map<String, String> map = new HashMap<>();
		map.put("msg", msg);
		return map;
	}
	
	@PostMapping("/arr")
	@ResponseBody
	public Map<String,String> procArray(
			@RequestParam(value="delfile[]") List<String> delfile) {
		
		Map<String,String> map = new HashMap<>();
		for(int i=0;i<delfile.size();i++) {
			map.put(""+i, delfile.get(i));
		}
		return map;
	}
	
	@PostMapping("/lay5")
	public String lay5() {
		
		return "/layout/lay5";
	}
	
	@GetMapping("/lay6")
	public String layout6() {
		
		return "layout/lay6";
	}
	
	@GetMapping("/lay7")
	public String layout7() {
		
		return "layout/lay7";
	}
	
	@GetMapping("/lay8")
	public String layout8() {
		
		return "layout/lay8";
	}
	
	@GetMapping("/lay9")
	public String layout9() {
		
		return "layout/lay9";
	}
	
}
