package com.ict.project.sub4_2.controller;

import java.io.FileReader;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ict.project.comm.Paging;
import com.ict.project.comm.PagingService;
import com.ict.project.comm.PerPageConstant;
import com.ict.project.sub4_2.service.Sub4_2Service;
import com.ict.project.sub4_2.vo.Sub4_2VO;

@Controller
public class Sub4_2Controller {
	
	@Autowired
	private PagingService pagingService;
	
	@Autowired
	private Sub4_2Service sub4_2Service;
	
	
	@RequestMapping("/sub_page4-2")
	public ModelAndView getJsonFile(String cPage) {
		ModelAndView mv = new ModelAndView("sub/sub4-2");
		Gson gson = new Gson();
		try {
			FileReader reader = new FileReader("json파일경로");
			List<Sub4_2VO> fulllist = gson.fromJson(reader, new TypeToken<List<Sub4_2VO>>(){}.getType());
			
			PerPageConstant perPageConstant = new PerPageConstant();
			
			// 페이징 반환
			Paging paging = pagingService.pagingservice(fulllist.size(), cPage, perPageConstant.getEventpage());
			mv.addObject("paging", paging);
			
			// 리스트 반환
			List<Sub4_2VO> list = sub4_2Service.getSubList(fulllist, paging.getOffset(), paging.getNumPerPage());
			if(list != null) {
				mv.addObject("list", list);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return mv;
	}
	
}
