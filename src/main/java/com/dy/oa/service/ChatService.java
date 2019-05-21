package com.dy.oa.service;

import java.util.List;

import com.dy.oa.pojo.Chat;

public interface ChatService {

	int deleteByPrimaryKey(Integer id);

	int insert(Chat record);

	Chat selectByPrimaryKey(Integer id);

	int updateByPrimaryKey(Chat record);
	
	List<Chat> selectByOrganizeId(Integer id);
	
}
