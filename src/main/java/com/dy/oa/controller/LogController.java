package com.dy.oa.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dy.oa.pojo.Log;
import com.dy.oa.pojo.LogType;
import com.dy.oa.pojo.Staff;
import com.dy.oa.pojo.User;
import com.dy.oa.service.LogService;
import com.dy.oa.service.UserService;
import com.dy.oa.util.DealContent;
import com.dy.oa.util.FileOperateUtil;
import com.dy.oa.util.MySort;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/log")
public class LogController {

	@Autowired
	private LogService logService;
	@Autowired
	private UserService userService;

	@RequestMapping("/toSendLog")
	public ModelAndView toSendLog(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/log/sendLog");
		User user = (User) session.getAttribute("user");
		List<User> targets = userService.getUserByOrganizeId(user.getOrganize().getId());
		System.out.println(targets.size());
		for (User u : targets) {
			if (u.getId() == user.getId()) {
				targets.remove(u);
				break;
			}
		}
		modelAndView.addObject("targets", targets);
		return modelAndView;
	}

	@RequestMapping("/sendLog")
	private ModelAndView sendLog(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest req, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/log/sendLog");
		int logType = Integer.parseInt(req.getParameter("logType"));
		String require = req.getParameter("require");
		String remark = req.getParameter("remark");
		String content = "";
		String filePath = null;
		if (logType == 1) {
			String todayWork = req.getParameter("todayWork");
			String todaySummary = req.getParameter("todaySummary");
			String tomorrowWork = req.getParameter("tomorrowWork");
			content = "日志类型：日报<br/>今日完成工作：" + todayWork + "<br/>今日工作总结：" + todaySummary + "<br/>明日工作计划：" + tomorrowWork
					+ "<br/>需协调与帮助：" + require + "<br/>备注：" + remark;
		}
		if (logType == 2) {
			String thisWeekWork = req.getParameter("thisWeekWork");
			String thisWeekSummary = req.getParameter("thisWeekSummary");
			String nextWeekWork = req.getParameter("nextWeekWork");
			content = "日志类型：周报<br/>本周完成工作：" + thisWeekWork + "<br/>本周工作总结：" + thisWeekSummary + "<br/>下周工作计划："
					+ nextWeekWork + "<br/>需协调与帮助：" + require + "<br/>备注：" + remark;
		}
		if (logType == 3) {
			String thisMonthWork = req.getParameter("thisMonthWork");
			String thisMonthSummary = req.getParameter("thisMonthSummary");
			String nextMonthWork = req.getParameter("nextMonthWork");
			content = "日志类型：月报<br/>本月完成工作：" + thisMonthWork + "<br/>本月工作总结：" + thisMonthSummary + "<br/>下月工作计划："
					+ nextMonthWork + "<br/>需协调与帮助：" + require + "<br/>备注：" + remark;
		}
		Log log = new Log();
		log.setContent(content);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String s = sdf.format(new Date());
		log.setCreateTime(s);
		LogType lt = new LogType();
		lt.setId(logType);
		log.setLogType(lt);
		Staff staff = (Staff) session.getAttribute("staff");
		System.err.println(staff);
		log.setStaff(staff);
		User target = new User();
		target.setId(Integer.parseInt(req.getParameter("receive")));
		log.setTarget(target);
		System.out.println("file:" + file);
		if (file != null) {
			FileOperateUtil.init(req);
			try {
				filePath = FileOperateUtil.upload(req);
			} catch (Exception e) {
				modelAndView.addObject("msg", "日志发送失败");
				return modelAndView;
			}
		}
		log.setFile(filePath);
		int count = logService.insert(log);
		List<User> targets = userService.getUserByOrganizeId(staff.getOrganize().getId());
		System.out.println(targets.size());
		for (User u : targets) {
			if (u.getId() == staff.getUser().getId()) {
				targets.remove(u);
				break;
			}
		}
		modelAndView.addObject("targets", targets);
		if (count == 1) {
			modelAndView.addObject("msg", "日志发送成功");
		} else {
			modelAndView.addObject("msg", "日志发送失败");
		}
		return modelAndView;
	}

	@RequestMapping("/receiveLog")
	public String receiveLog(HttpServletRequest req, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Log> receiveLogs = logService.selectByTargetId(user.getId());
		receiveLogs = MySort.sortLog(receiveLogs);
		req.setAttribute("receiveLogs", receiveLogs);
		return "/log/receiveLog";
	}

	@RequestMapping("/selectByLogId/{logId}")
	public ModelAndView selectByLogId(@PathVariable(value = "logId") Integer logId, HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/log/log");
		String type = req.getParameter("type");
		if (type != null) {
			modelAndView.addObject("type", type);
		}
		Log log = logService.selectByPrimaryKey(logId);
		List<String> logContent = new ArrayList<>();
		if(log.getLogType().getName().equals("日报")) {
			logContent = DealContent.dealLogDayContent(log.getContent());
		} else if(log.getLogType().getName().equals("周报")) {
			logContent = DealContent.dealLogWeekContent(log.getContent());
		} else if(log.getLogType().getName().equals("月报")) {
			logContent = DealContent.dealLogMonthContent(log.getContent());
		}
		if (log.getFile() != null) {
			FileOperateUtil.init(req);
			modelAndView.addObject("map", FileOperateUtil.getFile(log.getFile()));
		}
//		String content[] = DealContent.dealContent(log.getContent());
		modelAndView.addObject("logContent",logContent);
		modelAndView.addObject("log", log);
		return modelAndView;
	}

	@RequestMapping("/toMyLog")
	public ModelAndView toMyLog(HttpSession session) {
		System.err.println("进入我发出的日志------");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/log/myLog");
		Staff staff = (Staff) session.getAttribute("staff");
		System.out.println("staffId:" + staff.getId());
		List<Log> logs = logService.selectByStaffId(staff.getId());
		logs = MySort.sortLog(logs);
		modelAndView.addObject("logs", logs);
		return modelAndView;
	}

	@RequestMapping("/fileDownload")
	public void download(HttpServletRequest request, HttpServletResponse response) {
		FileOperateUtil.init(request);
		try {
			String downloadfFileName = request.getParameter("filename");
			downloadfFileName = new String(downloadfFileName.getBytes("iso-8859-1"), "utf-8");
			String fileName = downloadfFileName.substring(downloadfFileName.indexOf("_") + 1);
			String userAgent = request.getHeader("User-Agent");
			byte[] bytes = userAgent.contains("MSIE") ? fileName.getBytes() : fileName.getBytes("UTF-8");
			fileName = new String(bytes, "ISO-8859-1");
			response.setHeader("Content-disposition", String.format("attachment; filename=\"%s\"", fileName));
			FileOperateUtil.download(downloadfFileName, response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/remarkLog")
	@ResponseBody
	public String remarkLog(Log log) {
		JSONObject json = new JSONObject();
		Log l = logService.selectByPrimaryKey(log.getId());
		l.setComment(log.getComment());
		l.setStatus(1);
		int count = logService.updateByPrimaryKey(l);
		if (count == 1) {
			json.put("result", "标记成功");
		} else {
			json.put("result", "标记失败");
		}
		return json.toString();
	}

	@RequestMapping("/getMyLog/{logTypeId}")
	public ModelAndView getMyLog(HttpSession session, @PathVariable(value = "logTypeId") Integer logTypeId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/log/myLog");
		Staff staff = (Staff) session.getAttribute("staff");
		System.out.println("staffId:" + staff.getId());
		List<Log> log = logService.selectByStaffId(staff.getId());
		List<Log> logs = new ArrayList<>();
		if (logTypeId != 0) {
			for (Log l : log) {
				if (l.getLogType().getId() == logTypeId) {
					logs.add(l);
				}
			}
		} else {
			logs = log;
		}
		logs = MySort.sortLog(logs);
		modelAndView.addObject("logs", logs);
		modelAndView.addObject("logTypeId", logTypeId);
		return modelAndView;
	}
	
	@RequestMapping("/getReceiveLog/{logTypeId}")
	public ModelAndView getReceiveLog(HttpServletRequest req, HttpSession session,@PathVariable(value = "logTypeId") Integer logTypeId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/log/receiveLog");
		User user = (User) session.getAttribute("user");
		List<Log> receiveLog = logService.selectByTargetId(user.getId());
		List<Log> receiveLogs = new ArrayList<>();
		if (logTypeId != 0) {
			for (Log l : receiveLog) {
				if (l.getLogType().getId() == logTypeId) {
					receiveLogs.add(l);
				}
			}
		} else {
			receiveLogs = receiveLog;
		}
		receiveLogs = MySort.sortLog(receiveLogs);
		modelAndView.addObject("receiveLogs", receiveLogs);
		modelAndView.addObject("logTypeId", logTypeId);
		return modelAndView;
	}
}
