package com.ict.edu02.service;

import org.springframework.stereotype.Service;

import com.ict.edu02.vo.CalcVO;

// 객체 생성된다.
@Service
public class CalcService {
	
	// 정보를 받아서 계산하는 메서드를 만든다.
	public int getCalc(CalcVO cvo) {
		int result = 0;
		int su1 = Integer.parseInt(cvo.getS1());
		int su2 = Integer.parseInt(cvo.getS2());
		
		switch(cvo.getOp()) {
		case "+" : result = su1 + su2; break;
		case "-" : result = su1 - su2; break;
		case "*" : result = su1 * su2; break;
		case "/" : result = su1 / su2; break;
		
		}
		
		return result;
	}
}
