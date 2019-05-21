package com.dy.oa.dao;

import java.util.List;

import com.dy.oa.pojo.Chat;

public interface ChatMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Chat record);

	Chat selectByPrimaryKey(Integer id);

	int updateByPrimaryKey(Chat record);

	List<Chat> selectByOrganizeId(Integer id);
}
