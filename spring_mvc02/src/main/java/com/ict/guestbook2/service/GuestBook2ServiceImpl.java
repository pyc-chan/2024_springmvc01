package com.ict.guestbook2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.guestbook2.dao.GuestBook2DAO;
import com.ict.guestbook2.vo.GuestBook2VO;

@Service
public class GuestBook2ServiceImpl implements GuestBook2Service{
	
	@Autowired
	private GuestBook2DAO guestBook2DAO;
	
	@Override
	public List<GuestBook2VO> getGuestBook2List() {
		return guestBook2DAO.getGuestBook2List();
	}

	@Override
	public int getGuestBook2Insert(GuestBook2VO gb2vo) {
		return guestBook2DAO.getGuestBook2Insert(gb2vo);
	}

	@Override
	public GuestBook2VO getGuestBook2Detail(String gb2_idx) {
		
		return guestBook2DAO.getGuestBook2Detail(gb2_idx);
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
