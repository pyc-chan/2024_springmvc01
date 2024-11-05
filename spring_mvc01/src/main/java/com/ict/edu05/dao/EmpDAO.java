package com.ict.edu05.dao;

import java.util.List;

import com.ict.edu05.vo.EmpVO;

public interface EmpDAO {
	List<EmpVO> getList() throws Exception;
	List<EmpVO> getSearch(String deptno) throws Exception;
	List<EmpVO> getSearch(EmpVO empvo) throws Exception;
	List<EmpVO> getSearch(String searchType, String searchValue) throws Exception;
	
}
