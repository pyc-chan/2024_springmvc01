package com.ict.project.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.login.service.LoginService;
import com.ict.project.login.vo.LoginVO;
import com.ict.project.login.controller.Common;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 로그인 화면 이동
	@GetMapping("/loginGo")
	public ModelAndView loginGo() {
		ModelAndView mv = new ModelAndView("login/login");
		return mv;
	}
	
	// 아이디 찾기 이동
	@GetMapping("/idFindGo")
	public ModelAndView idFindGo() {
		ModelAndView mv = new ModelAndView("login/idfind");
		return mv;
	}
	
	// 비밀번호 찾기 이동	
	@GetMapping("/pwFindGo")
	public ModelAndView pwFindGo() {
		ModelAndView mv = new ModelAndView("login/pwfind");
		return mv;
	}
	
	// 회원가입 이동	
	@GetMapping("/joinGo")
	public ModelAndView joinGo() {
		ModelAndView mv = new ModelAndView("login/join");
		return mv;
	}
	
	// 메인화면 이동	
	@GetMapping("/mainGo")
	public ModelAndView mainGo() {
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
	
	// 패스워드 찾기
	@GetMapping("/pwFind")
	public ModelAndView pwFind(HttpServletRequest request, LoginVO lvo) {
		ModelAndView mv = new ModelAndView("");
		loginService.pwFind(lvo);
		return mv;
	}
	
	// 회원가입 이메일 확인화면 이동
	@RequestMapping("/emailjoin")
	public ModelAndView emailJoin(ModelAndView mv) {
		mv.setViewName("login/emailjoin");
		return mv;
	}
	
	// 아이디 찾기 화면
	@RequestMapping("/emailid")
	public ModelAndView emailId(ModelAndView mv) {
		mv.setViewName("login/emailid");
		return mv;
	}
	
	// 회원가입
	@RequestMapping("/joinOK")
	public ModelAndView joinTry(LoginVO lvo) {
		ModelAndView mv = new ModelAndView();
		try {
			// 비밀번호 암호화
			lvo.setU_pw(passwordEncoder.encode(lvo.getU_pw()));
			System.out.println(lvo.getU_pw());
			// DB에 회원정보 입력
			int result = loginService.joinOK(lvo);
			
			System.out.println(result);
			// 정보 삽입 성공시
			if(result > 0) {
				// 회원가입 완료창으로 이동
				mv.setViewName("login/success");
			}
			else {
				// 임시파일로 이동
				mv.setViewName("login/tmp");
			}
			return mv;
			
		} catch (Exception e) {
			System.out.println(e);
			mv.setViewName("login/tmp");
			return mv;
			
		}
		
	}
	
	// 회원가입 이메일 체크
	@PostMapping("/emailchk")
	public ModelAndView emailChk(LoginVO lvo, @RequestParam("u_emailback") String back, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		// 이메일 뒷자리 + 앞자리 
		String u_em = lvo.getU_em()+"@"+back; 
		lvo.setU_em(u_em);
		request.getSession().setAttribute("u_em", u_em);
		request.getSession().setAttribute("lvo", lvo);
		System.out.println(lvo);
		request.getSession().setAttribute("cmd", "emailjoin");
		mv.setViewName("redirect:/emailsend");
		return mv;
	}
	
	// 아이디찾기 이메일 체크
	@PostMapping("/idFind")
	public ModelAndView idFind(HttpServletRequest request, String u_em) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/emailsend");
		request.getSession().setAttribute("cmd", "emailid");
		request.getSession().setAttribute("u_em", u_em);
		return mv;
	}
	
	// 아이디찾기 확인 후
	@PostMapping("/idfindok")
	public ModelAndView idFindOK(String u_em) {
		ModelAndView mv = new ModelAndView();
		List<String> ids = loginService.getId(u_em);
		mv.addObject(ids);
		mv.setViewName("login/idfindok");
		return mv;
	}
	
	
	// 로그인 시도
	@PostMapping("/loginok")
	public ModelAndView loginOK(LoginVO lvo ,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// DB에서 로그인 정보 가져옴
		LoginVO lvo2 = loginService.loginOK(lvo.getU_id());
		// 아이디가 DB에 없을때
		if(lvo2 == null) {
			// loginok 값 fail
			session.setAttribute("loginok", "fail");
			// 로그인창으로 이동
			mv.setViewName("redirect:/loginGo");
		}else {
			// 비밀번호가 맞을때
			if(passwordEncoder.matches(lvo.getU_pw(), lvo2.getU_pw())) {
				// loginok값 ok
				session.setAttribute("loginok", "ok");
				// 세션에 정보 담기
				session.setAttribute("lvo", lvo2);
				// 메인으로 이동
				mv.setViewName("redirect:/mainGo");
			}
			// 비밀번호가 틀렸을때
			else {
				// loginok값 fail
				session.setAttribute("loginok", "fail");
				// 로그인창으로 이동
				mv.setViewName("redirect:/loginGo");
			}
		}
		return mv;
	}
	
	

}
