package com.ict.edu05.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.edu05.service.EmpService;
import com.ict.edu05.vo.EmpVO;

@Controller
public class EmpController {
	
	@Autowired
	private EmpService empService;
	
	
	@RequestMapping("/emp")
	public ModelAndView emp_form() {
		return new ModelAndView("day05/emp_form");
	}
	
	@PostMapping("/emp_getlist")
	public ModelAndView emp_list() {
		try {
			ModelAndView mv = new ModelAndView("day05/emp_list");
			List<EmpVO> list = empService.getList();
			mv.addObject("list", list);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	@PostMapping("/emp_search")
	public ModelAndView emp_search(@RequestParam("deptno") String deptno) {
		try {
			ModelAndView mv = new ModelAndView("day05/emp_search");
			List<EmpVO> list = empService.getSearch(deptno);
			mv.addObject("list",list);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	// 파라미터가 vo에 존재하지 않을 경우 처리 방법 : 
	// 1. vo 넣는다.
	// 2. 별도로 받아서 나중에 Map으로 처리
	/* @PostMapping("/emp_dynamic_search")
	public ModelAndView emp_dynamic_search(EmpVO empvo) {
		try {
			ModelAndView mv = new ModelAndView("day05/emp_dynamic");
			List<EmpVO> list = empService.getSearch(empvo);
			mv.addObject("list",list);
			mv.addObject("idx", empvo.getIdx());
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	*/
	// 다음 jsp에 받은 idx를 그대로 넘기기 위해서 => @ModelAttribute()
	@PostMapping("/emp_dynamic_search")
	public ModelAndView emp_dynamic_search(
		@ModelAttribute("idx") String idx,
		@RequestParam("keyword") String keyword){
		try {
			ModelAndView mv = new ModelAndView("day05/emp_dynamic");
			List<EmpVO> list = empService.getSearch(idx, keyword);
			mv.addObject("list",list);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
}
