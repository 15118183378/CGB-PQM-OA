package com.dy.oa.service;

import com.dy.oa.pojo.RequestType;

public interface RequestTypeService {
	int deleteByPrimaryKey(Integer id);

    int insert(RequestType record);

    RequestType selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(RequestType record);

}
