package com.dy.oa.dao;

import java.util.List;

import com.dy.oa.pojo.Power;

public interface PowerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Power record);

    Power selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Power record);
    
    List<Power> selectAll();
}