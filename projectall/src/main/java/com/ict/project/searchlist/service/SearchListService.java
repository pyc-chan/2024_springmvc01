package com.ict.project.searchlist.service;

import java.util.List;

import com.ict.project.searchlist.vo.TreeVO;

public interface SearchListService {
	
	public int getAreaCount();
	
	public int getStatCount();

	public List<TreeVO> getAreaList(int offset, int limit);

	public List<TreeVO> getStatList(int offset, int limit);
}
