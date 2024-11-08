package com.ict.project.popup.controller;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.popup.service.FileService;
import com.ict.project.popup.service.PopupService;
import com.ict.project.popup.vo.PopupVO;

@Controller
public class PopupController {
	
	@Autowired FileService fileService;
	
	@Autowired
	private PopupService popupService;
	
	// 삽입
	@PostMapping("/popinsert")
	public ModelAndView popupInsert(HttpServletRequest request ,PopupVO pvo) {
		ModelAndView mv = new ModelAndView();
		// 파일 업로드
		fileService.fileUpload(request, pvo);
	    // DB에 저장
		int result = popupService.getPopInsert(pvo);
		if(result >0) {
			request.getSession().setAttribute("insertok", "ok");
		}else {
			request.getSession().setAttribute("insertok", "fail");
		}
		mv.setViewName("redirect:/poplist");
		return mv;
		
	}
	
	// 리스트 출력
	@RequestMapping("/poplist")
	public ModelAndView popupList() {
		ModelAndView mv = new ModelAndView();
		List<PopupVO> list = popupService.getPopList();
		mv.addObject("list", list);
		mv.setViewName("pop/list");
		return mv;
	}
	
	// 상세보기
	@RequestMapping("/popdetail")
	public ModelAndView popupDetail(String pop_idx) {
		ModelAndView mv = new ModelAndView();
		PopupVO pvo = popupService.getPopDetail(pop_idx);
		mv.addObject("pvo", pvo);
		mv.setViewName("pop/detail");
		
		return mv;
	}
	
	// 업데이트
	@PostMapping("/popupdate")
	public ModelAndView popupUpdate(HttpServletRequest request ,PopupVO pvo) {
		ModelAndView mv = new ModelAndView();
		PopupVO pvodb = popupService.getPopDetail(pvo.getPop_idx());
		pvo.setOld_pic(pvodb.getPop_pic());
		fileService.fileUpdate(request, pvo);
		
		int result = popupService.getPopUpdate(pvo);
		if(result>0) {
			request.getSession().setAttribute("updateok", "ok");
		}else {
			request.getSession().setAttribute("updateok", "fail");
		}
		mv.setViewName("redirect:/popdetail?pop_idx="+pvo.getPop_idx());
		return mv;
	}
	
	// 삭제
	@PostMapping("/popdelete")
	public ModelAndView popDelete(HttpServletRequest request, PopupVO pvo) {
		ModelAndView mv = new ModelAndView();
		int result = popupService.getPopDelete(pvo);
		if(result>0) {
			request.getSession().setAttribute("deleteok", "ok");
		}else {
			request.getSession().setAttribute("deleteok", "fail");
		}
		mv.setViewName("redirect:/poplist");
		return mv;
	}
}
