package com.ict.edu01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// 어노테이션으로 @Controller를 하면 자동으로 Spring에서 Controller로 인식한다.

@Controller
public class Start3Controller {
	// URL 매핑이란
	// 옛날 방식
	// @RequestMapping(value = "URL", method = RequestMethod.GET)
	/* 어노테이션
	 * @RequestMapping("URL")
	 * 
	 * @GetMapping("URL")
	 * 
	 * @PostMapping("URL")
	 */
	
	// 해당 메서드는 URL 매핑이 와야 실행된다.
	// exec(인자) : 인자는 필요할때만 사용하면 된다.
	// @RequestMapping("/start3")
	// @PostMapping("/start3") // a 링크는 get 방식이므로 오류 발생
	@GetMapping("/start3")
	public ModelAndView exec(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("day01/result3");
		mv.addObject("city","서울");
		return mv;
	}
}
