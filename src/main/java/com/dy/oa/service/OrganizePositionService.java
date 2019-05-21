package com.dy.oa.service;

import com.dy.oa.pojo.OrganizePosition;

public interface OrganizePositionService {
	int deleteByPrimaryKey(Integer id);

    int insert(OrganizePosition record);

    OrganizePosition selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(OrganizePosition record);
    
    OrganizePosition selectByOrganizeId(Integer id);

}
