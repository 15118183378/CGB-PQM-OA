package com.dy.oa.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dy.oa.pojo.MyDate;
import com.dy.oa.pojo.OrganizePosition;
import com.dy.oa.pojo.Sign;
import com.dy.oa.pojo.Staff;
import com.dy.oa.pojo.User;
import com.dy.oa.service.OrganizePositionService;
import com.dy.oa.service.SignService;
import com.dy.oa.service.StaffService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/sign")
public class SignController {
	
	@Autowired
	private SignService signService;
	@Autowired
	private StaffService staffService;
	@Autowired
	private OrganizePositionService organizePositionService;
	
	@RequestMapping("/getSignMsg")
	@ResponseBody
	public String getSignMsg(HttpSession session,MyDate mydate) {
		System.err.println("进入获取打卡信息---------");
		JSONObject json = new JSONObject();
		Staff staff = (Staff)session.getAttribute("staff");
		String year = mydate.getYear();
		String month = mydate.getMonth();
		String day = mydate.getDay();
		if(month.length() == 1) {
			month = "0" + month;
		}
		if(day.length() == 1) {
			day = "0" + day;
		}
		String date = year + "-" + month + "-" + day;
		Map<String,Object> map = new HashMap<>();
		map.put("staffId", staff.getId());
		map.put("date", date);
		Sign sign = signService.selectByStaffAndDate(map);
		if(sign != null) 
		System.err.println("signOut:" + sign.getSignOut());
		json.put("sign", sign);
		return json.toString();
	}
	
	@RequestMapping("/signIn")
	@ResponseBody
	public String signIn(HttpSession session,OrganizePosition organizePosition) {
		System.err.println("进入上班打卡---------");
		JSONObject json = new JSONObject();
		Staff staff = (Staff)session.getAttribute("staff");
		
		OrganizePosition op = organizePositionService.selectByOrganizeId(staff.getOrganize().getId());
		System.err.println("organizePosition:" + op.getLatitude() + "," + op.getLongitude());
		System.err.println("nowPosition:" + organizePosition.getLatitude() + "," + organizePosition.getLongitude());
		if(Math.abs(op.getLatitude() - organizePosition.getLatitude()) > 0.01 || Math.abs(op.getLongitude() - organizePosition.getLongitude()) > 0.01) {
			json.put("msg", "当前位置与公司位置不符，打卡失败");
			return json.toString();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		System.out.println("date:" + date);
		Map<String,Object> map = new HashMap<>();
		map.put("staffId", staff.getId());
		map.put("date", date);
		Sign sign = signService.selectByStaffAndDate(map);
		if(sign != null) {
			json.put("msg", "请勿重复打卡");
			return json.toString();
		}
		Sign newSign = new Sign();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = simpleDateFormat.format(new Date());
		newSign.setSignIn(now);
		newSign.setDate(date);
		newSign.setStaff(staff);
		int count = signService.insert(newSign);
		if(count == 1) {
			json.put("msg", "打卡成功");
		} else {
			json.put("msg", "打卡失败");
		}
		return json.toString();
	}
	
	@RequestMapping("/signOut")
	@ResponseBody
	public String signOut(HttpSession session,OrganizePosition organizePosition) {
		System.err.println("进入下班打卡---------");
		JSONObject json = new JSONObject();
		Staff staff = (Staff)session.getAttribute("staff");
		
		OrganizePosition op = organizePositionService.selectByOrganizeId(staff.getOrganize().getId());
		System.err.println("organizePosition:" + op.getLatitude() + "," + op.getLongitude());
		System.err.println("nowPosition:" + organizePosition.getLatitude() + "," + organizePosition.getLongitude());
		if(Math.abs(op.getLatitude() - organizePosition.getLatitude()) > 0.01 || Math.abs(op.getLongitude() - organizePosition.getLongitude()) > 0.01) {
			json.put("msg", "当前位置与公司位置不符，打卡失败");
			return json.toString();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		System.out.println("date:" + date);
		Map<String,Object> map = new HashMap<>();
		map.put("staffId", staff.getId());
		map.put("date", date);
		Sign sign = signService.selectByStaffAndDate(map);
		if(sign == null) {
			json.put("msg", "请先上班打卡");
			return json.toString();
		}
		if(sign.getSignOut() != null) {
			json.put("msg", "请勿重复打卡");
			return json.toString();
		}
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = simpleDateFormat.format(new Date());
		sign.setSignOut(now);
		int count = signService.updateByPrimaryKey(sign);
		if(count == 1) {
			json.put("msg", "打卡成功");
		} else {
			json.put("msg", "打卡失败");
		}
		return json.toString();
	}
	
	@RequestMapping("/toSignList")
	public ModelAndView toSignList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/work/signList");
		User user = (User)session.getAttribute("user");
		List<Staff> stas = staffService.selectStaffOnJob(user.getOrganize().getId());
		modelAndView.addObject("stas", stas);
		return modelAndView;
	}
	
	@RequestMapping("/lookStaffSign/{staffId}")
	@ResponseBody
	public ModelAndView lookStaffSign(@PathVariable(value="staffId") Integer staffId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/work/lookStaffSign");
		Staff staff = staffService.selectByPrimaryKey(staffId);
		modelAndView.addObject("staff", staff);
		return modelAndView;
	}
	
	@RequestMapping("/getStaffSignMsg")
	@ResponseBody
	public String getStaffSignMsg(HttpSession session,MyDate mydate,HttpServletRequest req) {
		System.err.println("进入获取员工打卡信息---------");
		JSONObject json = new JSONObject();
		Staff staff = staffService.selectByPrimaryKey(Integer.valueOf(req.getParameter("staffId")));
		String year = mydate.getYear();
		String month = mydate.getMonth();
		String day = mydate.getDay();
		if(month.length() == 1) {
			month = "0" + month;
		}
		if(day.length() == 1) {
			day = "0" + day;
		}
		String date = year + "-" + month + "-" + day;
		Map<String,Object> map = new HashMap<>();
		map.put("staffId", staff.getId());
		map.put("date", date);
		Sign sign = signService.selectByStaffAndDate(map);
		if(sign != null) 
		System.err.println("signOut:" + sign.getSignOut());
		json.put("sign", sign);
		return json.toString();
	}

}
