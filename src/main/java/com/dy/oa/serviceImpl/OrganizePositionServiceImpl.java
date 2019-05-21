package com.dy.oa.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.oa.dao.OrganizePositionMapper;
import com.dy.oa.pojo.OrganizePosition;
import com.dy.oa.service.OrganizePositionService;

@Service(value = "organizePositionService")
@Transactional
public class OrganizePositionServiceImpl implements OrganizePositionService{

	@Autowired
	private OrganizePositionMapper organizePositionMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return organizePositionMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(OrganizePosition record) {
		return organizePositionMapper.insert(record);
	}

	@Override
	public OrganizePosition selectByPrimaryKey(Integer id) {
		return organizePositionMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(OrganizePosition record) {
		return organizePositionMapper.updateByPrimaryKey(record);
	}

	@Override
	public OrganizePosition selectByOrganizeId(Integer id) {
		return organizePositionMapper.selectByOrganizeId(id);
	}
	
}
