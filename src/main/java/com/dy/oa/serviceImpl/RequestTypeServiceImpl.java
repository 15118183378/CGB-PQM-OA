package com.dy.oa.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.oa.dao.RequestTypeMapper;
import com.dy.oa.pojo.RequestType;
import com.dy.oa.service.RequestTypeService;

@Service(value = "requestTypeService")
@Transactional
public class RequestTypeServiceImpl implements RequestTypeService{
	
	@Autowired
	private RequestTypeMapper requestTypeMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return requestTypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(RequestType record) {
		return requestTypeMapper.insert(record);
	}

	@Override
	public RequestType selectByPrimaryKey(Integer id) {
		return requestTypeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(RequestType record) {
		return requestTypeMapper.updateByPrimaryKey(record);
	}

}
