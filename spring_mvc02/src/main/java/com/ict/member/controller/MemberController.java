package com.ict.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.member.service.MemberService;
import com.ict.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/member")
	public ModelAndView getMember() {
		ModelAndView mv = new ModelAndView("member/admin");
		return mv;
	}
	
	
	@PostMapping("/id_login")
	public ModelAndView getMemberLogin(MemberVO mvo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			MemberVO mvo2 = memberService.getPwChk(mvo.getM_id());
			if(mvo2==null) {
				mv.setViewName("sns/login_error");
			}else {
				if(passwordEncoder.matches(mvo.getM_pw(), mvo2.getM_pw())) {
					session.setAttribute("loginchk", "ok");
					
					if(mvo.getM_id() == "admin") {
						session.setAttribute("admin", "ok");
					}
					session.setAttribute("mvo", mvo2);
					mv.setViewName("redirect:/shop");
				} else {
					// 실패
					mv.setViewName("sns/login_error");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	
	
	
}
