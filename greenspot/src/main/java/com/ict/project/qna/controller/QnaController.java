package com.ict.project.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.comm.Paging;
import com.ict.project.comm.PagingService;
import com.ict.project.comm.PerPageConstant;
import com.ict.project.qna.service.QnaFileService;
import com.ict.project.qna.service.QnaService;
import com.ict.project.qna.vo.QnaVO;

@Controller
public class QnaController {
	
	@Autowired
	private QnaFileService qnaFileService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private PagingService pagingService;
	
	
	@GetMapping("/qna/list")
	public ModelAndView getQnaList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("qna/list");
		
		int count = qnaService.getQnaCount();
		// pagingservice 메서드에 넣을 값
		String cPage = request.getParameter("cPage");
		PerPageConstant pageConstant = new PerPageConstant();
		int perpage = pageConstant.getQnapage();
				
		// 페이징 기법 설정
		Paging paging = pagingService.pagingservice(count, cPage, perpage);
		// DB 갔다가 오기 
		List<QnaVO> list = qnaService.getQnaList(paging.getOffset(), paging.getNumPerPage());
		
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		
		return mv;
	}
	
	@PostMapping("/qna/detail")
	public ModelAndView getQnaDetail(String q_idx) {
		ModelAndView mv = new ModelAndView("qna/detail");
		QnaVO fvo = qnaService.getQnaDetail(q_idx);
		mv.addObject("fvo", fvo);
		return mv;
	}
	
	@PostMapping("/qna/insert")
	public ModelAndView getQnaInsert(QnaVO qvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		// 파일 업로드
		qnaFileService.qnaFileUpload(request, qvo);
		// DB에 저장
		qnaService.getQnaInsert(qvo);
		mv.setViewName("redirect:/qna/list");
		return mv;
		
	}
	
	@PostMapping("/qna/update")
	public ModelAndView getQnaUpdate(QnaVO qvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		QnaVO qvodb = qnaService.getQnaDetail(qvo.getQ_idx());
		qvo.setQ_oldname(qvodb.getQ_filename());
		
		if(qvo.getQ_file()!=null) {
			qnaFileService.qnaFileUpdate(request, qvo);
		}else {
			qvo.setQ_filename(qvo.getQ_oldname());
		}
		qnaService.getQnaUpdate(qvo);
		mv.setViewName("redirect:/qna/list");
		
		return mv;
	}
	
	@PostMapping("/qna/delete")
	public ModelAndView getQnaDelete(String q_idx) {
		ModelAndView mv = new ModelAndView("redirect:/poplist");
		qnaService.getQnaDelete(q_idx);
		return mv;
	}
	
}
