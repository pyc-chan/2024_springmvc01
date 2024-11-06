package com.ict.project.login.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.project.login.vo.LoginVO;

@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate; 
	
	
	@Override
	// 회원가입
	public int joinOK(LoginVO lvo) {
		return sqlSessionTemplate.insert("login.insert",lvo);
	}
	
	@Override
	// id 중복체크
	public String idChk(String u_id) {
		return sqlSessionTemplate.selectOne("login.idchk",u_id);
	}

	@Override
	public List<String> getId(String u_em) {
		return sqlSessionTemplate.selectList("login.idemail", u_em);
	}

	@Override
	public String kakaoChk(String u_kakao) {
		return sqlSessionTemplate.selectOne("login.kakaochk",u_kakao);
	}
	
	@Override
	public String naverChk(String u_naver) {
		return sqlSessionTemplate.selectOne("login.naverchk",u_naver);
	}

	@Override
	public LoginVO getDetail(String u_id) {
		return sqlSessionTemplate.selectOne("login.detail",u_id);
	}

	@Override
	public String idKakao(String u_kakao) {
		return sqlSessionTemplate.selectOne("login.idkakao",u_kakao);
	}

	@Override
	public String idNaver(String u_naver) {
		return sqlSessionTemplate.selectOne("login.idnaver", u_naver);
	}

	@Override
	public int update(LoginVO lvo) {
		return sqlSessionTemplate.update("login.update", lvo);
	}

	@Override
	public int updatePw(LoginVO lvo) {
		return sqlSessionTemplate.update("login.pwupdate", lvo);
	}

	
}
