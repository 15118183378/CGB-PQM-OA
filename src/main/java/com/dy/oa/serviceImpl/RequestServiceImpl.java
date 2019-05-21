package com.dy.oa.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.oa.dao.RequestMapper;
import com.dy.oa.pojo.Request;
import com.dy.oa.service.RequestService;

@Service(value = "requestService")
@Transactional
public class RequestServiceImpl implements RequestService{
	
	@Autowired
	private RequestMapper requestMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return requestMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Request record) {
		return requestMapper.insert(record);
	}

	@Override
	public Request selectByPrimaryKey(Integer id) {
		return requestMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Request record) {
		return requestMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Request> selectWaitRequestByTarget(Integer id) {
		return requestMapper.selectWaitRequestByTarget(id);
	}

	@Override
	public List<Request> selectDealedRequest(Integer id) {
		return requestMapper.selectDealedRequest(id);
	}

	@Override
	public List<Request> selectByStaffId(Integer id) {
		return requestMapper.selectByStaffId(id);
	}

}
