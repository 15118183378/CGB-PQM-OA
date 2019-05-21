package com.dy.oa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dy.oa.pojo.Invite;
import com.dy.oa.pojo.Organize;
import com.dy.oa.pojo.User;
import com.dy.oa.service.InviteService;
import com.dy.oa.service.StaffService;
import com.dy.oa.service.UserService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/staff")
public class StaffController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private InviteService inviteService;
	
	@RequestMapping("/toInviteMember")
	public ModelAndView toInviteStaff(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/sys/inviteMember");
		return modelAndView;
	}
	
	@RequestMapping("/searchUser")
	public ModelAndView toInviteStaff(User user) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/sys/inviteMember");
		System.out.println(user.getUsername());
		List<User> users = userService.getUserLikeUserName(user.getUsername());
		modelAndView.addObject("users", users);
		if(users == null || users.size() == 0) {
			modelAndView.addObject("msg", "没有符合的搜索结果");
		}
		return modelAndView;
	}
	
	@RequestMapping("/inviteMember")
	@ResponseBody
	public String inviteMember(User user,HttpSession session) {
		JSONObject json = new JSONObject();
		User u = (User)session.getAttribute("user");
		Invite invite = new Invite();
		invite.setUser(user);
		invite.setOrganize(u.getOrganize());
		int count = inviteService.insert(invite);
		if(count == 1) {
			json.put("msg", "邀请成功");
		} else {
			json.put("msg", "邀请失败");
		}
		return json.toString();
	}

}
