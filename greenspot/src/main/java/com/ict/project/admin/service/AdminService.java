package com.ict.project.admin.service;

import java.util.List;

import com.ict.project.admin.vo.AdminVO;
import com.ict.project.login.dao.LoginDAO;
import com.ict.project.login.service.LoginService;
import com.ict.project.login.vo.LoginVO;
import com.ict.project.popup.vo.PopupVO;

public interface AdminService {
	
	public List<AdminVO> adminList();
	public int adminUpdate(AdminVO avo);
	public int adminDelete(AdminVO avo);
	public int adminInsert(AdminVO avo);
	public AdminVO adminDetail(String a_idx);
	
	LoginService loginService();
	QnaService qnaService();
	FnaService fnaService();
	NoticeService noticeService();
	InqueryService inqueryService();
	CommentService commentService();
	FreeBoardService freeBoardService();
	
}
