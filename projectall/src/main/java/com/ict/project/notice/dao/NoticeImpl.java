package com.ict.project.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.project.notice.vo.NoticeVO;



@Repository
public class NoticeImpl implements NoticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	

	@Override
	public int getTotalCount() {
		return sqlSessionTemplate.selectOne("notice.nt_count");
	}

	@Override
	public List<NoticeVO> getBoardList(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("offset", offset);
		map.put("limit", limit);
		
		return sqlSessionTemplate.selectList("notice.nt_list", map);
	}

	@Override
	public int getBoardInsert(NoticeVO gvo) {
		return sqlSessionTemplate.insert("notice.nt_insert", gvo);
	}

	@Override
	public int getBoardHit(String n_idx) {
		return sqlSessionTemplate.update("notice.nt_hit", n_idx);
	}

	@Override
	public NoticeVO getBoardDetail(String n_idx) {
		return sqlSessionTemplate.selectOne("notice.nt_detail", n_idx);
	}

	@Override
	public int getBoardDelete(String n_idx) {
		System.out.println("dao idx : " + n_idx);
		return sqlSessionTemplate.update("notice.nt_delete", n_idx);
	}

	@Override
	public int getBoardUpdate(NoticeVO gvo) {
		return sqlSessionTemplate.update("notice.update", gvo);
	}


}
