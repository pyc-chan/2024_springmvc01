package com.ict.project.qna.dao;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.ict.project.crud.vo.CrudVO;

public interface CrudDAO {
	
	public List<CrudVO> getCrudList();
	
	public CrudVO getCrudDetail(String idx);
	
	public int getCrudInsert(CrudVO cvo);
	
	public int getCrudUpdate(CrudVO cvo);
	
	public int getCrudDelete(String idx);

	}
