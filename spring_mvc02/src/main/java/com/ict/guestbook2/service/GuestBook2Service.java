package com.ict.guestbook2.service;

import java.util.List;

import com.ict.guestbook2.vo.GuestBook2VO;

public interface GuestBook2Service {
	// 리스트
	public List<GuestBook2VO> getGuestBook2List();
	
	// 삽입
	public int getGuestBook2Insert(GuestBook2VO gb2vo);
	
	// 상세보기
	public GuestBook2VO getGuestBook2Detail(String gb2_idx);
	
	// 수정하기
	public int getGuestBook2Update(GuestBook2VO gb2vo);
	
	// 삭제하기
	public int getGuestBook2Delete(String gb2_idx);
}
