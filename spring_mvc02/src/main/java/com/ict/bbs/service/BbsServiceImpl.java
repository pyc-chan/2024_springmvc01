package com.ict.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.bbs.dao.BbsDAO;
import com.ict.bbs.vo.BbsVO;
import com.ict.bbs.vo.CommVO;

@Service
public class BbsServiceImpl implements BbsService{

	@Autowired
	private BbsDAO bbsDAO; 
	
	@Override
	public List<BbsVO> getBbsList() {
		return bbsDAO.getBbsList();
	}

	@Override
	public int getBbsInsert(BbsVO bvo) {
		return bbsDAO.getBbsInsert(bvo);
	}

	@Override
	public BbsVO getBbsDetail(String b_idx) {
		return bbsDAO.getBbsDetail(b_idx);
	}

	@Override
	public int getBbsDelete(String b_idx) {
		return bbsDAO.getBbsDelete(b_idx);
	}

	@Override
	public int getBbsUpdate(BbsVO bvo) {
		return bbsDAO.getBbsUpdate(bvo);
	}

	@Override
	public int getHitUpdate(String b_idx) {
		return bbsDAO.getHitUpdate(b_idx);
	}

	@Override
	public int getTotalCount() {
		return bbsDAO.getTotalCount();
	}

	@Override
	public List<BbsVO> getBbsList(int offset, int limit) {
		return bbsDAO.getBbsList(offset, limit);
	}

	@Override
	public List<CommVO> getCommentList(String b_idx) {
		return bbsDAO.getCommentList(b_idx);
	}

	@Override
	public int getCommentInsert(CommVO cvo) {
		return bbsDAO.getCommentInsert(cvo);
	}

	@Override
	public int getCommentDelete(String c_idx) {
		return bbsDAO.getCommentDelete(c_idx);
	}

}
