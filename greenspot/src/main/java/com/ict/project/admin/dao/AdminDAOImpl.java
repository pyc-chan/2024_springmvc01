package com.ict.project.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.project.admin.vo.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<AdminVO> adminList() {
		return sqlSessionTemplate.selectList("admin.admin_list");
	}

	@Override
	public int adminUpdate(AdminVO lvo) {
		return sqlSessionTemplate.update("admin.admin_update", lvo);
	}

	@Override
	public int adminDelete(AdminVO lvo) {
		return sqlSessionTemplate.update("admin.admin_delete", lvo);
	}

	@Override
	public int adminInsert(AdminVO lvo) {
		return sqlSessionTemplate.insert("admin.admin_insert", lvo);
	}

	@Override
	public AdminVO adminDetail(String u_idx) {
		return sqlSessionTemplate.selectOne("admin.admin_detail",u_idx);
	}
	
	
	
}
