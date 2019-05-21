package com.dy.oa.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dy.oa.pojo.Announcement;
import com.dy.oa.pojo.User;
import com.dy.oa.service.AnnouncementService;

@Controller
@RequestMapping("/announcement")
public class AnnouncementController {
	
	@Autowired
	private AnnouncementService announcementService;
	
	@RequestMapping("/toAddAnnouncement")
	public ModelAndView toAddAnnouncement() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/sys/addAnnouncement");
		return modelAndView;
	}
	
	@RequestMapping("/addAnnouncement")
	public ModelAndView addAnnouncement(Announcement announcemnet,HttpSession session) {
		System.err.println("进入新增公告-----");
		ModelAndView modelAndView = new ModelAndView();
		User user = (User)session.getAttribute("user");
		announcemnet.setIssuer(user.getName());
		announcemnet.setOrganize(user.getOrganize());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		announcemnet.setCreateTime(sdf.format(new Date()));
		int count = announcementService.insert(announcemnet);
		if(count != 1) {
			modelAndView.addObject("msg", "发布失败");
		} else {
			modelAndView.addObject("msg", "发布成功");
		}
		modelAndView.setViewName("/sys/addAnnouncement");
		return modelAndView;
	}
	
	@RequestMapping("/lookAnnouncement/{announcementId}")
	public ModelAndView sensorModInit(@PathVariable(value = "announcementId") Integer announcementId) {
		System.err.println("----- 查看公告 ------");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/sys/lookAnnouncement");
		Announcement announcement = announcementService.selectByPrimaryKey(announcementId);
		modelAndView.addObject("announcement", announcement);
		return modelAndView;
	}

}
