package com.ict.project.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.admin.service.AdminService;
import com.ict.project.comm.Paging;
import com.ict.project.comm.PagingService;
import com.ict.project.comm.PerPageConstant;
import com.ict.project.comment.service.CommentService;
import com.ict.project.comment.vo.CommentVO;
import com.ict.project.fna.service.FnaService;
import com.ict.project.fna.vo.FnaVO;
import com.ict.project.login.service.LoginService;
import com.ict.project.login.vo.LoginVO;
import com.ict.project.qna.service.QnaService;
import com.ict.project.qna.vo.QnaVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private PagingService pagingService;
	
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
	
	// 유저 탈퇴
	@PostMapping("/admin/userdelete")
	public ModelAndView userDelete(LoginVO lvo) {
		ModelAndView mv = new ModelAndView("");
		LoginService loginad = adminService.loginService();
		loginad.logindelete(lvo);
		
		return mv;
	}
	
	// 유저
	@PostMapping("/admin/userupdate")
	public ModelAndView userUpdate(LoginVO lvo) {
		ModelAndView mv = new ModelAndView("");
		LoginService loginad = adminService.loginService();
		loginad.update(lvo);
		
		return mv;
	}
	
	// 
	@PostMapping("/admin/userinsert")
	public ModelAndView userInsert(LoginVO lvo) {
		ModelAndView mv = new ModelAndView("");
		LoginService loginad = adminService.loginService();
		loginad.loginInsert(lvo);
		return mv;
	}
	
	// qna 목록
	@GetMapping("/admin/qnalist")
	public ModelAndView qnaList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("");
		QnaService qnaad = adminService.qnaService();
		
		int count = qnaad.getQnaCount();
		String cPage = request.getParameter("cPage");
		PerPageConstant constant = new PerPageConstant();
		int perpage = constant.getAdminqnaspage();
		
		Paging paging = pagingService.pagingservice(count , cPage, perpage);
		int offset = paging.getOffset();
		int limit = paging.getNumPerPage();
		
		List<QnaVO> list = qnaad.getQnaList(offset, limit);
		mv.addObject("list", list);
		
		return mv;
	}
	
	// qna 상세페이지
	@PostMapping("/admin/qnadetail")
	public ModelAndView qnaDetail(String q_idx) {
		ModelAndView mv = new ModelAndView("");
		QnaService qnaad = adminService.qnaService();
		QnaVO qvo = qnaad.getQnaDetail(q_idx);
		mv.addObject("qvo",qvo);
		
		return mv;
	}
	
	@GetMapping("/admin/fnalist")
	public ModelAndView fnaList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("");
		FnaService fnaad = adminService.fnaService();
		
		int count = fnaad.getFnaCount();
		String cPage = request.getParameter("cPage");
		PerPageConstant constant = new PerPageConstant();
		int perpage = constant.getFnapage();
		
		Paging paging = pagingService.pagingservice(count , cPage, perpage);
		int offset = paging.getOffset();
		int limit = paging.getNumPerPage();
		
		List<FnaVO> list = fnaad.getFnaList(offset, limit);
		mv.addObject("list", list);
		
		return mv;
	}
	@PostMapping("/admin/fnadetail")
	public ModelAndView fnaDetail(String f_idx) {
		ModelAndView mv = new ModelAndView("");
		FnaService fnaad = adminService.fnaService();
		FnaVO fvo = fnaad.getFnaDetail(f_idx);
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
	public ModelAndView commentList(HttpServletRequest request, CommentVO cvo) {
		ModelAndView mv = new ModelAndView("");
		CommentService commentad = adminService.commentService();
		
		int count = commentad.getCommentCount();
		String cPage = request.getParameter("cPage");
		PerPageConstant constant = new PerPageConstant();
		int perpage = constant.getFnapage();
		
		Paging paging = pagingService.pagingservice(count , cPage, perpage);
		int offset = paging.getOffset();
		int limit = paging.getNumPerPage();
		
		List<CommentVO> list = commentad.getCommentList(offset, limit, cvo);
		mv.addObject("list", list);
		
		return mv;
	}
	@PostMapping("/admin/commentdetail")
	public ModelAndView commentDetail(String c_idx) {
		ModelAndView mv = new ModelAndView("");
		CommentService commentad = adminService.commentService();
		CommentVO cvo = commentad.getCommentDetail(c_idx);
		mv.addObject("cvo",cvo);
		
		return mv;
	}
}
