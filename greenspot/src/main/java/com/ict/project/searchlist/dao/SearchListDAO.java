package com.ict.project.searchlist.dao;

import java.util.List;

import com.ict.project.searchlist.vo.TreeVO;

public interface SearchListDAO {
	
	public int getAreaCount();
	
	public int getStatCount();

	public List<TreeVO> getAreaList(int offset, int limit);

	public List<TreeVO> getStatList(int offset, int limit);
}
