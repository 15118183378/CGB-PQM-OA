package com.dy.oa.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dy.oa.pojo.Request;
import com.dy.oa.pojo.RequestType;
import com.dy.oa.pojo.Staff;
import com.dy.oa.pojo.User;
import com.dy.oa.service.RequestService;
import com.dy.oa.service.UserService;
import com.dy.oa.util.DealContent;
import com.dy.oa.util.FileOperateUtil;
import com.dy.oa.util.MySort;

@Controller
@RequestMapping("/request")
public class RequestController {

	@Autowired
	private RequestService requestService;
	@Autowired
	private UserService userService;

	@RequestMapping("/waitRequest")
	public String waitRequest(HttpServletRequest req, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Request> requests = requestService.selectWaitRequestByTarget(user.getId());
		requests = MySort.sortRequest(requests);
		req.setAttribute("requests", requests);
		req.setAttribute("type", "waitRequest");
		return "/request/receiveRequest";
	}
	
	@RequestMapping("/toSendRequest")
	public ModelAndView toSendRequest(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/request/sendRequest");
		User user = (User)session.getAttribute("user");
		List<User> dealPeoples = userService.getUserByOrganizeId(user.getOrganize().getId());
		System.out.println(dealPeoples.size());
		for(User u : dealPeoples) {
			if(u.getId() == user.getId()) {
				dealPeoples.remove(u);
				break;
			}
		}
		modelAndView.addObject("dealPeoples", dealPeoples);
		return modelAndView;
	}

	@RequestMapping("/sendRequest")
	public ModelAndView sendRequest(@RequestParam(value = "file", required = false) MultipartFile file,HttpServletRequest req, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/request/sendRequest");
		int requestType = Integer.parseInt(req.getParameter("requestType"));
		String remark = req.getParameter("remark");
		String content = "";
		String filePath = null;
		if (requestType == 1) {
			String startTime = req.getParameter("startTime");
			String endTime = req.getParameter("endTime");
			String leaveReason = req.getParameter("leaveReason");
			content = "审批类型：请假<br/>起始时间：" + startTime + "<br/>结束时间：" + endTime + "<br/>请假事由："
					+ leaveReason + "<br/>备注：" + remark;
		}
		if (requestType == 2) {
			String money = req.getParameter("money");
			String reimburseType = req.getParameter("reimburseType");
			String detail = req.getParameter("detail");
			try {
				Integer.valueOf(money);
			} catch (Exception e) {
				modelAndView.addObject("msg", "请输入正确的报销金额");
				return modelAndView;
			}
			content = "审批类型：报销<br/>报销金额：" + money + "<br/>报销类别：" + reimburseType + "<br/>费用明细：" + detail
					+ "<br/>备注：" + remark;
		}
		if (requestType == 3) {
			String address = req.getParameter("address");
			String tripStartTime = req.getParameter("tripStartTime");
			String tripEndTime = req.getParameter("tripEndTime");
			String tripReason = req.getParameter("tripReason");
			content = "日志类型：出差<br/>出差地点：" + address + "<br/>起始时间：" + tripStartTime + "<br/>结束时间："
					+ tripEndTime + "<br/>出差事由:" + tripReason + "<br/>备注：" + remark;
		}
		Request request = new Request();
		request.setContent(content);
		User dealPeople = new User();
		dealPeople.setId(Integer.valueOf(req.getParameter("receive")));
		request.setDealPeople(dealPeople);
		request.setDealStatus("未处理");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		request.setRequestTime(sdf.format(new Date()));
		RequestType reqType = new RequestType();
		reqType.setId(requestType);
		request.setRequestType(reqType);
		Staff staff = (Staff) session.getAttribute("staff");
		request.setStaff(staff);
		if(file != null) {
			FileOperateUtil.init(req);
			try {
				filePath = FileOperateUtil.upload(req);
			} catch (Exception e) {
				modelAndView.addObject("msg", "审批发送失败");
				return modelAndView;
			}
		}
		request.setFile(filePath);
		int count = requestService.insert(request);
		List<User> dealPeoples = userService.getUserByOrganizeId(staff.getOrganize().getId());
		System.out.println(dealPeoples.size());
		for(User u : dealPeoples) {
			if(u.getId() == staff.getUser().getId()) {
				dealPeoples.remove(u);
				break;
			}
		}
		modelAndView.addObject("dealPeoples", dealPeoples);
		if (count == 1) {
			modelAndView.addObject("msg", "发送审批成功");
		} else {
			modelAndView.addObject("msg", "发送审批失败");
		}
		return modelAndView;
	}
	
	@RequestMapping("/selectByRequestId/{requestId}")
	public ModelAndView selectByRequestId(@PathVariable(value = "requestId") Integer requestId,HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/request/request");
		Request request = requestService.selectByPrimaryKey(requestId);
		modelAndView.addObject("request", request);
		String type = req.getParameter("type");
		System.err.println("type:" + type);
		modelAndView.addObject("type", type);
		System.err.println(1);
		if(request.getFile() != null && request.getFile() != "") {
			FileOperateUtil.init(req);
			System.err.println(2);
			modelAndView.addObject("map",FileOperateUtil.getFile(request.getFile()));
		}
		List<String> requestContent = new ArrayList<>();
		if(request.getRequestType().getName().equals("请假")) {
			requestContent = DealContent.dealRequestQJContent(request.getContent());
		} else if(request.getRequestType().getName().equals("报销")) {
			requestContent = DealContent.dealRequestBXContent(request.getContent());
		} else if(request.getRequestType().getName().equals("出差")) {
			requestContent = DealContent.dealRequestCCContent(request.getContent());
		}
		modelAndView.addObject("requestContent", requestContent);
		return modelAndView;
	}
	
	@RequestMapping("/dealedRequest")
	public ModelAndView dealedRequest(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/request/receiveRequest");
		User user = (User)session.getAttribute("user");
		List<Request> requests = requestService.selectDealedRequest(user.getId());
		requests = MySort.sortRequest(requests);
		System.out.println(requests);
		modelAndView.addObject("requests", requests);
		modelAndView.addObject("type", "dealed");
		return modelAndView;
	}
	
	@RequestMapping("/toMyRequest")
	public ModelAndView toMyRequest(HttpSession session) {
		System.err.println("进入我发出的审批------");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/request/myRequest");
		Staff staff = (Staff)session.getAttribute("staff");
		System.out.println("staffId:" + staff.getId());
		List<Request> requests = requestService.selectByStaffId(staff.getId());
		requests = MySort.sortRequest(requests);
		modelAndView.addObject("requests", requests);
		modelAndView.addObject("type", "myRequest");
		return modelAndView;
	}
	
	@RequestMapping("/changeRequestStatus/{requestId}")
	public ModelAndView changeRequestStatus(@PathVariable(value = "requestId") Integer requestId,HttpServletRequest req,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/request/receiveRequest");
		Request request = requestService.selectByPrimaryKey(requestId);
		String result = req.getParameter("result");
		System.err.println("result:" + result);
		modelAndView.addObject("result", result);
		int count = -1;
		if("1".equals(result)) {
			request.setDealStatus("已同意");
		} else {
			request.setDealStatus("已拒绝");
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		request.setDealTime(sdf.format(new Date()));
		count = requestService.updateByPrimaryKey(request);
		if(count != -1) {
			modelAndView.addObject("msg", "审批成功");
		} else {
			modelAndView.addObject("msg", "审批失败");
		}
		User user = (User) session.getAttribute("user");
		List<Request> requests = requestService.selectWaitRequestByTarget(user.getId());
		req.setAttribute("requests", requests);
		req.setAttribute("type", "waitRequest");
		return modelAndView;
	}
	
	@RequestMapping("/getMyRequest/{requestTypeId}")
	public ModelAndView getMyRequest(HttpSession session, @PathVariable(value = "requestTypeId") Integer requestTypeId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/request/myRequest");
		Staff staff = (Staff)session.getAttribute("staff");
		System.out.println("staffId:" + staff.getId());
		List<Request> request = requestService.selectByStaffId(staff.getId());
		List<Request> requests = new ArrayList<>();
		if (requestTypeId != 0) {
			for (Request r : request) {
				if (r.getRequestType().getId() == requestTypeId) {
					requests.add(r);
				}
			}
		} else {
			requests = request;
		}
		requests = MySort.sortRequest(requests);
		modelAndView.addObject("requests", requests);
		modelAndView.addObject("type", "myRequest");
		modelAndView.addObject("requestTypeId", requestTypeId);
		return modelAndView;
	}
	
	@RequestMapping("/getDealedRequest/{requestTypeId}")
	public ModelAndView getDealedRequest(HttpSession session, @PathVariable(value = "requestTypeId") Integer requestTypeId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/request/receiveRequest");
		User user = (User)session.getAttribute("user");
		List<Request> request = requestService.selectDealedRequest(user.getId());
		List<Request> requests = new ArrayList<>();
		if (requestTypeId != 0) {
			for (Request r : request) {
				if (r.getRequestType().getId() == requestTypeId) {
					requests.add(r);
				}
			}
		} else {
			requests = request;
		}
		requests = MySort.sortRequest(requests);
		System.out.println(requests);
		modelAndView.addObject("requests", requests);
		modelAndView.addObject("type", "dealed");
		return modelAndView;
	}
	
	@RequestMapping("/getWaitRequest/{requestTypeId}")
	public ModelAndView getWaitRequest(HttpSession session, @PathVariable(value = "requestTypeId") Integer requestTypeId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/request/receiveRequest");
		User user = (User) session.getAttribute("user");
		List<Request> request = requestService.selectWaitRequestByTarget(user.getId());
		List<Request> requests = new ArrayList<>();
		if (requestTypeId != 0) {
			for (Request r : request) {
				if (r.getRequestType().getId() == requestTypeId) {
					requests.add(r);
				}
			}
		} else {
			requests = request;
		}
		requests = MySort.sortRequest(requests);
		modelAndView.addObject("requests", requests);
		modelAndView.addObject("type", "waitRequest");
		return modelAndView;
	}

}
