package com.dy.oa.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import com.dy.oa.pojo.Log;
import com.dy.oa.pojo.Request;

public class MySort {
	
	public static List<Log> sortLog(List<Log> logs) {
		logs.sort(new Comparator<Log>() {
			@Override
			public int compare(Log o1, Log o2) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date date1 = new Date();
				Date date2 = new Date();
				try {
					date1 = sdf.parse(o1.getCreateTime());
					date2 = sdf.parse(o2.getCreateTime());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				if(date1.before(date2)) {
					return 1;
				}
				return -1;
			}
		});
		return logs;
	}
	
	public static List<Request> sortRequest(List<Request> requests) {
		requests.sort(new Comparator<Request>() {
			@Override
			public int compare(Request o1, Request o2) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date date1 = new Date();
				Date date2 = new Date();
				try {
					date1 = sdf.parse(o1.getRequestTime());
					date2 = sdf.parse(o2.getRequestTime());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				if(date1.before(date2)) {
					return 1;
				}
				return -1;
			}
		});
		return requests;
	}

}
