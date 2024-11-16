package com.ict.project.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.admin.service.AdminService;
import com.ict.project.admin.vo.AdminVO;
import com.ict.project.comm.Paging;
import com.ict.project.comm.PagingService;
import com.ict.project.comm.PerPageConstant;
import com.ict.project.comment.service.CommentService;
import com.ict.project.comment.vo.CommentVO;
import com.ict.project.login.service.LoginService;
import com.ict.project.login.vo.LoginVO;
import com.ict.project.notice.service.NoticeService;
import com.ict.project.notice.vo.NoticeVO;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private PagingService pagingService;
	
	@Autowired
	private CommentService commentService;
	
	// 메인
	@RequestMapping("/mainGo")
	public ModelAndView getMoveMain() {
		return new ModelAndView("index");
	}
	
	// 검색
	@GetMapping("/total_search")
	public ModelAndView getTotalSearch(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("sub/total_search");
		
		String search_name = request.getParameter("search_name");
		
		mv.addObject("search_name", search_name);
		
		return mv;
	}
	
	// 로그아웃
	@RequestMapping("/logoutGo")
	public ModelAndView getLogoutGo() {
		return new ModelAndView("index");
	}
	
	// 마이 페이지
	@RequestMapping("/mypageMain")
	public ModelAndView getMyPageMainGo() {
		return new ModelAndView("sub/mypage_main");
	}
	
	// 마이 페이지 : 내 정보 보기 -> 회원정보 수정
	@RequestMapping("/my_info_mody")
	public ModelAndView getMyInfoModyGo(@ModelAttribute String u_id) {
		ModelAndView mv = new ModelAndView("sub/my_info_mody");
		LoginVO lvo = loginService.getDetail(u_id);
		mv.addObject("lvo", lvo);
		
		return mv;
	}
	
	// 마이 페이지 : 내 정보 보기 -> 회원정보 삭제
	@RequestMapping("/my_info_delete")
	public ModelAndView getMyInfoDeleteGo() {
		return new ModelAndView("sub/my_info_delete");
	}
	
	
	// 1. 공원 찾기
	// sub1-1
	@RequestMapping("/sub1-1")
	public ModelAndView getMoveSub1_1() {
		return new ModelAndView("sub/sub1-1");
	}
	// sub1-2
	@RequestMapping("/sub1-2")
	public ModelAndView getMoveSub1_2() {
		return new ModelAndView("sub/sub1-2");
	}
	
	// sub1-3
	@RequestMapping("/sub1-3")
	public ModelAndView getMoveSub1_3() {
		return new ModelAndView("sub/sub1-3");
	}
	
	// sub1-4
	@RequestMapping("/sub1-4")
	public ModelAndView getMoveSub1_4() {
		return new ModelAndView("sub/sub1-4");
	}
	
	// 2. 가로수길 찾기
	// sub2-1
	@RequestMapping("/sub2-1")
	public ModelAndView getMoveSub2_1() {
		return new ModelAndView("sub/sub2-1");
	}
	// sub2-2
	@RequestMapping("/sub2-2")
	public ModelAndView getMoveSub2_2() {
		return new ModelAndView("sub/sub2-2");
	}
	// sub2-3
	@RequestMapping("/sub2-3")
	public ModelAndView getMoveSub2_3() {
		return new ModelAndView("sub/sub2-3");
	}
	// sub2-4
	@RequestMapping("/sub2-4")
	public ModelAndView getMoveSub2_4() {
		return new ModelAndView("sub/sub2-4");
	}
	
	// 3. 지역 속 보호수
	// sub3-1
	@RequestMapping("/sub3-1")
	public ModelAndView getMoveSub3_1() {
		return new ModelAndView("sub/sub3-1");
	}
	// sub3-2
	@RequestMapping("/sub3-2")
	public ModelAndView getMoveSub3_2() {
		return new ModelAndView("sub/sub3-2");
	}
	// sub3-3
	@RequestMapping("/sub3-3")
	public ModelAndView getMoveSub3_3() {
		return new ModelAndView("sub/sub3-3");
	}
	
	// 4. 녹지 행사
	// sub4-1
	@RequestMapping("/sub4-1")
	public ModelAndView getMoveSub4_1() {
		return new ModelAndView("sub/sub4-1");
	}
	// sub4-2
	@RequestMapping("/sub4-2")
	public ModelAndView getMoveSub4_2() {
		return new ModelAndView("sub/sub4-2");
	}
	
	// 5. 커뮤니티
	// notice
	@RequestMapping("/notice_list")
	public ModelAndView getMoveNotice(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("sub/notice_list");
		

		int count = noticeService.getTotalCount();
		// pagingservice 메서드에 넣을 값
		String cPage = request.getParameter("cPage");
		PerPageConstant pageConstant = new PerPageConstant();
		int perpage = pageConstant.getNoticepage();
				
		// 페이징 기법 설정
		Paging paging = pagingService.pagingservice(count, cPage, perpage);
		
		// DB 처리
		List<NoticeVO> list = noticeService.getBoardList(paging.getOffset(), paging.getNumPerPage());
		
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("cmd", "/notice");
			return mv;
		}
		
		return mv;
	}
	
	// notice 글쓰기
	@RequestMapping("/notice_write")
	public ModelAndView getMoveNoticeWrite(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("sub/notice_write");
		mv.addObject("cPage", request.getParameter("cPage"));
		return mv; 
	}
	
	@PostMapping("/notice_write_ok")
	public ModelAndView getMoveNoticeWriteOk(NoticeVO nvo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/notice");
			
			
			
			
			System.out.println("controller 입니다.");
			
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = nvo.getFile_name();
			
			if (file.isEmpty()) {
				nvo.setF_name("");
			} else {
				// 현재 날짜와 시간 가져오기
		        LocalDateTime now = LocalDateTime.now();

		        // 원하는 형식으로 포맷하기
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		        String nowstr = now.format(formatter);
		        
		        // pic 파일이름 file 실제 파일
		        // 업로드시간_파일명 의 형태로 저장
		        String fname = nowstr+"_"+file.getOriginalFilename();
		        nvo.setF_name(fname);
		        
		        // 실질적인 파일 업로드
		        file.transferTo(new File(path, fname));
				
			}
			
			int result = noticeService.getBoardInsert(nvo);
			
			System.out.println("result : " + result);
			
			if (result > 0) {
				return mv;
			}
			
			return null;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	
	// notice 상세보기
	@RequestMapping("/notice_detail")
	public ModelAndView getMoveNoticeDetail(@RequestParam("cPage") String cPage,
			@RequestParam("n_idx") String n_idx,
			CommentVO cvo) {
		ModelAndView mv = new ModelAndView();
		
		if (n_idx != null) {
			// hit 업데이트
		noticeService.getBoardHit(n_idx);
		// 상세보기
		NoticeVO nvo = noticeService.getBoardDetail(n_idx);
		// 댓글 전체 카운트
		int count = commentService.getCommentSubCount(cvo);
		// 페이지 댓글수
		PerPageConstant perPageConstant = new PerPageConstant();
		int perPage = perPageConstant.getNoticecommpage();
		
		AdminVO avo = adminService.adminDetail(nvo.getA_idx());
		
		// 페이징 처리
		Paging paging = pagingService.pagingservice(count, cPage, perPage);
		
		// 댓글 가져오기 
		List<CommentVO> clist = commentService.getCommentList(cvo, count, perPage);
		mv.addObject("clist", clist);
		mv.addObject("paging", paging);
		
			mv.addObject("u_id", avo.getA_na());
			mv.addObject("nvo", nvo);
			mv.addObject("cPage", cPage);
			mv.addObject("cmd", "/notice_detail");
			mv.setViewName("sub/notice_detail");
		}else {
			mv.setViewName("index");
		}
		
		return mv;
	}
	
	@GetMapping("/notice_down")
	// void 반환형 없음
	public void noticeDown(HttpServletRequest request, HttpServletResponse response) {
		try {
			String n_pic = request.getParameter("n_pic");
			
			System.out.println(n_pic);
			
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/"+n_pic);
			String r_path = URLEncoder.encode(path, "UTF-8");
			
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-disposition", "attachment; filename="+r_path);
			
			File file = new File(new String(path.getBytes(), "UTF-8"));
			FileInputStream in = new FileInputStream(file);
			OutputStream out = response.getOutputStream();
			
			FileCopyUtils.copy(in, out);
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	// notice 댓글 등록
	@PostMapping("/notice/comment_insert")
	public ModelAndView getCommentInsert(CommentVO cvo, 
			 @ModelAttribute("n_idx") String n_idx,
			 @ModelAttribute("cPage") String cPage) {
		System.out.println(n_idx);
		
		ModelAndView mv = new ModelAndView("redirect:/notice_detail");
		
		commentService.getCommentInsert(cvo);
		
		return mv;
	}
	
	// notice 댓글 수정
	@PostMapping("/notice/comment_update")
	public ModelAndView getCommentUpdate(CommentVO cvo,
			@ModelAttribute("n_idx") String n_idx,
			@ModelAttribute("cPage") String cPage) {
		
		ModelAndView mv = new ModelAndView("redirect:/notice_detail");
		
		commentService.getCommentUpdate(cvo);
		
		return mv;
	}
	
	// notice 댓글 삭제
	 @PostMapping("/notice/comment_delete")
	 public ModelAndView getCommentDelete(@RequestParam("c_idx") String c_idx,
			 @ModelAttribute("n_idx") String n_idx,
			 @ModelAttribute("cPage") String cPage) {
		 
		 System.out.println("c_idx : " + c_idx);
		 System.out.println("cPage : " + cPage);
		 System.out.println("n_idx : " + n_idx);
		 
		 ModelAndView mv = new ModelAndView("redirect:/notice_detail");
		 
		 commentService.getCommentDelete(c_idx);
		 
		 return mv;
	 }
	
	
	// notice 수정하기
	@PostMapping("/notice_update")
	public ModelAndView getMoveNoticeUpdate(
			@ModelAttribute("cPage") String cPage,
			@ModelAttribute("n_idx") String n_idx) {
		
		System.out.println("cPage1 : " + cPage);
		System.out.println("n_idx1 : " + n_idx);
		
		ModelAndView mv = new ModelAndView("sub/notice_update");
		NoticeVO nvo = noticeService.getBoardDetail(n_idx);
		System.out.println("nvo1 : " + nvo);
		
		if (nvo != null) {
			mv.addObject("nvo", nvo);
			
			return mv;
		}
		
		return null;
	}
	
	@PostMapping("/notice_update_ok")
	public ModelAndView getMoveNoticeUpdateOk(
			@ModelAttribute("cPage") String cPage,
			@ModelAttribute("n_idx") String n_idx,
			NoticeVO nvo, HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		
		NoticeVO nvo2 = noticeService.getBoardDetail(n_idx);
		
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = nvo.getFile_name();
			String old_f_name = nvo2.getF_name();
			
			System.out.println("file2 : " + file);		
			System.out.println("old_f_name2 : " + old_f_name);				
			
			if (file.isEmpty()) {
				nvo.setF_name("");
			} else {
				// 현재 날짜와 시간 가져오기
		        LocalDateTime now = LocalDateTime.now();

		        // 원하는 형식으로 포맷하기
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		        String nowstr = now.format(formatter);
		        
		        // pic 파일이름 file 실제 파일
		        // 업로드시간_파일명 의 형태로 저장
		        String fname = nowstr+"_"+file.getOriginalFilename();
		        nvo.setF_name(fname);
		        
		        // 실질적인 파일 업로드
		        file.transferTo(new File(path, fname));
				
			}
			
			int result = noticeService.getBoardUpdate(nvo);
			
			System.out.println("result2 : " + result);
			
			if (result > 0) {
				mv.setViewName("redirect:/notice_detail");
				return mv;
			}
			
			return null;
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return mv;
	}
	
	// notice 삭제하기
	@PostMapping("/notice_delete")
	public ModelAndView getMoveNoticeDelete(
			@ModelAttribute("cPage") String cPage,
			@ModelAttribute("idx") String idx) {
		
		ModelAndView mv = new ModelAndView("sub/notice_delete");
		
		return mv;
	}
	
	
	// customer 리스트
	@RequestMapping("/customer")
	public ModelAndView getMoveCustomer() {
		return new ModelAndView("sub/customer_list");
	}
	// customer 글쓰기
	@RequestMapping("/customer_write")
	public ModelAndView getMoveCustomerWrite() {
		return new ModelAndView("sub/customer_write");
	}
	// customer 상세보기
	@RequestMapping("/customer_detail")
	public ModelAndView getMoveCustomerDetail() {
		return new ModelAndView("sub/customer_detail");
	}
	
	
	// 개인정보처리방침
	@RequestMapping("/privacy")
	public ModelAndView getMovePrivacy() {
		return new ModelAndView("sub/privacy");
	}
	
	// 이용약관
	@RequestMapping("/terms_of_use")
	public ModelAndView getMoveTermsOfUse() {
		return new ModelAndView("sub/terms_of_use");
	}
	
}
