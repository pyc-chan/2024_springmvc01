package com.ict.project.inquery.service;

import java.util.List;

import com.ict.project.inquery.vo.InqueryVO;


public interface InqueryService {
	
	public int getInqueryCount();
	
	public int getInqueryUserCount(String u_idx);
	
	public List<InqueryVO> getInqueryList(int offset, int limit);
	
	public List<InqueryVO> getInqueryUserList(String u_idx, int offset, int limit);
	
	public InqueryVO getInqueryDetail(String idx);
	
	public int getInqueryInsert(InqueryVO ivo);
	
	public int getInqueryUpdate(InqueryVO ivo);
	
	public int getInqueryDelete(String idx);
	
	public int getAdminUpdate(InqueryVO ivo);
}

