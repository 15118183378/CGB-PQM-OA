package com.dy.oa.service;

import java.util.Map;

import com.dy.oa.pojo.Sign;

public interface SignService {
	int deleteByPrimaryKey(Integer id);

    int insert(Sign record);

    Sign selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Sign record);
    
    Sign selectByStaffAndDate(Map<String,Object> map);

}
