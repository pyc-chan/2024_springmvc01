package com.ict.guestbook2.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.guestbook2.service.GuestBook2Service;
import com.ict.guestbook2.vo.GuestBook2VO;

@Controller
public class GuestBook2Controller {
	
	@Autowired
	private GuestBook2Service guestBook2Service;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/gb2_list")
	public ModelAndView guestBook2List() {
		ModelAndView mv = new ModelAndView("guestbook2/list");
		List<GuestBook2VO> gb2_list = guestBook2Service.getGuestBook2List();
		mv.addObject("gb2_list",gb2_list);
		
		return mv;
	}
	
	@GetMapping("/gb2_write")
	public ModelAndView guestBook2Write() {
		return new ModelAndView("guestbook2/write");
	}
	
	
	// 파라미터를 받을때 어노테이션, vo로 받을수 있다
	@GetMapping("/gb2_detail")
	public ModelAndView guestBook2Detail(@RequestParam("gb2_idx") String gb2_idx) {
		ModelAndView mv = new ModelAndView("guestbook2/detail");
		GuestBook2VO gb2_vo = guestBook2Service.getGuestBook2Detail(gb2_idx);
		if(gb2_vo != null) {
			mv.addObject("gb2_vo",gb2_vo);
			return mv;
		} else {
			mv.setViewName("guestbook2/error");
			return mv;
		}
	}
	
	@PostMapping("/gb2_write_ok")
	public ModelAndView guestBook2WriteOK(GuestBook2VO gb2_vo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/gb2_list");
			// 파일 정보
			// System.out.println("파일 정보 : "+gb2_vo.getGb2_file_name().getOriginalFilename());
			
			// 써머노트 정보까지
			// System.out.println("써머노트 정보 : "+gb2_vo.getGb2_content());
			
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = gb2_vo.getGb2_file_name();
			
			if(file.isEmpty()) {
				gb2_vo.setGb2_f_name("");
			} else {
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + file.getOriginalFilename();
				gb2_vo.setGb2_f_name(f_name);
				file.transferTo(new File(path,f_name));
			}
			
			// 비밀번호 암호화
			String pwd = passwordEncoder.encode(gb2_vo.getGb2_pw());
			gb2_vo.setGb2_pw(pwd);
			
			int result = guestBook2Service.getGuestBook2Insert(gb2_vo);
			
			if (result>0) {
				return mv;
			}
			
			
			return new ModelAndView("guestbook2/error");
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("guestbook2/error");
		}
		
	}
	
	
}
