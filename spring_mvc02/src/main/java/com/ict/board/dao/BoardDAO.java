package com.ict.board.dao;

import java.util.List;
import java.util.Map;

import com.ict.board.vo.BoardVO;

public interface BoardDAO {
    public int getTotalCount();
    public List<BoardVO> getBoardList(int offset, int limit);
    public int getBoardInsert(BoardVO bovo);
    public int getBoardHit(String bo_idx);
    public BoardVO getBoardDetail(String bo_idx);
    public int getLevUpdate(Map<String, Integer> map);
    public int getAnsInsert(BoardVO bovo);
    public int getBoardDelete(BoardVO bovo);
    public int getBoardUpdate(BoardVO bovo);
}
