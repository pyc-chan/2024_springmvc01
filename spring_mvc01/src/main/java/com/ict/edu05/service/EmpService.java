package com.ict.edu05.service;

import java.util.List;

import com.ict.edu05.vo.EmpVO;

public interface EmpService {
	List<EmpVO> getList() throws Exception;
	List<EmpVO> getSearch(String deptno) throws Exception;
	List<EmpVO> getSearch(EmpVO empvo) throws Exception;
	List<EmpVO> getSearch(String idx, String keyword) throws Exception;
}
