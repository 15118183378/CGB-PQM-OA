package com.dy.oa.dao;

import com.dy.oa.pojo.OrganizePosition;

public interface OrganizePositionMapper {
	
	int deleteByPrimaryKey(Integer id);

    int insert(OrganizePosition record);

    OrganizePosition selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(OrganizePosition record);
    
    OrganizePosition selectByOrganizeId(Integer id);

}
