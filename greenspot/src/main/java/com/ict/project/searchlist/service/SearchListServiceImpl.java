package com.ict.project.searchlist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.searchlist.dao.SearchListDAO;
import com.ict.project.searchlist.vo.TreeVO;

@Service
public class SearchListServiceImpl implements SearchListService{
	
	@Autowired
	public SearchListDAO searchListDAO;

	@Override
	public int getAreaCount() {
		return searchListDAO.getAreaCount();
	}
	
	@Override
	public int getStatCount() {
		return searchListDAO.getStatCount();
	}

	@Override
	public List<TreeVO> getAreaList(int offset, int limit) {
		return searchListDAO.getAreaList(offset, limit);
	}
	
	@Override
	public List<TreeVO> getStatList(int offset, int limit) {
		return searchListDAO.getStatList(offset, limit);
	}

}
