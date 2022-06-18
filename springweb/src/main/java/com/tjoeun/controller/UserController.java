package com.tjoeun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.tjoeun.svc.UserSVC;
import com.tjoeun.vo.User;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
@SessionAttributes("uid") // +s user 라는 키를 사용하여 session으로 저장 선언
@RequestMapping("/user")  // get + post mapping
public class UserController { // http://localhost/user/list
	
	@Autowired
	private UserSVC svc;
	
	@GetMapping("/login") // get 이면 여기 post 면 밑
	public String form() {
		
		return "user/loginForm";
	}
	
	/*
	public Map<String, Boolean> login(@RequestParam("uid") String uid, @RequestParam("pwd") String pwd) {
		
		Map<String, Boolean> map = new HashMap<>();
		boolean ok = false;
		if(uid.equals("smith") && pwd.equals("1111")) ok = true;
		map.put("ok", ok);
		return map;
	} */
	
	@PostMapping("/login")
	@ResponseBody
	/* 만약 이 메소드의 파라미터에 SessionAttribute("uid")에 선언된
	   uid 변수가 있다면 자동으로 세션에 저장됨.
	   Model에 uid를 저장하기 전에라도 uid 파라미터에 값이 전달되면 자동으로 세션에 uid가 저장됨 
	 */
	public Map<String, Boolean> login(User user, Model model) {
		Map<String, Boolean> map = new HashMap<>();
		boolean ok = svc.login(user);
		if(ok) {
			model.addAttribute("uid", user.getUid());  // 세션에 저장
		}
		map.put("ok", ok);
		return map;
	}
	
	@GetMapping("/logout") // http://localhost/user/logout
	public String logout(SessionStatus status) {
		
		status.setComplete();
		return "redirect:/user/login";  // spring (x) response.sendRedirect("/user/login");
	}
	
	@GetMapping("/list") // 세션에 user가 저장되어 있지 않으면 오류가 발생하므로 required
	public String list(@SessionAttribute(name="uid", required=false) String uid, Model model) {
//		맨 처음엔 session 이 없으니 에러 방지
		
		if(uid==null) {
			return "redirect:/user/login";  // 로그인 폼으로...
		} else {
			List<User> list = svc.getList();
			model.addAttribute("list", list);
			return "user/userList";
		}
	}
	

	@GetMapping("/add") // http://localhost/user/input
	public String addUser() { 
		
		return "user/addForm";
		
	}
	
	@PostMapping("/add")
	@ResponseBody
	public Map<String, Boolean> addUser(User user, Model model) {
		Map<String, Boolean> map = new HashMap<>();
		boolean add = svc.add(user);
		
		map.put("add", add);
		return map;
	}
	
	
	@GetMapping("/detail") // http://localhost/user/detail
	public String detail(@RequestParam String userid, Model model) { 
		User user = svc.detail(userid);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("detail",detail);
//		mv.setViewName("/user/detail");
		model.addAttribute("user", user);
		
		return "user/detail";
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam String userid, Model model) {
		User user = svc.detail(userid);
		model.addAttribute("user", user);
		return "user/editUser";
	}
	
	@PostMapping("/update")
	@ResponseBody
	public Map<String,Boolean> update(User user) {
		boolean updated = svc.update(user);
		Map<String,Boolean> map = new HashMap<>();
		map.put("updated", updated);
		return map;
	}
	
	
	@PostMapping("/delete")
	@ResponseBody
	public Map<String,Boolean> deleted(User user) {
		boolean deleted = svc.deleted(user);
		Map<String,Boolean> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}
	
	
	
	
	
	
}
