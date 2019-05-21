package com.dy.oa.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dy.oa.pojo.Chat;
import com.dy.oa.pojo.User;
import com.dy.oa.service.ChatService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/sendMessage/{message}")
	@ResponseBody
	public String sendMessage(@PathVariable(value="message") String message,HttpSession session) {
		JSONObject json = new JSONObject();
		Chat chat = new Chat();
		chat.setContent(message);
		User user = (User)session.getAttribute("user");
		chat.setOrganize(user.getOrganize());
		chat.setUser(user);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		chat.setCreateTime(sdf.format(new Date()));
		int count = chatService.insert(chat);
		if(count == 1) {
			json.put("result", "send_success");
		} else {
			json.put("result", "send_fail");
		}
		return json.toString();
	}

}
