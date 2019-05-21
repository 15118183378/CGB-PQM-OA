package com.dy.oa.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.oa.dao.StaffMapper;
import com.dy.oa.pojo.Staff;
import com.dy.oa.pojo.User;
import com.dy.oa.service.StaffService;

@Service(value = "staffService")
@Transactional
public class StaffServiceImpl implements StaffService{
	
	@Autowired
	private StaffMapper staffMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return staffMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Staff record) {
		return staffMapper.insert(record);
	}

	@Override
	public Staff selectByPrimaryKey(Integer id) {
		return staffMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Staff record) {
		return staffMapper.updateByPrimaryKey(record);
	}

	@Override
	public Staff selectByUser(User user) {
		return staffMapper.selectByUser(user);
	}

	@Override
	public List<Staff> selectStaffOnJob(Integer id) {
		return staffMapper.selectStaffOnJob(id);
	}

}
