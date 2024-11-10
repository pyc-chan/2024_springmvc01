package com.ict.project.comment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.comm.Paging;
import com.ict.project.comm.PagingService;
import com.ict.project.comm.PerPageConstant;
import com.ict.project.comment.service.CommentService;
import com.ict.project.comment.vo.CommentVO;


@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private PagingService pagingservice;
	
	
	@PostMapping("/comment/list")
	public ModelAndView getCommentList(HttpServletRequest request, @ModelAttribute CommentVO cvo){
		ModelAndView mv = new ModelAndView();
		
		// pagingservice 메서드에 넣을 값
		int count = commentService.getCommentCount();
		String cPage = request.getParameter("cPage");
		PerPageConstant pageConstant = new PerPageConstant();
		int perpage = pageConstant.getCommentpage();
		
		// 페이징 기법 설정
		Paging paging = pagingservice.pagingservice(count, cPage, perpage);
		
		// DB 갔다가 오기 
		List<CommentVO> list = commentService.getCommentList(paging.getOffset(), paging.getNumPerPage(), cvo);
		
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		
		return mv;
	}
	
	@PostMapping("/comment/detail")
	public ModelAndView getCommentDetail(String idx) {
		ModelAndView mv = new ModelAndView();
		CommentVO cvo = commentService.getCommentDetail(idx);
		mv.addObject("cvo", cvo);
		return mv;
	}
	
	@PostMapping("/comment/insert")
	public ModelAndView getCommentInsert(CommentVO cvo) {
		ModelAndView mv = new ModelAndView();
		commentService.getCommentInsert(cvo);
		return mv;
	}
	
	@PostMapping("/comment/update")
	public ModelAndView getCommentUpdate(CommentVO cvo) {
		ModelAndView mv = new ModelAndView();
		commentService.getCommentUpdate(cvo);
		return mv;
	}
	
	@PostMapping("/comment/delete")
	public ModelAndView getCommentDelete(String idx) {
		ModelAndView mv = new ModelAndView();
		commentService.getCommentDelete(idx);
		return mv;
	}
	
}
