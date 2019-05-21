package com.dy.oa.dao;

import java.util.List;

import com.dy.oa.pojo.Log;

public interface LogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Log record);

    Log selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Log record);
    
    List<Log> selectByTargetId(Integer id);
    
    List<Log> selectByStaffId(Integer id);
}