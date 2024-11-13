package com.ict.project.sub4_2.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ict.project.sub4_2.vo.Sub4_2VO;

@Service
public class Sub4_2ServiceImpl {
	
	
	
	public List<Sub4_2VO> getSubList(List<Sub4_2VO> list, int offset, int limit){
		// 유효성 검사
        if (offset < 0 || limit < 0 || offset >= list.size()) {
            return null; // 빈 리스트 반환
        }

        // endIndex 계산
        int endIndex = Math.min(offset + limit, list.size());
        return list.subList(offset, endIndex);
	}
}
