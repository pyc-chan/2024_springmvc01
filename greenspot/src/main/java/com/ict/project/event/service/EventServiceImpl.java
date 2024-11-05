package com.ict.project.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.event.dao.EventDAO;
import com.ict.project.event.vo.EventVO;

@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDAO eventDAO;

	@Override
	public int getTotalCount() {
		return eventDAO.getTotalCount();
	}

	@Override
	public List<EventVO> getEventList(int offset, int limit) {
		return eventDAO.getEventList(offset, limit);
	}

	@Override
	public List<EventVO> getEventSearch(String str, int offset, int limit) {
		return eventDAO.getEventSearch(str, offset, limit);
	}
}
