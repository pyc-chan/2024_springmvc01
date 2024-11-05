package com.ict.project.searchlist.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.comm.SearchPaging;
import com.ict.project.searchlist.service.SearchListService;
import com.ict.project.searchlist.vo.TreeVO;

@Controller
public class SearchListController {
	// search / sub3-3
	@Autowired
	private SearchListService searchListService;
	
	@Autowired
	private SearchPaging paging;
	
	@RequestMapping("/treelist")
	public ModelAndView getTreeList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("search/sub3-3");
		int count = searchListService.getTotalCount();
		paging.setTotalRecord(count);
		
		
		if(paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		}else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if(paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1 );
			}
		}
			
		String cPage = request.getParameter("cPage");
		
		if(cPage == null) {
			paging.setNowPage(1);
		}else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage()-1));
		
		
		paging.setBeginBlock(
				(int)(((paging.getNowPage()-1) / paging.getPagePerBlock()) * paging.getPagePerBlock()+1));
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() -1);
		
		if(paging.getEndBlock() >  paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		
		// DB 갔다가 오기 
		List<TreeVO> list = searchListService.getTreeList(paging.getOffset(), paging.getNumPerPage());
		
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		return mv;
		
//		// 1. 전체 게시물의 수를 구한다.
//		int count = bbsService.getTotalCount();
//		paging.setTotalRecord(count);
//		
//		// 2. 전체 페이지의 수를 구한다. 
//		// NumPerPage(6) 보다 작을 경우 1페이지
//		if(paging.getTotalRecord() <= paging.getNumPerPage()) {
//			paging.setTotalPage(1);
//		}else {
//			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
//			if(paging.getTotalRecord() % paging.getNumPerPage() != 0) {
//				paging.setTotalPage(paging.getTotalPage() + 1 );
//			}
//		}
//		
//		// 3. 파라미터에서 넘어오는 cPage(보고싶은 페이지번호)를 구하자 
//		String cPage = request.getParameter("cPage");
//	
//	    // 만약에 cPage가 null 이면 무조건 1 page 이다.
//		if(cPage == null) {
//			paging.setNowPage(1);
//		}else {
//			paging.setNowPage(Integer.parseInt(cPage));
//		}
		
		// 4. cPage를 기준으로 begin, end,  beginBlock, endBlock
		// 오라클 인 경우 begin, end를 구해야 한다.
		// MySQL, Maridb 는 limit, offset
		// offset = limit * (현재페이지 - 1)
		// limit = numPerPage
		// SELECT * FROM bbs_t order by b_idx desc limit 3 offset 0 | 1 : 3;
		
//		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage()-1));
//		
//		
//		// 시작블록과 끝블록 구하기
//		paging.setBeginBlock(
//				(int)(((paging.getNowPage()-1) / paging.getPagePerBlock()) * paging.getPagePerBlock()+1));
//		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() -1);
//		
//		// 주의 사항 
//		// enbBlock(3,6,9...) 실제 가지고 총 페이지는 20개일경우  4페이지 까지 
//		if(paging.getEndBlock() >  paging.getTotalPage()) {
//			paging.setEndBlock(paging.getTotalPage());
//		}
//		
//		
//		// DB 갔다가 오기 
//		List<BbsVO> list = bbsService.getBbsList(paging.getOffset(), paging.getNumPerPage());
//		
//		mv.addObject("list", list);
//		mv.addObject("paging", paging);
//		return mv;
	}
}
