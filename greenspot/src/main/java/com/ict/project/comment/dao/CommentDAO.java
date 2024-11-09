package com.ict.project.comment.dao;

import java.util.List;

import com.ict.project.comment.vo.CommentVO;


public interface CommentDAO {
	
	public int getCommentCount();
	
	public List<CommentVO> getCommentList(int offset, int limit);
	
	public CommentVO getCommentDetail(String idx);
	
	public int getCommentInsert(CommentVO cvo);
	
	public int getCommentUpdate(CommentVO cvo);
	
	public int getCommentDelete(String idx);

	}
