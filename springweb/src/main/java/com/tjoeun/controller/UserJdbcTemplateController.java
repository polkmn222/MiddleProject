package com.tjoeun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.tjoeun.dao.UserJdbcTemplateDAO;
import com.tjoeun.vo.User;

//@RestController
@Controller
@RequestMapping("/jdbc")
@SessionAttributes("uid")
public class UserJdbcTemplateController { // http://localhost/jdbc/list
	@Autowired
	private UserJdbcTemplateDAO dao;
	
//	@GetMapping("/test")
//	public String test() {
//		return dao.getList().toString();
//	}
	@GetMapping("/login") // get 이면 여기 post 면 밑
	public String form() {
		
		return "user/loginForm";
	}
	
	@PostMapping("/login")
	@ResponseBody
	public Map<String, Boolean> login(User user, Model model) {
		Map<String, Boolean> map = new HashMap<>();
		boolean ok = dao.login(user);
		if(ok) {
			model.addAttribute("uid", user.getUid());  // 세션에 저장
		}
		map.put("ok", ok);
		return map;
	}
	
	@GetMapping("/logout") // http://localhost/jdbc/logout
	public String logout(SessionStatus status) {
		
		status.setComplete();
		return "redirect:/jdbc/login";  // spring (x) response.sendRedirect("/user/login");
	}
	
	
	@GetMapping("/list") // 세션에 user가 저장되어 있지 않으면 오류가 발생하므로 required
	public String list(@SessionAttribute(name="uid", required=false) String uid, Model model) {
//		맨 처음엔 session 이 없으니 에러 방지
		if(uid==null) {
			return "redirect:/jdbc/login";  // 로그인 폼으로...
		} else {
			List<User> list = dao.getList();
			model.addAttribute("list", list);
			return "user/userList";
		}
		
	}
	
	@GetMapping("/add") 
	public String addUser() { 
		
		return "user/addForm";
		
	}
	
	@PostMapping("/add")
	@ResponseBody
	public Map<String, Boolean> addUser(User user) {
		boolean add = dao.addUser(user);
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("add", add);
		return map;
	}
	
	@GetMapping("/detail") // http://localhost/jdbc/detail
	public String detail(@RequestParam String userid, Model model) { // 일치시켜주면 자동으로 들어감
		User user = dao.detail(userid);
		model.addAttribute("user", user);
		
		return "user/detail";
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam String userid, Model model) {
		User user = dao.detail(userid);
		model.addAttribute("user", user);
		return "user/editUser";
	}
	
	@PostMapping("/update")
	@ResponseBody
	public Map<String,Boolean> update(User user) {
		boolean updated = dao.update(user);
		Map<String,Boolean> map = new HashMap<>();
		map.put("updated", updated);
		return map;
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public Map<String,Boolean> deleted(User user) {
		boolean deleted = dao.deleted(user);
		Map<String,Boolean> map = new HashMap<>();
		map.put("deleted", deleted);
		return map;
	}
	
	@PostMapping("/idcheck")
	@ResponseBody
	public Map<String,Boolean> idcheck(User user) {
		boolean check = dao.idcheck(user);
//		System.out.println(user.getUid());
		Map<String,Boolean> map = new HashMap<>();
		map.put("check", check);
//		System.out.println(check);
		return map;
	}
	
	
}
