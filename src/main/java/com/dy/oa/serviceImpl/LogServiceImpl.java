package com.dy.oa.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.oa.dao.LogMapper;
import com.dy.oa.pojo.Log;
import com.dy.oa.service.LogService;

@Service(value = "logService")
@Transactional
public class LogServiceImpl implements LogService{
	
	@Autowired
	private LogMapper logMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return logMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Log record) {
		return logMapper.insert(record);
	}

	@Override
	public Log selectByPrimaryKey(Integer id) {
		return logMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Log record) {
		return logMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Log> selectByTargetId(Integer id) {
		return logMapper.selectByTargetId(id);
	}

	@Override
	public List<Log> selectByStaffId(Integer id) {
		return logMapper.selectByStaffId(id);
	}

}
