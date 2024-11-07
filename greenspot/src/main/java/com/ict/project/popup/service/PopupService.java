package com.ict.project.popup.service;

import java.util.List;

import com.ict.project.popup.vo.PopupVO;

public interface PopupService {
	
	public List<PopupVO> getPopList();
	
	public PopupVO getPopDetail(String pop_idx);
	
	public int getPopInsert(PopupVO cvo);
	
	public int getPopUpdate(PopupVO cvo);
	
	public int getPopDelete(String pop_idx);
}
