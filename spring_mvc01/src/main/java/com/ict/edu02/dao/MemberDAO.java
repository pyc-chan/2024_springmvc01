package com.ict.edu02.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.ict.edu02.vo.MembersVO;

public class MemberDAO {
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public List<MembersVO> getMemberList(){
		try {
			List<MembersVO> list = null;
			list = sqlSessionTemplate.selectList("members.getList") ;
			return list;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
