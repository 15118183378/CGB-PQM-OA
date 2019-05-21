package com.dy.oa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dy.oa.service.LogTypeService;

@Controller
@RequestMapping("/logType")
public class LogTypeController {
	
	@Autowired
	private LogTypeService logTypeService;

}
