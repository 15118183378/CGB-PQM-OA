package com.dy.oa.service;

import java.util.List;

import com.dy.oa.pojo.Invite;

public interface InviteService {
	int deleteByPrimaryKey(Integer id);

	int insert(Invite record);

	Invite selectByPrimaryKey(Integer id);

	int updateByPrimaryKey(Invite record);
	
	List<Invite> selectByUserId(Integer id);
	
	int deleteByUserId(Integer id);

}
