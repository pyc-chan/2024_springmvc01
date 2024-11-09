package com.ict.project.comment.vo;

public class CommentVO {
	
	// 게시판마다 변수명 확인해서 작성하기
	private String c_idx, u_idx, c_con, c_dat, c_bor, c_ref;

	public String getC_idx() {
		return c_idx;
	}

	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public String getC_con() {
		return c_con;
	}

	public void setC_con(String c_con) {
		this.c_con = c_con;
	}

	public String getC_dat() {
		return c_dat;
	}

	public void setC_dat(String c_dat) {
		this.c_dat = c_dat;
	}

	public String getC_bor() {
		return c_bor;
	}

	public void setC_bor(String c_bor) {
		this.c_bor = c_bor;
	}

	public String getC_ref() {
		return c_ref;
	}

	public void setC_ref(String c_ref) {
		this.c_ref = c_ref;
	}
	
	// 변수 다 작성후엔 getter/setter 생성 
}
