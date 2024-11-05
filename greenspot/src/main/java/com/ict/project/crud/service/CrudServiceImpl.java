package com.ict.project.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.crud.dao.CrudDAO;
import com.ict.project.crud.vo.CrudVO;

@Service
public class CrudServiceImpl implements CrudService{
	
	@Autowired
	private CrudDAO crudDAO;

	@Override
	public List<CrudVO> getCrudList() {
		return crudDAO.getCrudList();
	}

	@Override
	public CrudVO getCrudDetail(String idx) {
		return crudDAO.getCrudDetail(idx);
	}

	@Override
	public int getCrudInsert(CrudVO cvo) {
		return crudDAO.getCrudInsert(cvo);
	}

	@Override
	public int getCrudUpdate(CrudVO cvo) {
		return crudDAO.getCrudUpdate(cvo);
	}

	@Override
	public int getCrudDelete(String idx) {
		return crudDAO.getCrudDelete(idx);
	}

}
