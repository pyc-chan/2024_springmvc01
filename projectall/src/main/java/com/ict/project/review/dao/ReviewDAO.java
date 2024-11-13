package com.ict.project.review.dao;

import java.util.List;

import com.ict.project.review.vo.ReviewVO;



public interface ReviewDAO {
	
	public int getReviewHit(String rev_idx);
	
	public int getReviewCount();
	
	public List<ReviewVO> getReviewList(int offset, int limit);
	
	public ReviewVO getReviewDetail(String rev_idx);
	
	public int getReviewInsert(ReviewVO rvo);
	
	public int getReviewUpdate(ReviewVO rvo);
	
	public int getReviewDelete(String rev_idx);
	
	public List<ReviewVO> getReviewUserList(String u_id, int offset, int limit);
	
	public int getReviewUserCount(String idx);
	}
