package com.dy.oa.util;

import java.util.ArrayList;
import java.util.List;

public class DealContent {
	
	public static List<String> dealLogDayContent(String content) {
		List<String> dayContent = new ArrayList<>();
		Integer index2 = content.indexOf("<br/>������ɹ�����");
		Integer index3 = content.indexOf("<br/>���չ����ܽ᣺");
		Integer index4 = content.indexOf("<br/>���չ����ƻ���");
		Integer index5 = content.indexOf("<br/>��Э���������");
		Integer index6 = content.indexOf("<br/>��ע��");
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
		Integer index2 = content.indexOf("<br/>������ɹ�����");
		Integer index3 = content.indexOf("<br/>���ܹ����ܽ᣺");
		Integer index4 = content.indexOf("<br/>���ܹ����ƻ���");
		Integer index5 = content.indexOf("<br/>��Э���������");
		Integer index6 = content.indexOf("<br/>��ע��");
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
		Integer index2 = content.indexOf("<br/>������ɹ�����");
		Integer index3 = content.indexOf("<br/>���¹����ܽ᣺");
		Integer index4 = content.indexOf("<br/>���¹����ƻ���");
		Integer index5 = content.indexOf("<br/>��Э���������");
		Integer index6 = content.indexOf("<br/>��ע��");
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
		Integer index2 = content.indexOf("<br/>��ʼʱ�䣺");
		Integer index3 = content.indexOf("<br/>����ʱ�䣺");
		Integer index4 = content.indexOf("<br/>������ɣ�");
		Integer index5 = content.indexOf("<br/>��ע��");
		dayContent.add(content.substring(5,index2));
		dayContent.add(content.substring(index2 + 10,index3));
		dayContent.add(content.substring(index3 + 10,index4));
		dayContent.add(content.substring(index4 + 10,index5));
		dayContent.add(content.substring(index5 + 8));
		return dayContent;
	}
	
	public static List<String> dealRequestBXContent(String content) {
		List<String> dayContent = new ArrayList<>();
		Integer index2 = content.indexOf("<br/>������");
		Integer index3 = content.indexOf("<br/>�������");
		Integer index4 = content.indexOf("<br/>������ϸ��");
		Integer index5 = content.indexOf("<br/>��ע��");
		dayContent.add(content.substring(5,index2));
		dayContent.add(content.substring(index2 + 10,index3));
		dayContent.add(content.substring(index3 + 10,index4));
		dayContent.add(content.substring(index4 + 10,index5));
		dayContent.add(content.substring(index5 + 8));
		return dayContent;
	}
	
	public static List<String> dealRequestCCContent(String content) {
		List<String> dayContent = new ArrayList<>();
		Integer index2 = content.indexOf("<br/>����ص㣺");
		Integer index3 = content.indexOf("<br/>��ʼʱ�䣺");
		Integer index4 = content.indexOf("<br/>����ʱ�䣺");
		Integer index5 = content.indexOf("<br/>��������:");
		Integer index6 = content.indexOf("<br/>��ע��");
		dayContent.add(content.substring(5,index2));
		dayContent.add(content.substring(index2 + 10,index3));
		dayContent.add(content.substring(index3 + 10,index4));
		dayContent.add(content.substring(index4 + 10,index5));
		dayContent.add(content.substring(index5 + 10,index6));
		dayContent.add(content.substring(index6 + 8));
		return dayContent;
	}

}
