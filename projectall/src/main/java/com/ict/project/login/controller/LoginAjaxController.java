package com.ict.project.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ict.project.admin.service.AdminService;
import com.ict.project.login.service.LoginService;
import com.ict.project.login.vo.LoginVO;


@RestController
public class LoginAjaxController {
	
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private AdminService adminService;
	
	// 아이디 중복체크
	@RequestMapping(value = "/idchk" , produces = "application/json; charset=utf-8")
	@ResponseBody
	public String idChk(String u_id) {
		String result = "false";
		String idchk = loginService.idChk(u_id);
		int adminchk = adminService.adminIdChk(u_id); 
		if (idchk == null) {
			if (adminchk == 0) {
				result = "true";
			}
		}
		return result;
	}
	
	
	@RequestMapping("/detail")
	@ResponseBody
	public LoginVO getdetail(String u_id) {
		LoginVO lvo = loginService.getDetail(u_id);
		
		return lvo;
	}
	
}
