package com.tjoeun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tjoeun.svc.GuguService;

@Controller
@RequestMapping("/gugu") // http://localhost/gugu
public class GuguController {
	
	@Autowired  //spring이 알아서 객체 만들어줌.
	private GuguService svc; // null로 자동 초기화.
	
	@GetMapping("")
	public String getGugu(Model m) {
		
		String gStr = svc.getGugu();
		m.addAttribute("gugu",gStr);   // key,value setAttribute 와 같은 기능
		return "gugu"; //.jsp
	}
	
	@GetMapping("/{dan}")   //  /gugu/5  http://localhost/gugu/2
	public ModelAndView getGugu2(@PathVariable("dan") int dan) {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("gugu",svc.getGugu(dan));  // data와 view 정보를 같이 같는 객체
		mv.setViewName("gugu");
		
		return mv;
	}
}
