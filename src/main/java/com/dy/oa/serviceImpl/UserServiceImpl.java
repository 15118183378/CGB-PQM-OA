package com.dy.oa.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.oa.dao.UserMapper;
import com.dy.oa.pojo.User;
import com.dy.oa.service.UserService;

@Service(value = "userService")
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(User record) {
		return userMapper.insert(record);
	}

	@Override
	public User selectByPrimaryKey(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(User record) {
		return userMapper.updateByPrimaryKey(record);
	}

	@Override
	public User getUserByUserName(String username) {
		return userMapper.getUserByUserName(username);
	}

	@Override
	public List<User> getUserByOrganizeId(Integer id) {
		return userMapper.getUserByOrganizeId(id);
	}

	@Override
	public List<User> getUserLikeUserName(String username) {
		return userMapper.getUserLikeUserName(username);
	}

}
