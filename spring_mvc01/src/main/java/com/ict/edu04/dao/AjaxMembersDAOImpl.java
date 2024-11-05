package com.ict.edu04.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.edu04.vo.MembersVO;


@Repository
public class AjaxMembersDAOImpl implements AjaxMembersDAO{
	
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<MembersVO> getMemberList() {
		
		return sqlSessionTemplate.selectList("ajaxmembers.getMembersList");
	}

	@Override
	public MembersVO getMemberDetail(String m_idx) {
		return null;
	}

	@Override
	public String getMemberInsert(MembersVO mvo) { 
		// 자동 commit이다.
		int result = sqlSessionTemplate.insert("ajaxmembers.getMemberInsert", mvo);
		return String.valueOf(result);
	}

	@Override
	public String getMemberDelete(String m_idx) {
		int result = sqlSessionTemplate.delete("ajaxmembers.getMemberDelete", m_idx);
		return String.valueOf(result);
	}

	@Override
	public String getMemberUpdate(MembersVO mvo) {
		return null;
	}

	@Override
	public String getMemberIdChk(String m_id) {
		int result = sqlSessionTemplate.selectOne("ajaxmembers.getIdChk", m_id);
		return String.valueOf(result);
	}
	
}
