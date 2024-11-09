package com.ict.project.inquery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.crud.service.CrudService;
import com.ict.project.crud.vo.CrudVO;

@Controller
public class CrudController {
	
	@Autowired
	private CrudService crudService;
	
	
	public ModelAndView getCrudList(){
		ModelAndView mv = new ModelAndView();
		
		
		
		return mv;
	}
	
	
	public ModelAndView getCrudDetail(String idx) {
		ModelAndView mv = new ModelAndView();
		
		
		
		
		return mv;
	}
	
	public ModelAndView getCrudInsert(CrudVO cvo) {
		ModelAndView mv = new ModelAndView();
		
		
		return mv;
	}
	
	public ModelAndView getCrudUpdate(CrudVO cvo) {
		ModelAndView mv = new ModelAndView();
		
		
		return mv;
	}
	
	public ModelAndView getCrudDelete(String idx) {
		ModelAndView mv = new ModelAndView();
		
		
		return mv;
	}
	
}
