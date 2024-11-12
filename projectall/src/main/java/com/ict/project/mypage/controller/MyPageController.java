package com.ict.project.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.comm.Paging;
import com.ict.project.comm.PagingService;
import com.ict.project.comm.PerPageConstant;
import com.ict.project.comment.service.CommentService;
import com.ict.project.comment.vo.CommentVO;
import com.ict.project.inquery.service.InqueryService;
import com.ict.project.login.service.LoginService;
import com.ict.project.login.vo.LoginVO;
import com.ict.project.qna.service.QnaService;
import com.ict.project.qna.vo.QnaVO;
import com.ict.project.review.service.ReviewService;
import com.ict.project.review.vo.ReviewVO;

@Controller
public class MyPageController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private PagingService pagingService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private InqueryService inqueryService;
	
	@RequestMapping("/mypage/reviewlist")
	public ModelAndView MyReviewList(String u_idx, String cPage) {
		ModelAndView mv = new ModelAndView();
		
		int count = reviewService.getReviewUserCount(u_idx);
		PerPageConstant perPageConstant = new PerPageConstant();
		int perPage = perPageConstant.getUserreviewpage();
		
		Paging paging = pagingService.pagingservice(count, cPage, perPage);
		int offset = paging.getOffset();
		
		List<ReviewVO> list = reviewService.getReviewUserList(u_idx, offset, perPage);
		
		// 결과값, 페이징 넘기기
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("cmd", "/mypage/reviewlist");
		return mv;
	}
	
	
	
	@RequestMapping("/mypage/qnalist")
	public ModelAndView getQnaUserList(String u_idx, String cPage) {
		ModelAndView mv = new ModelAndView("");
		
		int count = qnaService.getQnaUserCount(u_idx);
		PerPageConstant perPageConstant = new PerPageConstant();
		int perPage = perPageConstant.getUserqnapage();
		
		Paging paging = pagingService.pagingservice(count, cPage, perPage);
		int offset = paging.getOffset();
		
		List<QnaVO> list = qnaService.getQnaUserList(u_idx, offset, perPage);
		mv.addObject("count", count);
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("cmd", "/mypage/qnalist");
		
		return mv;
	}
	
	
	@RequestMapping("/mypage/commentlist")
	public ModelAndView getCommentList(String u_idx, String cPage) {
		ModelAndView mv = new ModelAndView();
		
		int count = commentService.getCommentUserCount(u_idx);
		PerPageConstant perPageConstant = new PerPageConstant();
		int perPage = perPageConstant.getUsercommentpage();
		
		Paging paging = pagingService.pagingservice(count, cPage, perPage);
		int offset = paging.getOffset();
		
		List<CommentVO> list = commentService.getCommentUserList(u_idx, offset, offset);
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("cmd", "/mypage/commentlist");
		
		return mv;
	}
	
	@RequestMapping("/mypage/inquerylist")
	public ModelAndView getInqueryList(String u_idx, String cPage) {
		ModelAndView mv = new ModelAndView();
		
		int count = inqueryService.getInqueryUserCount(u_idx);
		PerPageConstant perPageConstant = new PerPageConstant();
		int perPage = perPageConstant.getUserinquerypage();
		
		Paging paging = pagingService.pagingservice(count, cPage, perPage);
		int offset = paging.getOffset();
		
		List<CommentVO> list = commentService.getCommentUserList(u_idx, offset, offset);
		mv.addObject("count", count);
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("cmd", "/mypage/inquerylist");
		
		return mv;
	}
	
	@RequestMapping("/mypage/my_info")
	public ModelAndView getMyInfo(String u_idx) {
		ModelAndView mv = new ModelAndView();
		LoginVO lvo = loginService.getDetail(u_idx);
		mv.addObject("lvo", lvo);
		return mv;
	}
	
	@RequestMapping("/mypage/home")
	public ModelAndView getMypageHome(String u_idx) {
		ModelAndView mv = new ModelAndView("");
		
		
		
		
		
		
		return mv;
	}
	
}
