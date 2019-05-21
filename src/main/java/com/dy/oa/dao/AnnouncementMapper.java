package com.dy.oa.dao;

import java.util.List;

import com.dy.oa.pojo.Announcement;

public interface AnnouncementMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(Announcement record);

    Announcement selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Announcement record);
    
    List<Announcement> selectAll();
    
}