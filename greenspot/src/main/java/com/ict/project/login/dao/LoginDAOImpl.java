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
	// 네이버 로그인
	public int naverloginOK(String u_nav) {
		
		return 0;
	}
	
	@Override
	// 카카오 로그인 
	public int kakaologinOK(String u_kakao) {
		
		return 0;
	}
	
	@Override
	// 회원가입
	public int joinOK(LoginVO lvo) {
		
		return sqlSessionTemplate.insert("login.insert",lvo);
	}
	
	@Override
	// id 중복체크
	public String idChk(String u_id) {
		return sqlSessionTemplate.selectOne("login.check",u_id);
	}

	@Override
	public LoginVO loginOK(String u_id) {
		return sqlSessionTemplate.selectOne("login.loginok",u_id);
	}

	@Override
	public List<String> getId(String u_em) {
		return sqlSessionTemplate.selectList("login.idfind", u_em);
	}

	@Override
	public LoginVO pwFind(LoginVO lvo) {
		return sqlSessionTemplate.selectOne("login.pwfind", lvo);
	}

	@Override
	public String kakaoChk(String u_kakao) {
		return sqlSessionTemplate.selectOne("login.kakaochk",u_kakao);
	}
	
}
