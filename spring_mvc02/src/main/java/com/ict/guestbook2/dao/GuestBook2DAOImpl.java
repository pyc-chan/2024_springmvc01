package com.ict.guestbook2.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.guestbook2.vo.GuestBook2VO;

@Repository
public class GuestBook2DAOImpl implements GuestBook2DAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate; 
	
	@Override
	public List<GuestBook2VO> getGuestBook2List() {
		return sqlSessionTemplate.selectList("guestbook2.list");
	}

	@Override
	public int getGuestBook2Insert(GuestBook2VO gb2vo) {
		
		return sqlSessionTemplate.insert("guestbook2.insert", gb2vo);
	}

	@Override
	public GuestBook2VO getGuestBook2Detail(String gb2_idx) {
		return sqlSessionTemplate.selectOne("guestbook2.detail",gb2_idx);
	}

	@Override
	public int getGuestBook2Update(GuestBook2VO gb2vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getGuestBook2Delete(String gb2_idx) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
