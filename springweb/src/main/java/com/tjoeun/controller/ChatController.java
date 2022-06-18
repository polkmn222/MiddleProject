package com.tjoeun.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController { //http://localhost/chat
	
    @GetMapping("/chat")
    public String chat(HttpSession session) {
    	
    	session.setAttribute("uid", "smith");
        return "ws/chat";
    }
}