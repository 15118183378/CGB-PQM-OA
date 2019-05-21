package com.dy.oa.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.oa.dao.OrganizeMapper;
import com.dy.oa.pojo.Organize;
import com.dy.oa.service.OrganizeService;

@Service(value = "organizeService")
@Transactional
public class OrganizeServiceImpl implements OrganizeService{
	
	@Autowired
	private OrganizeMapper organizeMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return organizeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Organize record) {
		return organizeMapper.insert(record);
	}

	@Override
	public Organize selectByPrimaryKey(Integer id) {
		return organizeMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Organize record) {
		return organizeMapper.updateByPrimaryKey(record);
	}

	@Override
	public Organize selectByName(String name) {
		return organizeMapper.selectByName(name);
	}

}
