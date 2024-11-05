package com.ict.edu06.dao;

import com.ict.edu06.vo.LoginVO;

public interface LoginDAO {
	
	// 로그인
	public LoginVO LoginChk(LoginVO lvo) throws Exception;
	
	// 회원가입
	public int LoginJoin(LoginVO lvo) throws Exception;
}
