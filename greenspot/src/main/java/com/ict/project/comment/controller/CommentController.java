package com.ict.project.comment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.comm.Paging;
import com.ict.project.comment.service.CommentService;
import com.ict.project.comment.vo.CommentVO;


@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private Paging paging;
	
	
	@PostMapping("comment/list")
	public ModelAndView getCommentList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		

		int count = commentService.getCommentCount();
		// 총 데이터 갯수
		paging.setTotalRecord(count);
		
		// 총 데이터 수가 페이지당 데이터 수보다 작으면
		if(paging.getTotalRecord() <= paging.getNumPerPage()) {
			// 최대 페이지를 1로 만듬
			paging.setTotalPage(1);
		}else {
			// 총합 페이지 구하기
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			// 마지막 페이지에 페이지당 게시물보다 적은 게시물이 있으면
			if(paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				// 총합 페이지수를 하나 더 늘린다.
				paging.setTotalPage(paging.getTotalPage() + 1 );
			}
		}
		// cpage는 페이지값을 파라미터로 받는값
		String cPage = request.getParameter("cPage");
		// cpage값이 없으면
		if(cPage == null) {
			// 현재 페이지를 1로 설정
			paging.setNowPage(1);
		}else {
			// 현재 페이지를 cpage 설정
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		// 현재 블럭을 구한다
		paging.setNowBlock((paging.getNowPage()-1)/paging.getPagePerBlock()+1);
		
		// offset(DB에서 값을 가져올때 지나간 데이터(현재 2페이지일때 1페이지데이터)를 넘기는 갯수
		// 페이지당 데이터 수와 현재 페이지 -1 만큼 offset을 설정 
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage()-1));
		
		// 시작 블럭 세팅
		paging.setBeginBlock(
				// 현재 블럭의 index값에 블럭당 페이지값을 곱해주고 그다음에 1을 더한다.
				(int)((paging.getNowBlock()-1) * paging.getPagePerBlock()+1));
		// 마지막 블럭은 시작블럭에 블럭당 페이지수를 더하고 1을 빼준다.
		paging.setEndBlock(paging.getNowBlock()*paging.getPagePerBlock());
		
		// 만약 마지막 블럭이 총 페이지보다 크면
		if(paging.getEndBlock() >  paging.getTotalPage()) {
			// 마지막 블럭을 총 페이지값으로 한다.
			paging.setEndBlock(paging.getTotalPage());
		}
		// DB 갔다가 오기 
		List<CommentVO> list = commentService.getCommentList(paging.getOffset(), paging.getNumPerPage());
		
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		
		
		return mv;
	}
	
	@PostMapping("comment/detail")
	public ModelAndView getCommentDetail(String idx) {
		ModelAndView mv = new ModelAndView();
		CommentVO fvo = commentService.getCommentDetail(idx);
		mv.addObject("fvo", fvo);
		return mv;
	}
	
	@PostMapping("comment/insert")
	public ModelAndView getCommentInsert(CommentVO fvo) {
		ModelAndView mv = new ModelAndView();
		commentService.getCommentInsert(fvo);
		return mv;
	}
	
	@PostMapping("comment/update")
	public ModelAndView getCommentUpdate(CommentVO fvo) {
		ModelAndView mv = new ModelAndView();
		commentService.getCommentUpdate(fvo);
		return mv;
	}
	
	@PostMapping("comment/delete")
	public ModelAndView getCommentDelete(String idx) {
		ModelAndView mv = new ModelAndView();
		commentService.getCommentDelete(idx);
		return mv;
	}
	
}
