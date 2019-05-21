package com.dy.oa.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dy.oa.dao.ChatMapper;
import com.dy.oa.pojo.Chat;
import com.dy.oa.service.ChatService;

@Service(value = "chatService")
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatMapper chatMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return chatMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Chat record) {
		return chatMapper.insert(record);
	}

	@Override
	public Chat selectByPrimaryKey(Integer id) {
		return chatMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Chat record) {
		return chatMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Chat> selectByOrganizeId(Integer id) {
		return chatMapper.selectByOrganizeId(id);
	}

}
