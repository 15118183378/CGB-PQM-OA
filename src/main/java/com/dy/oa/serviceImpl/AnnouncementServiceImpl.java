package com.dy.oa.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dy.oa.dao.AnnouncementMapper;
import com.dy.oa.pojo.Announcement;
import com.dy.oa.service.AnnouncementService;

@Service(value = "announcementService")
@Transactional
public class AnnouncementServiceImpl implements AnnouncementService{
	
	@Autowired
	private AnnouncementMapper announcementMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return announcementMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Announcement record) {
		return announcementMapper.insert(record);
	}

	@Override
	public Announcement selectByPrimaryKey(Integer id) {
		return announcementMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Announcement record) {
		return announcementMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Announcement> selectAll() {
		return announcementMapper.selectAll();
	}

}
