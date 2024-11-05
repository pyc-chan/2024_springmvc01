package com.ict.edu01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {
	
	@GetMapping("/start5")
	public ModelAndView test01() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("day01/result5");
		mv.addObject("msg","hello");
		return mv;
	}
	
	@GetMapping("/start6")
	public ModelAndView test02(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("day01/result5");
		mv.addObject("msg", "Hi~~");
		return mv;
	}
	
	@GetMapping("/start7")
	public ModelAndView test03(HttpServletRequest request) {
		request.setAttribute("msg", "안녕하세요");
		return new ModelAndView("day01/result5");
	}
	@GetMapping("/start8")
	public ModelAndView test04(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("day01/result8");
		mv.addObject("username",request.getParameter("username"));
		mv.addObject("userage",request.getParameter("userage"));
		return mv;
	}
}
