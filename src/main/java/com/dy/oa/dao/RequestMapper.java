package com.dy.oa.dao;

import java.util.List;

import com.dy.oa.pojo.Request;

public interface RequestMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Request record);

    Request selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Request record);
    
    List<Request> selectWaitRequestByTarget(Integer id);
    
    List<Request> selectDealedRequest(Integer id);
    
    List<Request> selectByStaffId(Integer id);
}