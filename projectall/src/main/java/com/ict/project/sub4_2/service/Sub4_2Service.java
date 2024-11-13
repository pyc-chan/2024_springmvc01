package com.ict.project.sub4_2.service;

import java.util.List;

import com.ict.project.sub4_2.vo.Sub4_2VO;

public interface Sub4_2Service {
	
	public List<Sub4_2VO> getSubList(List<Sub4_2VO> list, int offset, int limit);
}
