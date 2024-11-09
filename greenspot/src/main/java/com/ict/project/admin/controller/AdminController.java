package com.ict.project.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.admin.service.AdminService;
import com.ict.project.fna.service.FnaService;
import com.ict.project.fna.vo.FnaVO;
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
			ModelAndView mv = new ModelAndView("");
			LoginService loginad = adminService.loginService();
			List<LoginVO> list = loginad.getList();
			mv.addObject("list",list);
			
			return mv;
		}
	@PostMapping("/admin/userdetail")
	public ModelAndView userDetail(String u_idx) {
		ModelAndView mv = new ModelAndView("");
		LoginService loginad = adminService.loginService();
		LoginVO lvo = loginad.getDetail(u_idx);
		mv.addObject("lvo",lvo);
		
		return mv;
	}
	@PostMapping("/admin/userdelete")
	public ModelAndView userDelete(LoginVO lvo) {
		ModelAndView mv = new ModelAndView("");
		LoginService loginad = adminService.loginService();
		loginad.logindelete(lvo);
		
		return mv;
	}
	@PostMapping("/admin/userupdate")
	public ModelAndView userUpdate(LoginVO lvo) {
		ModelAndView mv = new ModelAndView("");
		LoginService loginad = adminService.loginService();
		loginad.update(lvo);
		
		return mv;
	}
	@PostMapping("/admin/userinsert")
	public ModelAndView userInsert(LoginVO lvo) {
		ModelAndView mv = new ModelAndView("");
		LoginService loginad = adminService.loginService();
		loginad.loginInsert(lvo);
		return mv;
	}
	
	@GetMapping("/admin/qnalist")
	public ModelAndView qnaList() {
		ModelAndView mv = new ModelAndView("");
		QnaService qnaad = adminService.qnaService();
		List<QnaVO> list = qnaad.getList();
		mv.addObject("list", list);
		
		return mv;
	}
	@PostMapping("/admin/qnadetail")
	public ModelAndView qnaDetail(String q_idx) {
		ModelAndView mv = new ModelAndView("");
		QnaService qnaad = adminService.qnaService();
		QnaVO qvo = qnaad.getDetail(q_idx);
		mv.addObject("qvo",qvo);
		
		return mv;
	}
	
	@GetMapping("/admin/fnalist")
	public ModelAndView fnaList() {
		ModelAndView mv = new ModelAndView("");
		FnaService fnaad = adminService.fnaService();
		List<FnaVO> list = fnaad.getFnaList();
		mv.addObject("list", list);
		
		return mv;
	}
	@PostMapping("/admin/fnadetail")
	public ModelAndView fnaDetail(String f_idx) {
		ModelAndView mv = new ModelAndView("");
		FnaService fnaad = adminService.FnaService();
		FnaVO fvo = fnaad.getDetail(f_idx);
		mv.addObject("fvo",fvo);
		
		return mv;
	}
	
	@GetMapping("/admin/noticelist")
	public ModelAndView noticeList() {
		ModelAndView mv = new ModelAndView("");
		NoticeService noticead = adminService.NoticeService();
		List<NoticeVO> list = noticead.getList();
		mv.addObject("list", list);
		
		return mv;
	}
	@PostMapping("/admin/noticedetail")
	public ModelAndView noticeDetail(String n_idx) {
		ModelAndView mv = new ModelAndView("");
		NoticeService noticead = adminService.NoticeService();
		NoticeVO nvo = noticead.getDetail(n_idx);
		mv.addObject("nvo",nvo);
		
		return mv;
	}
	
	@GetMapping("/admin/commentlist")
	public ModelAndView commentList() {
		ModelAndView mv = new ModelAndView("");
		CommentService commentad = adminService.CommentService();
		List<CommentVO> list = commentad.getList();
		mv.addObject("list", list);
		
		return mv;
	}
	@PostMapping("/admin/commentdetail")
	public ModelAndView commentDetail(String c_idx) {
		ModelAndView mv = new ModelAndView("");
		CommentService commentad = adminService.CommentService();
		CommentVO cvo = commentad.getDetail(c_idx);
		mv.addObject("cvo",cvo);
		
		return mv;
	}
	
	@GetMapping("/admin/freeboardlist")
	public ModelAndView freeboardList() {
		ModelAndView mv = new ModelAndView("");
		FreeboardService freeboardad = adminService.FreeboardService();
		List<FreeboardVO> list = freeboardad.getList();
		mv.addObject("list", list);
		
		return mv;
	}
	@PostMapping("/admin/freeboarddetail")
	public ModelAndView freeboardDetail(String f_idx) {
		ModelAndView mv = new ModelAndView("");
		FreeboardService freeboardad = adminService.FreeboardService();
		FreeboardVO fvo = freeboardad.getDetail(f_idx);
		mv.addObject("fvo",fvo);
		
		return mv;
	}
}
