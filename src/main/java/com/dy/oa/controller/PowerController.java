package com.dy.oa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dy.oa.pojo.Power;
import com.dy.oa.pojo.Staff;
import com.dy.oa.service.PowerService;
import com.dy.oa.service.StaffService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/power")
public class PowerController {

	@Autowired
	private PowerService powerService;
	@Autowired
	private StaffService staffService;

	@RequestMapping("/powerManager")
	public ModelAndView powerManager(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/sys/powerManager");
		Staff staff = (Staff) session.getAttribute("staff");
		List<Staff> staffs = staffService.selectStaffOnJob(staff.getOrganize().getId());
		System.err.println("staffs:" + staffs);
		modelAndView.addObject("staffs", staffs);
		return modelAndView;
	}

	@RequestMapping("/updatePower/{staffId}")
	public ModelAndView updatePower(@PathVariable(value = "staffId") Integer staffId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/sys/updatePower");
		Staff staff = staffService.selectByPrimaryKey(staffId);
		List<Power> powers = powerService.selectAll();
		modelAndView.addObject("staff", staff);
		modelAndView.addObject("powers", powers);
		return modelAndView;
	}

	@RequestMapping("/updateStaffPower")
	public ModelAndView updatePower(Staff staff, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/sys/powerManager");
		int count = staffService.updateByPrimaryKey(staff);
		Staff s = (Staff) session.getAttribute("staff");
		List<Staff> staffs = staffService.selectStaffOnJob(s.getOrganize().getId());
		System.err.println("staffs:" + staffs);
		modelAndView.addObject("staffs", staffs);
		if (count == 1) {
			modelAndView.addObject("msg", "修改员工权限成功");
		} else {
			modelAndView.addObject("msg", "修改员工权限失败");
		}
		return modelAndView;
	}

	@RequestMapping("/getStaffPower")
	@ResponseBody
	public String getStaffPower(HttpSession session) {
		System.err.println("进入获取员工权限等级---------");
		JSONObject json = new JSONObject();
		Staff staff = (Staff) session.getAttribute("staff");
		if (staff != null) {
			json.put("powerId", staff.getPower().getId());
		}
		return json.toString();
	}

}
