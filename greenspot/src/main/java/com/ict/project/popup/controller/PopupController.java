package com.ict.project.popup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.popup.service.PopupService;
import com.ict.project.popup.vo.PopupVO;

@Controller
public class PopupController {
	
	@Autowired
	private PopupService popupService;
	
	
	@PostMapping("/popinsert")
	public ModelAndView popupInsert(PopupVO pvo) {
		ModelAndView mv = new ModelAndView();
		// popupService.
		
		
		return mv;
	}
	
	
	
	
}
