package com.dy.oa.serviceImpl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.oa.dao.SignMapper;
import com.dy.oa.pojo.Sign;
import com.dy.oa.service.SignService;

@Service(value = "signService")
@Transactional
public class SignServiceImpl implements SignService{
	
	@Autowired
	private SignMapper signMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return signMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Sign record) {
		return signMapper.insert(record);
	}

	@Override
	public Sign selectByPrimaryKey(Integer id) {
		return signMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Sign record) {
		return signMapper.updateByPrimaryKey(record);
	}

	@Override
	public Sign selectByStaffAndDate(Map<String, Object> map) {
		return signMapper.selectByStaffAndDate(map);
	}

}
