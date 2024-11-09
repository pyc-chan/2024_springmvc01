package com.ict.project.freeboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.ict.project.crud.vo.CrudVO;

@Repository
public class CrudDAOImpl implements CrudDAO{
	
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<CrudVO> getCrudList() {
		return sqlSessionTemplate.selectList("crud.crud_list");
	}

	@Override
	public CrudVO getCrudDetail(String idx) {
		return sqlSessionTemplate.selectOne("crud.crud_detail",idx);
	}

	@Override
	public int getCrudInsert(CrudVO cvo) {
		return sqlSessionTemplate.insert("crud.crud_insert",cvo);
	}

	@Override
	public int getCrudUpdate(CrudVO cvo) {
		return sqlSessionTemplate.update("crud.crud_update",cvo);
	}

	@Override
	public int getCrudDelete(String idx) {
		return sqlSessionTemplate.delete("crud.crud_delete",idx);
	}
	
	
	
}
