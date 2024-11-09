package com.ict.project.freeboard.service;

import java.util.List;


import com.ict.project.crud.vo.CrudVO;

public interface CrudService {

	public List<CrudVO> getCrudList();
	
	public CrudVO getCrudDetail(String idx);
	
	public int getCrudInsert(CrudVO cvo);
	
	public int getCrudUpdate(CrudVO cvo);
	
	public int getCrudDelete(String idx);
}
