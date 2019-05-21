package com.dy.oa.service;

import java.util.List;

import com.dy.oa.pojo.Power;

public interface PowerService {
	int deleteByPrimaryKey(Integer id);

    int insert(Power record);

    Power selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Power record);
    
    List<Power> selectAll();
    
}
