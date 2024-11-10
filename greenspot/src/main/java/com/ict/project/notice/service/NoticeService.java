package com.ict.project.notice.service;

import java.util.List;

import com.ict.project.comment.vo.CommentVO;
import com.ict.project.notice.vo.NoticeVO;



public interface NoticeService {
    public int getTotalCount();
    public List<NoticeVO> getBoardList(int offset, int limit);
    public int getBoardInsert(NoticeVO gvo);
    public int getBoardHit(String c_idx);
    public NoticeVO getBoardDetail(String c_idx);
    public int getAnsInsert(NoticeVO gvo);
    public int getBoardDelete(String c_idx);
    public int getBoardUpdate(NoticeVO gvo);
    
    // 댓글 가져오기
    public List<CommentVO> getCommentList(String c_idx);
    
    // 댓글 삽입
    public int getCommentInsert(CommentVO cvo);
    
    // 댓글 삭제
    public int getCommentDelete(String c_idx);    
}
