package com.ict.edu01;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class Start2Controller implements Controller {
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();

		// 방법1)
		// mv.setViewName(뷰네임 = 되돌아갈 jsp이름 = "result1");
		mv.setViewName("result2");
		
		// 방법2)
		// ModelAndView mv = new ModelAndView("result1");
		
		String[] dogName = {"땅콩이", "진돌이", "말복이", "하오"};
		mv.addObject("dogName",dogName);
		
		ArrayList<String> catName = new ArrayList<String>();
		catName.add("뽀미");
		catName.add("나비");
		catName.add("달콩이");
		catName.add("까망이");
		mv.addObject("catName", catName);
		
		return mv;
	}
}
