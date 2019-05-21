package com.dy.oa.util;

import java.util.ArrayList;
import java.util.List;

public class DealContent {
	
	public static List<String> dealLogDayContent(String content) {
		List<String> dayContent = new ArrayList<>();
		Integer index2 = content.indexOf("<br/>今日完成工作：");
		Integer index3 = content.indexOf("<br/>今日工作总结：");
		Integer index4 = content.indexOf("<br/>明日工作计划：");
		Integer index5 = content.indexOf("<br/>需协调与帮助：");
		Integer index6 = content.indexOf("<br/>备注：");
		dayContent.add(content.substring(5,index2));
		dayContent.add(content.substring(index2 + 12,index3));
		dayContent.add(content.substring(index3 + 12,index4));
		dayContent.add(content.substring(index4 + 12,index5));
		dayContent.add(content.substring(index5 + 12,index6));
		dayContent.add(content.substring(index6 + 8));
		return dayContent;
	}
	
	public static List<String> dealLogWeekContent(String content) {
		List<String> dayContent = new ArrayList<>();
		Integer index2 = content.indexOf("<br/>本周完成工作：");
		Integer index3 = content.indexOf("<br/>本周工作总结：");
		Integer index4 = content.indexOf("<br/>下周工作计划：");
		Integer index5 = content.indexOf("<br/>需协调与帮助：");
		Integer index6 = content.indexOf("<br/>备注：");
		dayContent.add(content.substring(5,index2));
		dayContent.add(content.substring(index2 + 12,index3));
		dayContent.add(content.substring(index3 + 12,index4));
		dayContent.add(content.substring(index4 + 12,index5));
		dayContent.add(content.substring(index5 + 12,index6));
		dayContent.add(content.substring(index6 + 8));
		return dayContent;
	}
	
	public static List<String> dealLogMonthContent(String content) {
		List<String> dayContent = new ArrayList<>();
		Integer index2 = content.indexOf("<br/>本月完成工作：");
		Integer index3 = content.indexOf("<br/>本月工作总结：");
		Integer index4 = content.indexOf("<br/>下月工作计划：");
		Integer index5 = content.indexOf("<br/>需协调与帮助：");
		Integer index6 = content.indexOf("<br/>备注：");
		dayContent.add(content.substring(5,index2));
		dayContent.add(content.substring(index2 + 12,index3));
		dayContent.add(content.substring(index3 + 12,index4));
		dayContent.add(content.substring(index4 + 12,index5));
		dayContent.add(content.substring(index5 + 12,index6));
		dayContent.add(content.substring(index6 + 8));
		return dayContent;
	}
	
	public static List<String> dealRequestQJContent(String content) {
		List<String> dayContent = new ArrayList<>();
		Integer index2 = content.indexOf("<br/>起始时间：");
		Integer index3 = content.indexOf("<br/>结束时间：");
		Integer index4 = content.indexOf("<br/>请假事由：");
		Integer index5 = content.indexOf("<br/>备注：");
		dayContent.add(content.substring(5,index2));
		dayContent.add(content.substring(index2 + 10,index3));
		dayContent.add(content.substring(index3 + 10,index4));
		dayContent.add(content.substring(index4 + 10,index5));
		dayContent.add(content.substring(index5 + 8));
		return dayContent;
	}
	
	public static List<String> dealRequestBXContent(String content) {
		List<String> dayContent = new ArrayList<>();
		Integer index2 = content.indexOf("<br/>报销金额：");
		Integer index3 = content.indexOf("<br/>报销类别：");
		Integer index4 = content.indexOf("<br/>费用明细：");
		Integer index5 = content.indexOf("<br/>备注：");
		dayContent.add(content.substring(5,index2));
		dayContent.add(content.substring(index2 + 10,index3));
		dayContent.add(content.substring(index3 + 10,index4));
		dayContent.add(content.substring(index4 + 10,index5));
		dayContent.add(content.substring(index5 + 8));
		return dayContent;
	}
	
	public static List<String> dealRequestCCContent(String content) {
		List<String> dayContent = new ArrayList<>();
		Integer index2 = content.indexOf("<br/>出差地点：");
		Integer index3 = content.indexOf("<br/>起始时间：");
		Integer index4 = content.indexOf("<br/>结束时间：");
		Integer index5 = content.indexOf("<br/>出差事由:");
		Integer index6 = content.indexOf("<br/>备注：");
		dayContent.add(content.substring(5,index2));
		dayContent.add(content.substring(index2 + 10,index3));
		dayContent.add(content.substring(index3 + 10,index4));
		dayContent.add(content.substring(index4 + 10,index5));
		dayContent.add(content.substring(index5 + 10,index6));
		dayContent.add(content.substring(index6 + 8));
		return dayContent;
	}

}
