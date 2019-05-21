package com.dy.oa.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.oa.dao.InviteMapper;
import com.dy.oa.pojo.Invite;
import com.dy.oa.service.InviteService;

@Service(value = "inviteService")
@Transactional
public class InviteServiceImpl implements InviteService{

	@Autowired
	private InviteMapper inviteMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return inviteMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Invite record) {
		return inviteMapper.insert(record);
	}

	@Override
	public Invite selectByPrimaryKey(Integer id) {
		return inviteMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Invite record) {
		return inviteMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Invite> selectByUserId(Integer id) {
		return inviteMapper.selectByUserId(id);
	}

	@Override
	public int deleteByUserId(Integer id) {
		return inviteMapper.deleteByUserId(id);
	}
	
}
