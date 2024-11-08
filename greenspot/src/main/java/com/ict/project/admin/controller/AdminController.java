package com.ict.project.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.admin.service.AdminService;
import com.ict.project.login.service.LoginService;
import com.ict.project.login.vo.LoginVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@GetMapping("/admin1")
	public ModelAndView adminGo1(){
		return new ModelAndView("admin/admin1"); 
	}
	
	@GetMapping("/admin2")
	public ModelAndView adminGo2(){
		return new ModelAndView("admin/admin1-2"); 
	}
	
	@GetMapping("/admin3")
	public ModelAndView adminGo3(){
		return new ModelAndView("admin/admin1-3"); 
	}
	
	@GetMapping("/admin/userlist")
	public ModelAndView userList() {
		ModelAndView mv = new ModelAndView();
		LoginService loginad = adminService.loginService();
		List<LoginVO> list = loginad.getList();
		mv.addObject("list",list);
		
		return mv;
	}
	
	@GetMapping("/admin/")
}
