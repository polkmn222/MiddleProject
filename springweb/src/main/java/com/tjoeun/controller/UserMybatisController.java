package com.tjoeun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.github.pagehelper.PageInfo;
import com.tjoeun.dao.UserMybatisDAO;
import com.tjoeun.vo.User;

//@RestController
@RequestMapping("/mb")
@Controller
@SessionAttributes("uid")
public class UserMybatisController { //http://localhost/mb/list
	
	@Autowired
	private UserMybatisDAO dao;
	
//	@GetMapping("/user") // /mb/user?uid=smith
//	public String getUser(@RequestParam String uid) { //http://localhost/mb/user?uid=smith
//		
//		User user = dao.selectById(uid);
//		return user.toString();
//		
//	}
	
	@GetMapping("/login") // get 이면 여기 post 면 밑
	public String form() {
		
		return "user/loginForm";
	}
	
	@PostMapping("/login")
	@ResponseBody
	public Map<String, Boolean> login(User user, Model m) {
		boolean ok = dao.login(user);
		if(ok) {
			m.addAttribute("uid", user.getUid());
		}
		Map<String, Boolean> map = new HashMap<>();		
		map.put("ok", ok);
		return map;
	}
	
	@GetMapping("/logout") // http://localhost/jdbc/logout
	public String logout(SessionStatus status) {
		
		status.setComplete();
		return "redirect:/mb/login";  // spring (x) response.sendRedirect("/user/login");
	}
	
	
//	@GetMapping("/list") //http://localhost/mb/list
//	public String list(@SessionAttribute(name="uid", required=false) String uid, Model model) {
//		if(uid==null) {
//			return "redirect:/mb/login";  // 로그인 폼으로...
//		} else {
//			List<User> list = dao.getUserList();
//			model.addAttribute("list", list);
//			return "user/userList";
//		}
//	}
	
	@GetMapping("/list") //http://localhost/mb/list
	public String list2(@SessionAttribute(name="uid", required=false) String uid, Model model) {
		if(uid==null) {
			return "redirect:/mb/login";  // 로그인 폼으로...
		} else {
			List<Map<String, String>> list = dao.getUserMap();
			model.addAttribute("list", list);
			return "user/userList";
		}
	}
	
	@GetMapping("/page/{pageNum}") //http://localhost/mb/page/1
//	@ResponseBody
	public String getPage(@PathVariable int pageNum, Model model) {
		PageInfo<User> pageInfo = dao.getListPage(pageNum);
		pageInfo.getNavigatepageNums();
		model.addAttribute("pageInfo", pageInfo);
//		List<User> list = pageInfo.getList();
//		return list.toString();
		return "user/userPage";
	}
	
	
	@GetMapping("/add") 
	public String addUser() { 
		
		return "user/addForm";
		
	}
	
	@PostMapping("/add")
	@ResponseBody
	public Map<String, Boolean> addUser(User user) {
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("add", dao.insert(user)>0 ? true : false);
		return map;
	}
	
	@GetMapping("/detail") // http://localhost/jdbc/detail
	public String detail(@RequestParam String userid, Model model) { // 일치시켜주면 자동으로 들어감
		User user = dao.getUserById(userid);
		model.addAttribute("user", user);
		
		return "user/detail";
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam String userid, Model model) {
		User user = dao.getUserById(userid);
		model.addAttribute("user", user);
		return "user/editUser";
	}
	
//	@PostMapping("/update")
//	@ResponseBody
//	public Map<String,Boolean> update(User user) {
//		
//		Map<String,Boolean> map = new HashMap<>();
//		map.put("updated", dao.update(user)>0 ? true : false);
//		return map;
//	}
	
	@PostMapping("/update")
	@ResponseBody
	public Map<String,Boolean> update2(User user) {
//		uid를 키워드로 하여 phone을 갱신한다
		Map<String, String> pMap = new HashMap<>();
		pMap.put("uid", user.getUid());
		pMap.put("phone", user.getPhone());
		boolean updated = dao.updateByMap(pMap);
		
//		Map<String, Object> testMap = new HashMap<>();
//		testMap.put("1", 5);
//		testMap.put("2", true);
//		testMap.put("3", 3.14);
//		testMap.put("4", "Smith");
//		testMap.put("5", user);
//		//------------------------
//		Object obj = testMap.get("2");
//		boolean bool = (Boolean)obj;
		
		Map<String,Boolean> map = new HashMap<>();
		map.put("updated", updated);
		return map;

	}
	
	@PostMapping("/delete")
	@ResponseBody
	public Map<String,Boolean> deleted(User user) {
		Map<String,Boolean> map = new HashMap<>();
		map.put("deleted", dao.delete(user)>0 ? true : false);
		return map;
	}
	
	@PostMapping("/idcheck")
	@ResponseBody
	public Map<String,Boolean> idcheck(User user) {
		
		Map<String,Boolean> map = new HashMap<>();
		map.put("check", dao.idcheck(user));

		return map;
	}
	
	

}
