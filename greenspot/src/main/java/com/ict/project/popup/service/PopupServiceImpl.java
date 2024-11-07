package com.ict.project.popup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.popup.dao.PopupDAO;
import com.ict.project.popup.vo.PopupVO;

@Service
public class PopupServiceImpl implements PopupService{
	
	@Autowired
	private PopupDAO popupDAO;
	
	
	@Override
	public List<PopupVO> getPopList() {
		return null;
	}

	@Override
	public PopupVO getPopDetail(String pop_idx) {
		return null;
	}

	@Override
	public int getPopInsert(PopupVO cvo) {
		return 0;
	}

	@Override
	public int getPopUpdate(PopupVO cvo) {
		return 0;
	}

	@Override
	public int getPopDelete(String pop_idx) {
		return 0;
	}

}
