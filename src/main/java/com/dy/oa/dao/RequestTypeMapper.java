package com.dy.oa.dao;

import com.dy.oa.pojo.RequestType;

public interface RequestTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RequestType record);

    RequestType selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(RequestType record);
}