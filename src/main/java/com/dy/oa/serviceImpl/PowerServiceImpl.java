package com.dy.oa.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.oa.dao.PowerMapper;
import com.dy.oa.pojo.Power;
import com.dy.oa.service.PowerService;

@Service(value = "powerService")
@Transactional
public class PowerServiceImpl implements PowerService{
	
	@Autowired
	private PowerMapper powerMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return powerMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Power record) {
		return powerMapper.insert(record);
	}

	@Override
	public Power selectByPrimaryKey(Integer id) {
		return powerMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Power record) {
		return powerMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Power> selectAll() {
		return powerMapper.selectAll();
	}

}
