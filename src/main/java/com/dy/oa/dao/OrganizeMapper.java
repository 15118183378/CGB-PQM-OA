package com.dy.oa.dao;

import com.dy.oa.pojo.Organize;

public interface OrganizeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Organize record);

    Organize selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Organize record);
    
    Organize selectByName(String name);
}