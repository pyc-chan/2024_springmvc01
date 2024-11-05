package com.ict.sns.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class KakaoMapController {

	@GetMapping("/kekao_map01")
	public ModelAndView kakaoMap01() {
		return new ModelAndView("sns/kakao_map01");
	}
	@GetMapping("/kekao_map02")
	public ModelAndView kakaoMap02() {
		return new ModelAndView("sns/kakao_map02");
	}
	@GetMapping("/kekao_map03")
	public ModelAndView kakaoMap03() {
		return new ModelAndView("sns/kakao_map03");
	}
	@GetMapping("/kekao_map04")
	public ModelAndView kakaoMap04() {
		return new ModelAndView("sns/kakao_map04");
	}
}
