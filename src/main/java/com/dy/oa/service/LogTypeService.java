package com.dy.oa.service;

import com.dy.oa.pojo.LogType;

public interface LogTypeService {
	int deleteByPrimaryKey(Integer id);

    int insert(LogType record);

    LogType selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(LogType record);

}
