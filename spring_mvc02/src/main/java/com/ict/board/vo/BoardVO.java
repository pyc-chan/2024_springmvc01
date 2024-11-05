package com.ict.board.vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	public String idx, writer, title, content, pwd, hit, b_groups, b_step, b_lev, regdate, f_name, active;
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	MultipartFile file_name;
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getB_groups() {
		return b_groups;
	}
	public void setB_groups(String b_groups) {
		this.b_groups = b_groups;
	}
	public String getB_step() {
		return b_step;
	}
	public void setB_step(String b_step) {
		this.b_step = b_step;
	}
	public String getB_lev() {
		return b_lev;
	}
	public void setB_lev(String b_lev) {
		this.b_lev = b_lev;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public MultipartFile getFile_name() {
		return file_name;
	}
	public void setFile_name(MultipartFile file_name) {
		this.file_name = file_name;
	}
}
