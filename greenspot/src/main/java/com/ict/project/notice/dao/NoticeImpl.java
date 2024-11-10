package com.ict.project.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.project.comment.vo.CommentVO;
import com.ict.project.notice.vo.NoticeVO;



@Repository
public class NoticeImpl implements NoticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	

	@Override
	public int getTotalCount() {
		return sqlSessionTemplate.selectOne("notice.count");
	}

	@Override
	public List<NoticeVO> getBoardList(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("offset", offset);
		map.put("limit", limit);
		
		return sqlSessionTemplate.selectList("notice.list", map);
	}

	@Override
	public int getBoardInsert(NoticeVO gvo) {
		return sqlSessionTemplate.insert("notice.insert", gvo);
	}

	@Override
	public int getBoardHit(String idxn_idx) {
		return sqlSessionTemplate.update("notice.nt_hit", idxn_idx);
	}

	@Override
	public NoticeVO getBoardDetail(String idxn_idx) {
		return sqlSessionTemplate.selectOne("notice.nt_detail", idxn_idx);
	}

	@Override
	public int getAnsInsert(NoticeVO gvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getBoardDelete(String idxn_idx) {
		System.out.println("dao idx : " + idxn_idx);
		return sqlSessionTemplate.update("notice.delete", idxn_idx);
	}

	@Override
	public int getBoardUpdate(NoticeVO gvo) {
		return sqlSessionTemplate.update("notice.update", gvo);
	}

	@Override
	public List<CommentVO> getCommentList(String n_idx) {
		return sqlSessionTemplate.selectList("notice.clist", n_idx);
	}

	@Override
	public int getCommentInsert(CommentVO cvo) {
		return sqlSessionTemplate.insert("notice.cinsert", cvo);
	}

	@Override
	public int getCommentDelete(String idxc_idx) {
		return sqlSessionTemplate.update("notice.cdelete", idxc_idx);
	}

}
