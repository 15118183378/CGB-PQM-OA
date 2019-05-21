package com.dy.oa.service;

import java.util.List;

import com.dy.oa.pojo.Log;

public interface LogService {
	int deleteByPrimaryKey(Integer id);

	int insert(Log record);

	Log selectByPrimaryKey(Integer id);

	int updateByPrimaryKey(Log record);
	
	List<Log> selectByTargetId(Integer id);
	
	List<Log> selectByStaffId(Integer id);

}
