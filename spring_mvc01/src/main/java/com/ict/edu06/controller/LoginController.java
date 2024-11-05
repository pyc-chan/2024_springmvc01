package com.ict.edu06.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.edu06.service.LoginService;
import com.ict.edu06.vo.LoginVO;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	// 로그인 폼
	@GetMapping("/loginForm")
	public ModelAndView getLogInForm() {
		return new ModelAndView("day06/login_loginForm");
	}
	
	// 회원가입 폼
	@GetMapping("/login_join_form")
	public ModelAndView getLogInJoinForm() {
		return new ModelAndView("day06/login_joinForm");
	}
	
	// 회원가입하기
	@PostMapping("/login_join_ok")
	public ModelAndView getLoginJoinOK(LoginVO lvo) {
		ModelAndView mv = new ModelAndView("day06/login_loginForm");
		try {
			// 비번 암호화
			String m_pw = passwordEncoder.encode(lvo.getM_pw());
			lvo.setM_pw(m_pw);
			
			int result = loginService.LoginJoin(lvo);
			if(result>0) {
				mv.addObject("result","1");
			} else {
				mv.addObject("result","0");
			}
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("result","0");
		}
		
		return mv;
	}
	
	// 로그인 하기
	@PostMapping("/login_login")
	public ModelAndView getLoginOK(LoginVO lvo) {
		ModelAndView mv = new ModelAndView();
		try {
			// 1. 아이디 가지고 DB 갔다오기
			LoginVO loginVO = loginService.LoginChk(lvo);

			if (loginVO != null) {
				// 2. 사용자가 입력한 암호를 추출
				String userM_pw = lvo.getM_pw();

				// 3. 두 암호를 비교해서 같으면 성공, 다르면 실패
				// passwordEncoder.matches(암호화 안된 것, 암호화 된것) => 일치하면 true, 아니면 false
				if (passwordEncoder.matches(userM_pw, loginVO.getM_pw())) {
					mv.addObject("loginchk", "1");
					mv.setViewName("index");
				} else {
					mv.addObject("loginchk", "아이디나 비밀번호가 틀립니다.");
					mv.setViewName("day06/login_loginForm");
				}
			} else {
				mv.addObject("loginchk", "아이디나 비밀번호가 틀립니다.");
				mv.setViewName("day06/login_loginForm");
			}
			return mv;

		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("loginchk", "아이디나 비밀번호가 틀립니다.");
			
			return mv;
		}
	}
	
	
	
	// 로그인 하기
	
	
}
