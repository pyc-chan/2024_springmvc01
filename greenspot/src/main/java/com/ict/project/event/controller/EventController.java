package com.ict.project.event.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.comm.Paging;
import com.ict.project.comm.PagingService;
import com.ict.project.comm.PerPageConstant;
import com.ict.project.event.service.EventService;
import com.ict.project.event.vo.EventVO;

@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private PagingService pagingService;
	
	@RequestMapping("ev_list")
	public ModelAndView getEventList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("search/sub4-2");
		
		// pagingservice 메서드에 넣을 값
		int count = eventService.getTotalCount();
		String cPage = request.getParameter("cPage");
		PerPageConstant pageConstant = new PerPageConstant();
		int perpage = pageConstant.getEventpage();
				
		// 페이징 기법
		Paging paging = pagingService.pagingservice(count, cPage, perpage);
		
		// DB 갔다가 오기 
		List<EventVO> list = eventService.getEventList(paging.getOffset(), paging.getNumPerPage());
		
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		return mv;
	}
	
	
	@RequestMapping("ev_search")
	public ModelAndView getEventSearch(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		
		
		return mv;
	}
}
