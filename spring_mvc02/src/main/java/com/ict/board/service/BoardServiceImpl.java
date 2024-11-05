package com.ict.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.board.dao.BoardDAO;
import com.ict.board.vo.BoardVO;


@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public int getTotalCount() {
		return boardDAO.getTotalCount();
	}

	@Override
	public List<BoardVO> getBoardList(int offset, int limit) {
		return boardDAO.getBoardList(offset, limit);
	}

	@Override
	public int getBoardInsert(BoardVO bovo) {
		return boardDAO.getBoardInsert(bovo);
	}

	@Override
	public int getBoardHit(String bo_idx) {
		return boardDAO.getBoardHit(bo_idx);
	}

	@Override
	public BoardVO getBoardDetail(String idx) {
		return boardDAO.getBoardDetail(idx);
	}

	@Override
	public int getLevUpdate(Map<String, Integer> map) {
		return boardDAO.getLevUpdate(map);
	}

	@Override
	public int getAnsInsert(BoardVO bovo) {
		return boardDAO.getAnsInsert(bovo);
	}

	@Override
	public int getBoardDelete(BoardVO bovo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getBoardUpdate(BoardVO bovo) {
		return boardDAO.getBoardUpdate(bovo);
	}

}
