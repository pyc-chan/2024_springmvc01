package com.ict.project.review.service;

import java.util.List;

import com.ict.project.review.vo.ReviewVO;



public interface ReviewService {
	
	public int getReviewHit(String rev_idx);
	
	public int getReviewCount();
	
	public List<ReviewVO> getReviewList(int offset, int limit);
	
	public ReviewVO getReviewDetail(String idx);
	
	public int getReviewInsert(ReviewVO rvo);
	
	public int getReviewUpdate(ReviewVO rvo);
	
	public int getReviewDelete(String idx);
	
	public List<ReviewVO> getReviewUserList(String u_idx, int offset, int limit);
	
	public int getReviewUserCount(String idx);
}
