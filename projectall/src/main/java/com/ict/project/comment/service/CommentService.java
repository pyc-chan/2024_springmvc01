package com.ict.project.comment.service;

import java.util.List;

import com.ict.project.comment.vo.CommentVO;

public interface CommentService {

	public int getCommentCount();
	
	public int getCommentSubCount(CommentVO cvo);
	
	public int getCommentUserCount(String u_id);
	
	public List<CommentVO> getCommentUserList(String u_id, int offset, int limit);
	
	public List<CommentVO> getCommentList(CommentVO cvo, int offset, int limit);
	
	public CommentVO getCommentDetail(String idx);
	
	public int getCommentInsert(CommentVO cvo);
	
	public int getCommentUpdate(CommentVO cvo);
	
	public int getCommentDelete(String idx);
	
	public List<CommentVO> getCommentList(int offset, int limit);
}
