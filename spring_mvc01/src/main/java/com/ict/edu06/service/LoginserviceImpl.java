package com.ict.edu06.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.edu06.dao.LoginDAO;
import com.ict.edu06.vo.LoginVO;

@Service
public class LoginserviceImpl implements LoginService{
	
	@Autowired
	private LoginDAO loginDAO;
	@Override
	public LoginVO LoginChk(LoginVO lvo) throws Exception {
		return loginDAO.LoginChk(lvo);
	}

	@Override
	public int LoginJoin(LoginVO lvo) throws Exception {
		
		return loginDAO.LoginJoin(lvo);
	}

}
