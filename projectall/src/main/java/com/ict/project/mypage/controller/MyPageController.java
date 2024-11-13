package com.ict.project.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.ict.project.inquery.vo.InqueryVO;
import com.ict.project.login.service.LoginService;
import com.ict.project.login.vo.LoginVO;
import com.ict.project.notice.service.NoticeService;
import com.ict.project.notice.vo.NoticeVO;
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
	public ModelAndView MyReviewList(String u_id, String cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView("sub/my_review");
		if(u_id == null) {
			u_id = String.valueOf(session.getAttribute("u_id")); 
		}
		
		int count = reviewService.getReviewUserCount(u_id);
		PerPageConstant perPageConstant = new PerPageConstant();
		int perPage = perPageConstant.getUserreviewpage();
		
		Paging paging = pagingService.pagingservice(count, cPage, perPage);
		int offset = paging.getOffset();
		
		List<ReviewVO> list = reviewService.getReviewUserList(u_id, offset, perPage);
		
		// 결과값, 페이징 넘기기
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("cmd", "/mypage/reviewlist");
		return mv;
	}
	
	
	
	@RequestMapping("/mypage/qnalist")
	public ModelAndView getQnaUserList(String u_id, String cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView("sub/my_qna");
		
		if(u_id == null) {
			u_id = String.valueOf(session.getAttribute("u_id")); 
		}
		
		int count = qnaService.getQnaUserCount(u_id);
		PerPageConstant perPageConstant = new PerPageConstant();
		int perPage = perPageConstant.getUserqnapage();
		
		Paging paging = pagingService.pagingservice(count, cPage, perPage);
		int offset = paging.getOffset();
		
		List<QnaVO> list = qnaService.getQnaUserList(u_id, offset, perPage);
		mv.addObject("count", count);
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("cmd", "/mypage/qnalist");
		
		return mv;
	}
	
	
	@RequestMapping("/mypage/commentlist")
	public ModelAndView getCommentList(String u_id, String cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView("sub/my_board");
		
		if(u_id == null) {
			u_id = String.valueOf(session.getAttribute("u_id")); 
		}
		
		int count = commentService.getCommentUserCount(u_id);
		PerPageConstant perPageConstant = new PerPageConstant();
		int perPage = perPageConstant.getUsercommentpage();
		
		Paging paging = pagingService.pagingservice(count, cPage, perPage);
		int offset = paging.getOffset();
		
		List<CommentVO> list = commentService.getCommentUserList(u_id, offset, offset);
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("cmd", "/mypage/commentlist");
		
		return mv;
	}
	
	@RequestMapping("/mypage/inquerylist")
	public ModelAndView getInqueryList(String u_id, String cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView("sub/my_inquery");
		
		if(u_id == null) {
			u_id = String.valueOf(session.getAttribute("u_id")); 
		}
		
		int count = inqueryService.getInqueryUserCount(u_id);
		PerPageConstant perPageConstant = new PerPageConstant();
		int perPage = perPageConstant.getUserinquerypage();
		
		Paging paging = pagingService.pagingservice(count, cPage, perPage);
		int offset = paging.getOffset();
		
		List<CommentVO> list = commentService.getCommentUserList(u_id, offset, offset);
		mv.addObject("count", count);
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("cmd", "/mypage/inquerylist");
		
		return mv;
	}
	
	@RequestMapping("/mypage/my_info")
	public ModelAndView getMyInfo(String u_id) {
		ModelAndView mv = new ModelAndView("my_info_check");
		LoginVO lvo = loginService.getDetail(u_id);
		mv.addObject("lvo", lvo);
		return mv;
	}
	
	
	
	
	@RequestMapping("/mypage/home")
	public ModelAndView getMypageHome(String u_id) {
		ModelAndView mv = new ModelAndView("mypage_main");
		PerPageConstant perPageConstant = new PerPageConstant();
		// review
		int rev_perPage = perPageConstant.getAdminuserpage();
		List<ReviewVO> reviewlist = reviewService.getReviewUserList(u_id, 0, rev_perPage);
		mv.addObject("reviewlist", reviewlist);
				
		// Qna
		int qna_perPage = perPageConstant.getAdminuserpage();
		List<QnaVO> qnalist = qnaService.getQnaList(0, qna_perPage);
		mv.addObject("qnalist",qnalist);
				
		// inquery
		int inquery_perPage = perPageConstant.getUserinqueryhome();
		List<InqueryVO> inquerylist = inqueryService.getInqueryList(0, inquery_perPage);
		mv.addObject("inquerylist", inquerylist);
		
		
		return mv;
	}
	
}
