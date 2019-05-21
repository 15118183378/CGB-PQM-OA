package com.dy.oa.dao;

import java.util.List;

import com.dy.oa.pojo.Staff;
import com.dy.oa.pojo.User;

public interface StaffMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Staff record);

    Staff selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Staff record);
    
    Staff selectByUser(User user);
    
    List<Staff> selectStaffOnJob(Integer id);
}