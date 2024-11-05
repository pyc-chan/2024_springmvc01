package com.ict.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.member.dao.MemberDAO;
import com.ict.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired 
	private MemberDAO memberDAO; 
	
	@Override
	public MemberVO getPwChk(String m_id) throws Exception {
		return memberDAO.getPwChk(m_id);
	}
	
}
