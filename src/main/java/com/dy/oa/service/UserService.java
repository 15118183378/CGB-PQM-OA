package com.dy.oa.service;

import java.util.List;

import com.dy.oa.pojo.User;

public interface UserService {
	int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(User record);
    
    User getUserByUserName(String username);
    
    List<User> getUserByOrganizeId(Integer id);
    
    List<User> getUserLikeUserName(String username);

}
