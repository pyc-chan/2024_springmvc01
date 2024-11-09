package com.ict.project.fna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.fna.vo.FnaVO;


@Service
public class FnaServiceImpl implements FnaService{
	
	@Autowired
	private com.ict.project.fna.dao.FnaDAO FnaDAO;

	@Override
	public List<FnaVO> getFnaList(int offset, int limit) {
		return FnaDAO.getFnaList(offset, limit);
	}

	@Override
	public FnaVO getFnaDetail(String idx) {
		return FnaDAO.getFnaDetail(idx);
	}

	@Override
	public int getFnaInsert(FnaVO fvo) {
		return FnaDAO.getFnaInsert(fvo);
	}

	@Override
	public int getFnaUpdate(FnaVO fvo) {
		return FnaDAO.getFnaUpdate(fvo);
	}

	@Override
	public int getFnaDelete(String idx) {
		return FnaDAO.getFnaDelete(idx);
	}

	@Override
	public int getFnaCount() {
		return FnaDAO.getFnaCount();
	}

}
