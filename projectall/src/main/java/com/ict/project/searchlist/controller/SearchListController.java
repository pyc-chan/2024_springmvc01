package com.ict.project.searchlist.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.comm.Paging;
import com.ict.project.comm.PagingService;
import com.ict.project.comm.PerPageConstant;
import com.ict.project.searchlist.service.SearchListService;
import com.ict.project.searchlist.vo.TreeVO;

@Controller
public class SearchListController {
	// search / sub3-3
	@Autowired
	private SearchListService searchListService;
	
	@Autowired
	private PagingService pagingService;
	
	
	
	// 리스트 불러오기(페이징)
	@RequestMapping("/tree/arealist")
	public ModelAndView getAreaList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("search/sub3-3");
		
		int count = searchListService.getAreaCount();
		String cPage = request.getParameter("cPage");
		PerPageConstant perPageConstant = new PerPageConstant();
		int perPage = perPageConstant.getTreepage();
		
		Paging paging = pagingService.pagingservice(count, cPage, perPage);
		
		// DB 갔다가 오기 
		List<TreeVO> list = searchListService.getAreaList(paging.getOffset(), paging.getNumPerPage());
		
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("cmd", "/tree/arealist");
		return mv;

	}
	
	// 리스트 (지도)
	@RequestMapping("/tree/statlist")
	public ModelAndView getStatList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("search/sub3-3");
		
		int count = searchListService.getStatCount();
		String cPage = request.getParameter("cPage");
		PerPageConstant perPageConstant = new PerPageConstant();
		int perPage = perPageConstant.getTreemappage();
		
		Paging paging = pagingService.pagingservice(count, cPage, perPage);
		
		// DB 갔다가 오기 
		List<TreeVO> list = searchListService.getStatList(paging.getOffset(), paging.getNumPerPage());
		
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("cmd", "/tree/statlist");
		return mv;
		
	}
}
