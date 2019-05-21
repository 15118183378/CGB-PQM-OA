package com.dy.oa.service;

import com.dy.oa.pojo.Organize;

public interface OrganizeService {
	int deleteByPrimaryKey(Integer id);

    int insert(Organize record);

    Organize selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Organize record);
    
    Organize selectByName(String name);

}
