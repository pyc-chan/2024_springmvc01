package com.ict.project.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ict.project.admin.service.AdminService;
import com.ict.project.admin.vo.AdminVO;
import com.ict.project.comm.Paging;
import com.ict.project.comm.PagingService;
import com.ict.project.comm.PerPageConstant;
import com.ict.project.comment.service.CommentService;
import com.ict.project.comment.vo.CommentVO;
import com.ict.project.fna.service.FnaService;
import com.ict.project.fna.vo.FnaVO;
import com.ict.project.inquery.service.InqueryService;
import com.ict.project.inquery.vo.InqueryVO;
import com.ict.project.login.service.LoginService;
import com.ict.project.login.vo.LoginVO;
import com.ict.project.notice.service.NoticeService;
import com.ict.project.notice.vo.NoticeVO;
import com.ict.project.qna.service.QnaService;
import com.ict.project.qna.vo.QnaVO;
import com.ict.project.review.service.ReviewService;
import com.ict.project.review.vo.ReviewVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private PagingService pagingService;
	
	
	// 관리자 페이지 메인
	@GetMapping("/admin/index")
	public ModelAndView adminIndex(HttpSession session) {
		if (session.getAttribute("a_id") != null) {

			ModelAndView mv = new ModelAndView("admin/admin_index");
			// login
			LoginService loginad = adminService.loginService();
			PerPageConstant perPageConstant = new PerPageConstant();
			int perPage = perPageConstant.getAdminuserpage();
			List<LoginVO> userlist = loginad.getList(0, perPage);
			mv.addObject("userlist", userlist);

			// Qna
			QnaService qnaad = adminService.qnaService();
			List<QnaVO> qnalist = qnaad.getQnaList(0, perPage);
			mv.addObject("qnalist", qnalist);

			// Notice
			NoticeService noticead = adminService.noticeService();
			List<NoticeVO> noticelist = noticead.getBoardList(0, perPage);
			mv.addObject("noticelist", noticelist);
			return mv;
		}
		return new ModelAndView("redirect:/mainGo");
	}

	// 관리자 목록
	@RequestMapping("/admin/adminlist")
	public ModelAndView adminList(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("a_id") != null) {
			if (session.getAttribute("a_id").equals("root")) {
				ModelAndView mv = new ModelAndView("admin/admin_list");

				int count = adminService.adminCount();
				String cPage = request.getParameter("cPage");
				PerPageConstant constant = new PerPageConstant();
				int perpage = constant.getAdminpage();

				Paging paging = pagingService.pagingservice(count, cPage, perpage);
				int offset = paging.getOffset();
				int limit = paging.getNumPerPage();

				List<AdminVO> list = adminService.adminList(offset, limit);
				mv.addObject("list", list);
				mv.addObject("paging", paging);
				mv.addObject("cmd", "/admin/adminlist");
				return mv;
			} else {
				return new ModelAndView("redirect:/admin/index");
			}
		}
		return new ModelAndView("index");
	}

	// 관리자 정보
	@PostMapping("/admin/admindetail")
	public ModelAndView adminDetail(String a_idx, String cPage, HttpSession session) {
		if (session.getAttribute("a_id") != null) {
			if (session.getAttribute("a_id").equals("root")) {
				ModelAndView mv = new ModelAndView("admin/admin_detail");
				AdminVO avo = adminService.adminDetail(a_idx);
				mv.addObject("avo", avo);
				mv.addObject("cPage", cPage);
				return mv;
			}
			return new ModelAndView("redirect:/admin/index");
		}
		return new ModelAndView("index");

	}

	// 관리자 탈퇴
	@PostMapping("/admin/admindelete")
	public ModelAndView adminDelete(AdminVO avo, HttpSession session) {
		if (session.getAttribute("a_id") != null) {
			if (session.getAttribute("a_id").equals("root")) {

				ModelAndView mv = new ModelAndView("redirect:/admin/adminlist");
				adminService.adminDelete(avo);
				return mv;
			}
			return new ModelAndView("redirect:/admin/index");

		}
		return new ModelAndView("index");
	}

	// 관리자 업데이트
	@PostMapping("/admin/adminupdate")
	public ModelAndView adminUpdate(AdminVO avo, HttpSession session) {
		if (session.getAttribute("a_id") != null) {
			if (session.getAttribute("a_id").equals("root")) {

				ModelAndView mv = new ModelAndView("redirect:/admin/admindetail?a_idx=" + avo.getA_idx());
				adminService.adminUpdate(avo);

				return mv;
			}
			return new ModelAndView("redirect:/admin/index");
		}
		return new ModelAndView("index");

	}
	
	@GetMapping("/admin/admininsertgo")
	public ModelAndView adminInsertGo(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("a_id") != null) {
			if (session.getAttribute("a_id").equals("root")) {
				mv.setViewName("admin/admin_insert");
				return mv;
			}
			mv.setViewName("redirect:/admin/index");
			return mv;
		}
		mv.setViewName("index");
		return mv;
	}
	
	
	
	// 관리자 삽입
	@PostMapping("/admin/admininsert")
	public ModelAndView adminInsert(LoginVO lvo, HttpSession session) {
		if (session.getAttribute("a_id") != null) {
			if (session.getAttribute("a_id").equals("root")) {
				ModelAndView mv = new ModelAndView("redirect:/admin/adminlist");
				LoginService loginad = adminService.loginService();
				loginad.loginInsert(lvo);
				return mv;
			}
			return new ModelAndView("admin/index");
		}
		return new ModelAndView("index");
	}

	// 회원 목록
	@GetMapping("/admin/userlist")
	public ModelAndView userList(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("a_id") != null) {
			ModelAndView mv = new ModelAndView("");
			LoginService loginad = adminService.loginService();

			int count = loginad.userCount();
			String cPage = request.getParameter("cPage");
			PerPageConstant constant = new PerPageConstant();
			int perpage = constant.getAdminuserspage();

			Paging paging = pagingService.pagingservice(count, cPage, perpage);
			int offset = paging.getOffset();
			int limit = paging.getNumPerPage();

			List<LoginVO> list = loginad.getList(offset, limit);
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("cmd", "/admin/userlist");

			return mv;
		}
		return new ModelAndView("index");
	}

	// 회원 정보
	@PostMapping("/admin/userdetail")
	public ModelAndView userDetail(String u_id, String cPage) {
		ModelAndView mv = new ModelAndView("");
		LoginService loginad = adminService.loginService();
		LoginVO lvo = loginad.getDetail(u_id);
		mv.addObject("lvo", lvo);
		mv.addObject("cPage", cPage);
		return mv;
	}

	// 회원 탈퇴
	@PostMapping("/admin/userdelete")
	public ModelAndView userDelete(LoginVO lvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("");
		Object cPage = request.getAttribute("cPage");
		LoginService loginad = adminService.loginService();
		loginad.logindelete(lvo);
		mv.addObject("cPage", cPage);
		return mv;
	}

	// 회원 업데이트
	@PostMapping("/admin/userupdate")
	public ModelAndView userUpdate(LoginVO lvo) {
		ModelAndView mv = new ModelAndView("");
		LoginService loginad = adminService.loginService();
		loginad.update(lvo);

		return mv;
	}

	// 회원 삽입
	@PostMapping("/admin/userinsert")
	public ModelAndView userInsert(LoginVO lvo) {
		ModelAndView mv = new ModelAndView("");
		LoginService loginad = adminService.loginService();
		loginad.loginInsert(lvo);
		return mv;
	}

	// qna 목록
	@GetMapping("/admin/qnalist")
	public ModelAndView qnaList(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("a_id") != null) {
			ModelAndView mv = new ModelAndView("admin/qna_list");
			QnaService qnaad = adminService.qnaService();

			int count = qnaad.getQnaCount();
			String cPage = request.getParameter("cPage");
			PerPageConstant constant = new PerPageConstant();
			int perpage = constant.getAdminqnaspage();

			Paging paging = pagingService.pagingservice(count, cPage, perpage);
			int offset = paging.getOffset();
			int limit = paging.getNumPerPage();

			List<QnaVO> list = qnaad.getQnaList(offset, limit);
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("cmd", "/admin/qnalist");

			return mv;
		}
		return new ModelAndView("index");
	}

	// qna 상세페이지
	@PostMapping("/admin/qnadetail")
	public ModelAndView qnaDetail(String q_idx, String cPage) {
		ModelAndView mv = new ModelAndView("");
		QnaService qnaad = adminService.qnaService();
		QnaVO qvo = qnaad.getQnaDetail(q_idx);
		mv.addObject("qvo", qvo);
		mv.addObject("cPage", cPage);
		return mv;
	}

	// qna 탈퇴
	@PostMapping("/admin/qnadelete")
	public ModelAndView qnaDelete(QnaVO qvo) {
		ModelAndView mv = new ModelAndView("redirect:/admin/qnalist");
		QnaService qnaad = adminService.qnaService();
		qnaad.getQnaDelete(qvo.getQ_idx());

		return mv;
	}

	// qna 업데이트
	@PostMapping("/admin/qnaupdate")
	public ModelAndView qnaUpdate(QnaVO qvo) {
		ModelAndView mv = new ModelAndView("redirect:/admin/qnadetail?q_idx=" + qvo.getQ_idx());
		QnaService qnaad = adminService.qnaService();
		qnaad.getQnaUpdate(qvo);

		return mv;
	}

	// qna 삽입
	@PostMapping("/admin/qnainsert")
	public ModelAndView qnaInsert(QnaVO qvo) {
		ModelAndView mv = new ModelAndView("redirect:/admin/qnalist");
		QnaService qnaad = adminService.qnaService();
		qnaad.getQnaInsert(qvo);

		return mv;
	}

	// fna 목록
	@GetMapping("/admin/fnalist")
	public ModelAndView fnaList(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("a_id") != null) {
			ModelAndView mv = new ModelAndView("");
			FnaService fnaad = adminService.fnaService();

			int count = fnaad.getFnaCount();
			String cPage = request.getParameter("cPage");
			PerPageConstant constant = new PerPageConstant();
			int perpage = constant.getFnapage();

			Paging paging = pagingService.pagingservice(count, cPage, perpage);
			int offset = paging.getOffset();
			int limit = paging.getNumPerPage();

			List<FnaVO> list = fnaad.getFnaList(offset, limit);
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("cmd", "/admin/fnalist");

			return mv;
		}
		return new ModelAndView("index");
	}

	// fna 상세페이지
	@PostMapping("/admin/fnadetail")
	public ModelAndView fnaDetail(String f_idx, String cPage) {
		ModelAndView mv = new ModelAndView("");
		FnaService fnaad = adminService.fnaService();
		FnaVO fvo = fnaad.getFnaDetail(f_idx);
		mv.addObject("fvo", fvo);
		mv.addObject("cPage", cPage);
		return mv;
	}

	// fna 삭제
	@PostMapping("/admin/fnadelete")
	public ModelAndView fnaDelete(FnaVO fvo) {
		ModelAndView mv = new ModelAndView("redirect:/admin/fnalist");
		FnaService fnaad = adminService.fnaService();
		fnaad.getFnaDelete(fvo.getF_idx());

		return mv;
	}

	// fna 업데이트
	@PostMapping("/admin/fnaupdate")
	public ModelAndView fnaUpdate(FnaVO fvo) {
		ModelAndView mv = new ModelAndView("redirect:/admin/fnadetail?f_idx=" + fvo.getF_idx());
		FnaService fnaad = adminService.fnaService();
		fnaad.getFnaUpdate(fvo);

		return mv;
	}

	// fna 삽입
	@PostMapping("/admin/fnainsert")
	public ModelAndView fnaInsert(FnaVO fvo) {
		ModelAndView mv = new ModelAndView("redirect:/admin/fnalist");
		FnaService fnaad = adminService.fnaService();
		fnaad.getFnaInsert(fvo);

		return mv;
	}

	// 공지사항 리스트
	@GetMapping("/admin/noticelist")
	public ModelAndView noticeList(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("a_id") != null) {
			ModelAndView mv = new ModelAndView("admin/notice_list");
			NoticeService noticead = adminService.noticeService();

			int count = noticead.getTotalCount();
			String cPage = request.getParameter("cPage");
			PerPageConstant constant = new PerPageConstant();
			int perpage = constant.getFnapage();

			Paging paging = pagingService.pagingservice(count, cPage, perpage);
			int offset = paging.getOffset();
			int limit = paging.getNumPerPage();

			List<NoticeVO> list = noticead.getBoardList(offset, limit);
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("cmd", "/admin/noticelist");

			return mv;
		}
		return new ModelAndView("index");
	}

	// 공지사항 상세
	@PostMapping("/admin/noticedetail")
	public ModelAndView noticeDetail(String n_idx, String cPage) {
		ModelAndView mv = new ModelAndView("admin/notice_detail");
		NoticeService noticead = adminService.noticeService();
		NoticeVO nvo = noticead.getBoardDetail(n_idx);
		mv.addObject("nvo", nvo);
		mv.addObject("cPage", cPage);
		return mv;
	}

	// notice 삭제
	@PostMapping("/admin/noticedelete")
	public ModelAndView noticeDelete(NoticeVO nvo) {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticelist");
		NoticeService noticead = adminService.noticeService();
		noticead.getBoardDelete(nvo.getN_idx());

		return mv;
	}

	// notice 업데이트
	@PostMapping("/admin/noticeupdate")
	public ModelAndView noticeUpdate(NoticeVO nvo, RedirectAttributes redirectAttributes) {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticedetail");
		NoticeService noticead = adminService.noticeService();
		noticead.getBoardUpdate(nvo);
		redirectAttributes.addFlashAttribute("nvo", nvo);

		return mv;
	}

	// notice 삽입
	@PostMapping("/admin/noticeinsert")
	public ModelAndView noticeInsert(NoticeVO nvo) {
		ModelAndView mv = new ModelAndView("redirect:/admin/noticelist");
		NoticeService noticead = adminService.noticeService();
		noticead.getBoardInsert(nvo);

		return mv;
	}

	// 댓글 목록
	@RequestMapping("/admin/commentlist")
	public ModelAndView commentList(HttpServletRequest request, CommentVO cvo, HttpSession session) {
		if (session.getAttribute("a_id") != null) {

			ModelAndView mv = new ModelAndView("");
			CommentService commentad = adminService.commentService();

			// 페이징 기법
			int count = commentad.getCommentCount();
			String cPage = request.getParameter("cPage");
			PerPageConstant constant = new PerPageConstant();
			int perpage = constant.getFnapage();

			Paging paging = pagingService.pagingservice(count, cPage, perpage);
			int offset = paging.getOffset();
			int limit = paging.getNumPerPage();

			List<CommentVO> list = commentad.getCommentList(offset, limit);
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("cmd", "/admin/commentlist");

			return mv;
		}
		return new ModelAndView("index");
	}

	// comment 삭제
	@PostMapping("/admin/commentdelete")
	public ModelAndView commentDelete(CommentVO cvo, RedirectAttributes redirectAttributes) {
		ModelAndView mv = new ModelAndView("redirect:/admin/commentlist");
		CommentService commentad = adminService.commentService();
		commentad.getCommentDelete(cvo.getC_idx());
		redirectAttributes.addFlashAttribute("cvo", cvo);

		return mv;
	}

	// comment 업데이트
	@PostMapping("/admin/commentupdate")
	public ModelAndView commentUpdate(CommentVO cvo) {
		ModelAndView mv = new ModelAndView("redirect:/admin/commentdetail?c_idx=" + cvo.getC_idx());
		CommentService commentad = adminService.commentService();
		commentad.getCommentUpdate(cvo);

		return mv;
	}

	// comment 삽입
	@PostMapping("/admin/commentinsert")
	public ModelAndView commentInsert(CommentVO cvo) {
		ModelAndView mv = new ModelAndView("redirect:/admin/commentlist");
		CommentService commentad = adminService.commentService();
		commentad.getCommentInsert(cvo);

		return mv;
	}

	// 리뷰 목록
	@RequestMapping("/admin/reviewlist")
	public ModelAndView reviewList(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("a_id") != null) {
			ModelAndView mv = new ModelAndView("");
			ReviewService reviewad = adminService.reviewService();

			// 페이징 기법
			int count = reviewad.getReviewCount();
			String cPage = request.getParameter("cPage");
			PerPageConstant constant = new PerPageConstant();
			int perpage = constant.getFnapage();

			Paging paging = pagingService.pagingservice(count, cPage, perpage);
			int offset = paging.getOffset();
			int limit = paging.getNumPerPage();

			List<ReviewVO> list = reviewad.getReviewList(offset, limit);
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("cmd", "/admin/reviewlist");

			return mv;
		}
		return new ModelAndView("index");
	}

	// review 삭제
	@PostMapping("/admin/reviewdelete")
	public ModelAndView reviewDelete(ReviewVO revo, RedirectAttributes redirectAttributes) {
		ModelAndView mv = new ModelAndView("redirect:/admin/reviewlist");
		ReviewService reviewad = adminService.reviewService();
		reviewad.getReviewDelete(revo.getRev_idx());
		redirectAttributes.addFlashAttribute("revo", revo);

		return mv;
	}

	// review 업데이트
	@PostMapping("/admin/reviewupdate")
	public ModelAndView reviewUpdate(ReviewVO revo) {
		ModelAndView mv = new ModelAndView("redirect:/admin/reviewdetail?c_idx=" + revo.getRev_idx());
		ReviewService reviewad = adminService.reviewService();
		reviewad.getReviewUpdate(revo);

		return mv;
	}

	// review 삽입
	@PostMapping("/admin/reviewinsert")
	public ModelAndView reviewInsert(ReviewVO revo) {
		ModelAndView mv = new ModelAndView("redirect:/admin/reviewlist");
		ReviewService reviewad = adminService.reviewService();
		reviewad.getReviewInsert(revo);

		return mv;
	}

	// inquery 목록
	@RequestMapping("/admin/inquerylist")
	public ModelAndView inqueryList(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("a_id") != null) {
			ModelAndView mv = new ModelAndView("");
			ReviewService reviewad = adminService.reviewService();

			// 페이징 기법
			int count = reviewad.getReviewCount();
			String cPage = request.getParameter("cPage");
			PerPageConstant constant = new PerPageConstant();
			int perpage = constant.getFnapage();

			Paging paging = pagingService.pagingservice(count, cPage, perpage);
			int offset = paging.getOffset();
			int limit = paging.getNumPerPage();

			List<ReviewVO> list = reviewad.getReviewList(offset, limit);
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("cmd", "/admin/inquerylist");

			return mv;
		}
		return new ModelAndView("index");
	}

	// inquery 작성
	@PostMapping("/admin/inqueryinsert")
	public ModelAndView inqueryInquery(InqueryVO ivo) {
		ModelAndView mv = new ModelAndView("redirect:/admin/inquerylist");
		InqueryService inqueryad = adminService.inqueryService();
		inqueryad.getInqueryInsert(ivo);

		return mv;
	}

	// inquery 삭제
	@PostMapping("/admin/inquerydelete")
	public ModelAndView inqueryDelete(String i_idx) {
		ModelAndView mv = new ModelAndView();
		InqueryService inqueryad = adminService.inqueryService();
		inqueryad.getInqueryDelete(i_idx);

		return mv;
	}

	// inquery 댓글 작성
	@PostMapping("/admin/inquerydetail")
	public ModelAndView inqueryDetail(String i_idx, String cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		InqueryService inqueryad = adminService.inqueryService();
		InqueryVO ivo = inqueryad.getInqueryDetail(i_idx);

		mv.addObject("a_idx", session.getAttribute("a_idx"));
		mv.addObject("ivo", ivo);
		mv.addObject("cPage", cPage);

		return mv;
	}

	// inquery 댓글 작성
	@PostMapping("/admin/inqueryupdate")
	public ModelAndView inqueryUpdate(InqueryVO ivo) {
		ModelAndView mv = new ModelAndView();
		InqueryService inqueryad = adminService.inqueryService();
		inqueryad.getAdminUpdate(ivo);

		return mv;
	}

}
