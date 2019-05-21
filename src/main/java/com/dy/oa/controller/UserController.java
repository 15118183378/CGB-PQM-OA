package com.dy.oa.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dy.oa.pojo.Announcement;
import com.dy.oa.pojo.Invite;
import com.dy.oa.pojo.Organize;
import com.dy.oa.pojo.Power;
import com.dy.oa.pojo.Staff;
import com.dy.oa.pojo.User;
import com.dy.oa.service.AnnouncementService;
import com.dy.oa.service.InviteService;
import com.dy.oa.service.OrganizeService;
import com.dy.oa.service.StaffService;
import com.dy.oa.service.UserService;
import com.dy.oa.util.Const;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private StaffService staffService;
	@Autowired
	private AnnouncementService announcementService;
	@Autowired
	private InviteService inviteService;
	@Autowired
	private OrganizeService organizeService;

	// 登录验证
	@RequestMapping("/login")
	@ResponseBody
	public Map<String, Object> login(User user, HttpSession session) {
		System.err.println("登陆验证--------");
		Map<String, Object> resultMap = new HashMap<>();
		User realUser = userService.getUserByUserName(user.getUsername());
		if (realUser != null) {
			if (user.getPassword().equals(realUser.getPassword())) {
				resultMap.put("result", "true");
				System.out.println("tel:" + realUser.getTel());
				session.setAttribute("user", realUser);
				if (realUser.getOrganize() != null) {
					Staff staff = staffService.selectByUser(realUser);
					session.setAttribute("staff", staff);
				}
			}
		} else {
			resultMap.put("result", "false");
		}
		return resultMap;
	}

	// 登录成功跳转至主页面
	@RequestMapping("/loginSuccess")
	public String loginSuccess() {
		return "redirect:/index.jsp";
	}

	// 登出
	@RequestMapping("/signOut")
	public String signOut(HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("announcement");
		return "redirect:/login.jsp";
	}

	// 首页
	@RequestMapping("/home")
	public ModelAndView home(HttpSession session) {
		System.err.println("进入首页--------");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/main/home");
		List<Announcement> announcement = announcementService.selectAll();
		User user = (User) session.getAttribute("user");
		List<Announcement> announcements = new ArrayList<>();
		for (Announcement a : announcement) {
			if (user.getOrganize() != null) {
				if (a.getOrganize().getId() == user.getOrganize().getId()) {
					announcements.add(a);
				}
			}
		}
		announcements.sort(new Comparator<Announcement>() {

			@Override
			public int compare(Announcement o1, Announcement o2) {
				String createTime1 = o1.getCreateTime();
				String createTime2 = o2.getCreateTime();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date d1 = null;
				Date d2 = null;
				try {
					d1 = sdf.parse(createTime1);
					d2 = sdf.parse(createTime2);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				if(d1.before(d2)) {
					return 1;
				} else {
					return -1;
				}
			}

		});
		session.setAttribute("announcements", announcements);
		List<Invite> invites = inviteService.selectByUserId(user.getId());
		if(invites != null && invites.size() != 0) {
			modelAndView.addObject("invites", invites);
		}
		return modelAndView;
	}

	// 用户注册
	@RequestMapping("/register")
	public void register(User user, HttpServletRequest request, HttpServletResponse response) {
		int count = userService.insert(user);
		if (count == 1) {
			request.setAttribute("msg", "注册成功");
		} else {
			request.setAttribute("msg", "注册失败");
		}
		try {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	// 获取公司员工通讯信息
	@RequestMapping("/getTel")
	public ModelAndView getTel(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/main/addressList");
		User user = (User) session.getAttribute("user");
		List<User> users = userService.getUserByOrganizeId(user.getOrganize().getId());
		modelAndView.addObject("users", users);
		return modelAndView;
	}
	
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/main/updateUser");
		User user = (User)session.getAttribute("user");
		modelAndView.addObject("user", user);
		System.err.println("tel:" + user.getTel());
		return modelAndView;
	}
	
	@RequestMapping("/updateUser")
	public ModelAndView toUpdate(HttpSession session,User user) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/main/updateUser");
		User u = (User)session.getAttribute("user");
		System.out.println("tel:" + u.getTel());
		if(user.getName() != null && !"".equals(user.getName().trim())) {
			u.setName(user.getName());
		} else {
			modelAndView.addObject("msg", "名称不能为空");
		}
		if(user.getPassword() != null && !"".equals(user.getPassword().trim())) {
			u.setPassword(user.getPassword());
		} else {
			modelAndView.addObject("msg", "密码不能为空");
		}
		if(user.getTel() != null && !"".equals(user.getTel().trim())) {
			System.out.println("tel:" + user.getTel());
			u.setTel(user.getTel());
		} else {
			modelAndView.addObject("msg", "联系电话不能为空");
		}
		int count = userService.updateByPrimaryKey(u);
		if(count == 1) {
			session.setAttribute("user", u);
			modelAndView.addObject("msg", "更新个人信息成功");
		} else {
			modelAndView.addObject("msg", "更新个人信息失败");
		}
		return modelAndView;
	}
	
	@RequestMapping("/acceptOrg/{organizeId}")
	@ResponseBody
	public ModelAndView acceptOrg(@PathVariable(value = "organizeId") Integer organizeId,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/main/home");
		User user = (User)session.getAttribute("user");
		Organize organize = organizeService.selectByPrimaryKey(organizeId);
		user.setOrganize(organize);
		session.setAttribute("user", user);
		List<Announcement> announcement = announcementService.selectAll();
		List<Announcement> announcements = new ArrayList<>();
		for (Announcement a : announcement) {
			if (user.getOrganize() != null) {
				if (a.getOrganize().getId() == user.getOrganize().getId()) {
					announcements.add(a);
				}
			}
		}
		announcements.sort(new Comparator<Announcement>() {
			@Override
			public int compare(Announcement o1, Announcement o2) {
				String createTime1 = o1.getCreateTime();
				String createTime2 = o2.getCreateTime();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date d1 = null;
				Date d2 = null;
				try {
					d1 = sdf.parse(createTime1);
					d2 = sdf.parse(createTime2);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				if(d1.before(d2)) {
					return 1;
				} else {
					return -1;
				}
			}
		});
		session.setAttribute("announcements", announcements);
		Staff staff = new Staff();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		staff.setJoinTime(sdf.format(new Date()));
		Power power = new Power();
		power.setId(2);
		staff.setPower(power);
		staff.setUser(user);
		staff.setOrganize(organize);
		staffService.insert(staff);
		Staff sta = staffService.selectByUser(user);
		session.setAttribute("staff", sta);
		userService.updateByPrimaryKey(user);
		int count = inviteService.deleteByUserId(user.getId());
		if(count > 0) {
			modelAndView.addObject("msg", "接受邀请成功");
		} else {
			modelAndView.addObject("msg", "接受邀请失败");
		}
		return modelAndView;
	}
	
}
