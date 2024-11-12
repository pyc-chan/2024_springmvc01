package com.ict.project.comment.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.ict.project.comment.service.CommentService;
import com.ict.project.comment.vo.CommentVO;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@PostMapping("/comment/delete")
	public void commentDelete(CommentVO cvo, HttpServletRequest request) {
		String c_idx = cvo.getC_idx();
		commentService.getCommentDelete(c_idx);
		
	}
}
