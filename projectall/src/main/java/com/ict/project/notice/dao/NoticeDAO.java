package com.ict.project.notice.dao;

import java.util.List;

import com.ict.project.notice.vo.NoticeVO;



public interface NoticeDAO {
    public int getTotalCount();
    public List<NoticeVO> getBoardList(int offset, int limit);
    public int getBoardInsert(NoticeVO nvo);
    public int getBoardHit(String n_idx);
    public NoticeVO getBoardDetail(String n_idx);
    public int getBoardDelete(String n_idx);
    public int getBoardUpdate(NoticeVO nvo);


}
