package com.ict.project.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.comment.dao.CommentDAO;
import com.ict.project.comment.vo.CommentVO;


@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentDAO CommentDAO;

	@Override
	public List<CommentVO> getCommentList(CommentVO cvo, int offset, int limit) {
		return CommentDAO.getCommentList(cvo, offset, limit);
	}
	
	@Override
	public List<CommentVO> getCommentUserList(String u_id, int offset, int limit) {
		return CommentDAO.getCommentUserList(u_id, offset, limit);
	}

	@Override
	public CommentVO getCommentDetail(String idx) {
		return CommentDAO.getCommentDetail(idx);
	}

	@Override
	public int getCommentInsert(CommentVO cvo) {
		return CommentDAO.getCommentInsert(cvo);
	}

	@Override
	public int getCommentUpdate(CommentVO cvo) {
		return CommentDAO.getCommentUpdate(cvo);
	}

	@Override
	public int getCommentDelete(String idx) {
		return CommentDAO.getCommentDelete(idx);
	}

	@Override
	public int getCommentCount() {
		return CommentDAO.getCommentCount();
	}
	
	@Override
	public int getCommentUserCount(String u_id) {
		return CommentDAO.getCommentUserCount(u_id);
	}

	@Override
	public List<CommentVO> getCommentList(int offset, int limit) {
		return CommentDAO.getCommentList(offset, limit);
	}

	@Override
	public int getCommentSubCount(CommentVO cvo) {
		return CommentDAO.getCommentSubCount(cvo);
	}


}

