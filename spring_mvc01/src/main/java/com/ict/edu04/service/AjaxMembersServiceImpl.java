package com.ict.edu04.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.edu04.dao.AjaxMembersDAO;
import com.ict.edu04.vo.MembersVO;

@Service
public class AjaxMembersServiceImpl implements AjaxMembersService{
	
	@Autowired
	private AjaxMembersDAO ajaxMembersDAO;
	
	@Override
	public List<MembersVO> getMemberList() {
		
		return ajaxMembersDAO.getMemberList();
	}

	@Override
	public MembersVO getMemberDetail(String m_idx) {
		
		return null;
	}

	@Override
	public String getMemberInsert(MembersVO mvo) {
		
		return ajaxMembersDAO.getMemberInsert(mvo);
	}

	@Override
	public String getMemberDelete(String m_idx) {
		
		return ajaxMembersDAO.getMemberDelete(m_idx);
	}

	@Override
	public String getMemberUpdate(MembersVO mvo) {
		
		return null;
	}

	@Override
	public String getMemberIdChk(String m_id) {
		return ajaxMembersDAO.getMemberIdChk(m_id);
	}
	
}
