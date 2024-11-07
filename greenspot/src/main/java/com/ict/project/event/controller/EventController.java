package com.ict.project.event.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.comm.TreeSearchPaging;
import com.ict.project.event.service.EventService;
import com.ict.project.event.vo.EventVO;

@Controller
public class EventController {
	
	@Autowired
	private TreeSearchPaging paging;
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping("ev_list")
	public ModelAndView getEventList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("search/sub4-2");
		int count = eventService.getTotalCount();
		paging.setTotalRecord(count);
		
		
		if(paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		}else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if(paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1 );
			}
		}
			
		String cPage = request.getParameter("cPage");
		
		if(cPage == null) {
			paging.setNowPage(1);
		}else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage()-1));
		
		
		paging.setBeginBlock(
				(int)(((paging.getNowPage()-1) / paging.getPagePerBlock()) * paging.getPagePerBlock()+1));
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() -1);
		
		if(paging.getEndBlock() >  paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		
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
