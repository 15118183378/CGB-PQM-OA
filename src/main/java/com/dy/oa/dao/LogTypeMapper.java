package com.dy.oa.dao;

import com.dy.oa.pojo.LogType;

public interface LogTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LogType record);

    LogType selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(LogType record);
}