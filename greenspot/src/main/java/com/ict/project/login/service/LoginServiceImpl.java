package com.ict.project.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.project.login.dao.LoginDAO;
import com.ict.project.login.vo.LoginVO;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDAO loginDAO;
	
	@Override
	public int joinOK(LoginVO lvo) {
		return loginDAO.joinOK(lvo);
	}

	@Override
	public String idChk(String u_id) {
		return loginDAO.idChk(u_id);
	}

	@Override
	public List<String> getId(String u_em) {
		return loginDAO.getId(u_em);
	}

	@Override
	public String kakaoChk(String u_kakao) {
		return loginDAO.kakaoChk(u_kakao);
	}
	
	@Override
	public String naverChk(String u_naver) {
		return loginDAO.naverChk(u_naver);
	}

	@Override
	public LoginVO getDetail(String u_id) {
		return loginDAO.getDetail(u_id);
	}

	@Override
	public String idKakao(String u_kakao) {
		return loginDAO.idKakao(u_kakao);
	}

	@Override
	public String idNaver(String u_naver) {
		return loginDAO.idNaver(u_naver);
	}

	@Override
	public int update(LoginVO lvo) {
		return loginDAO.update(lvo);
	}

	@Override
	public int updatePw(LoginVO lvo) {
		return loginDAO.updatePw(lvo);
	}


}
