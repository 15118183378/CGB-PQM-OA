package com.dy.oa.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dy.oa.pojo.Chat;
import com.dy.oa.pojo.Organize;
import com.dy.oa.pojo.OrganizePosition;
import com.dy.oa.pojo.Power;
import com.dy.oa.pojo.Staff;
import com.dy.oa.pojo.User;
import com.dy.oa.service.ChatService;
import com.dy.oa.service.OrganizePositionService;
import com.dy.oa.service.OrganizeService;
import com.dy.oa.service.StaffService;
import com.dy.oa.service.UserService;

@Controller
@RequestMapping("/organize")
public class OrganizeController {
	
	@Autowired
	private OrganizeService organizeService;
	@Autowired
	private OrganizePositionService organizePositionService;
	@Autowired
	private UserService userService;
	@Autowired
	private StaffService staffService;
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/toCreateOrganize")
	public ModelAndView toCreateOrganize() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/main/createOrganize");
		return modelAndView;
	}
	
	@RequestMapping("/toOrganizeChat")
	public ModelAndView toOrganizeChat(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		User user = (User)session.getAttribute("user");
		List<User> users = userService.getUserByOrganizeId(user.getOrganize().getId());
		List<Chat> chats = chatService.selectByOrganizeId(user.getOrganize().getId());
		for(Chat c : chats) {
			if(c.getUser().getId() == user.getId()) {
				c.setIsMine("true");
			}
		}
		chats.sort(new Comparator<Chat>() {
			@Override
			public int compare(Chat o1, Chat o2) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date d1 = new Date();
				Date d2 = new Date();
				try {
					d1 = format.parse(o1.getCreateTime());
					d2 = format.parse(o2.getCreateTime());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				if(d1.before(d2)) {
					return -1;
				}
				return 1;
			}
		});
		modelAndView.addObject("chats", chats);
		modelAndView.addObject("users", users);
		modelAndView.setViewName("/websocket/chat");
		return modelAndView;
	}

	@RequestMapping("/addOrganize")
	public String addOrganize(HttpServletRequest req,HttpSession session) {
		String name = req.getParameter("name");
		Organize isExist = organizeService.selectByName(name);
		if(isExist != null) {
			return "redirect:/jsp/main/createOrganize.jsp?msg='该公司已注册'";
		}
		String code = req.getParameter("code");
		String description = req.getParameter("description");
		String province = req.getParameter("province");
		String city = req.getParameter("city");
		String area = req.getParameter("area");
		String position = req.getParameter("position");
		String longitude = req.getParameter("longitude");
		String latitude = req.getParameter("latitude");
		Organize organize = new Organize();
		organize.setName(name);
		organize.setCode(code);
		organize.setDescription(description);
		int count1 = organizeService.insert(organize);
		if(count1 == 1) {
			Organize org = organizeService.selectByName(organize.getName());
			OrganizePosition organizePosition = new OrganizePosition();
			organizePosition.setProvince(province);
			organizePosition.setCity(city);
			organizePosition.setArea(area);
			organizePosition.setPosition(position);
			organizePosition.setLongitude(Double.valueOf(longitude));
			organizePosition.setLatitude(Double.valueOf(latitude));
			organizePosition.setOrganize(org);
			int count2 = organizePositionService.insert(organizePosition);
			if(count1 == 1 && count2 == 1) {
				User user = (User)session.getAttribute("user");
				user.setOrganize(org);
				userService.updateByPrimaryKey(user);
				Staff staff = new Staff();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				staff.setJoinTime(sdf.format(new Date()));
				Power power = new Power();
				power.setId(1);
				staff.setPower(power);
				staff.setUser(user);
				staffService.insert(staff);
				session.removeAttribute("user");
				session.setAttribute("user", user);
				return "redirect:/main.jsp?msg='添加公司成功，刷新页面后生效'";
			}
		}
		return "redirect:/main.jsp?msg='添加公司失败'";
	}

}
