package com.dy.oa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dy.oa.pojo.Invite;
import com.dy.oa.pojo.User;
import com.dy.oa.service.InviteService;

@Controller
@RequestMapping("/job")
public class JobController {
	
	@Autowired
	private InviteService jobService;
	
	@RequestMapping("/addJob")
	public ModelAndView addJob(Invite job,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/sys/addJob");
		User user = (User)session.getAttribute("user");
		job.setOrganize(user.getOrganize());
		int count = jobService.insert(job);
		if (count == 1) {
			modelAndView.addObject("msg", "新增岗位成功");
		} else {
			modelAndView.addObject("msg", "新增岗位失败");
		}
		return modelAndView;
	}

}
