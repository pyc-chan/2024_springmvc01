package com.ict.project.login.dao;


import java.util.List;

import com.ict.project.login.vo.LoginVO;

public interface LoginDAO {
	
	public int joinOK(LoginVO lvo);
	
	public String idChk(String u_id);
	
	public LoginVO getDetail(String u_id);
	
	public List<String> getId(String u_em);
	
	public String kakaoChk(String u_kakao);

	public String naverChk(String u_naver);
	
	public String idKakao(String u_kakao);
	
	public String idNaver(String u_naver);
	
	public int update(LoginVO lvo);
	
	public int updatePw(LoginVO lvo);
}
