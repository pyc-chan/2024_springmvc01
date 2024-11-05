package com.ict.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public MemberVO getPwChk(String m_id) throws Exception {
		return sqlSessionTemplate.selectOne("member.pwchk",m_id);
	}
	
}
