package com.dy.oa.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.oa.dao.LogTypeMapper;
import com.dy.oa.pojo.LogType;
import com.dy.oa.service.LogTypeService;

@Service(value = "logTypeService")
@Transactional
public class LogTypeServiceImpl implements LogTypeService{
	
	@Autowired
	private LogTypeMapper logTypeMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return logTypeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(LogType record) {
		return logTypeMapper.insert(record);
	}

	@Override
	public LogType selectByPrimaryKey(Integer id) {
		return logTypeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(LogType record) {
		return logTypeMapper.updateByPrimaryKey(record);
	}

}
