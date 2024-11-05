package com.ict.edu05.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.edu05.vo.EmpVO;


@Repository
public class EmpDAOImpl implements EmpDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<EmpVO> getList() throws Exception {
		
		return sqlSessionTemplate.selectList("emp.list");
	}

	@Override
	public List<EmpVO> getSearch(String deptno) throws Exception {
		
		return sqlSessionTemplate.selectList("emp.search", deptno);
	}

	@Override
	public List<EmpVO> getSearch(String idx, String keyword) throws Exception {
		// Mybatis에서 파라미터 자리는 없거나 하나만 존재한다.
		// 그래서 두 개 이상인 경우는 위에 처럼 vo를 사용하는 방법과 Map을 사용하는 방법
		Map<String, String> map = new HashMap<String, String>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		return sqlSessionTemplate.selectList("emp.dynamic2",map);
	}

	@Override
	public List<EmpVO> getSearch(EmpVO empvo) throws Exception {
		return sqlSessionTemplate.selectList("emp.dynamic", empvo);
	}
	
}
