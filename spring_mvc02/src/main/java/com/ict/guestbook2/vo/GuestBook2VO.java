package com.ict.guestbook2.vo;

import org.springframework.web.multipart.MultipartFile;

public class GuestBook2VO {
	
	// DB와 같은 이름
	private String gb2_idx, gb2_name, gb2_subject, gb2_email, gb2_pw, gb2_content, gb2_f_name, gb2_regdate;
	// 파라미터와 같은 이름
	private MultipartFile gb2_file_name; 
	
	public MultipartFile getGb2_file_name() {
		return gb2_file_name;
	}

	public void setGb2_file_name(MultipartFile gb2_file_name) {
		this.gb2_file_name = gb2_file_name;
	}

	public String getGb2_idx() {
		return gb2_idx;
	}

	public void setGb2_idx(String gb2_idx) {
		this.gb2_idx = gb2_idx;
	}

	public String getGb2_name() {
		return gb2_name;
	}

	public void setGb2_name(String gb2_name) {
		this.gb2_name = gb2_name;
	}

	public String getGb2_subject() {
		return gb2_subject;
	}

	public void setGb2_subject(String gb2_subject) {
		this.gb2_subject = gb2_subject;
	}

	public String getGb2_email() {
		return gb2_email;
	}

	public void setGb2_email(String gb2_email) {
		this.gb2_email = gb2_email;
	}

	public String getGb2_pw() {
		return gb2_pw;
	}

	public void setGb2_pw(String gb2_pw) {
		this.gb2_pw = gb2_pw;
	}

	public String getGb2_content() {
		return gb2_content;
	}

	public void setGb2_content(String gb2_content) {
		this.gb2_content = gb2_content;
	}

	public String getGb2_f_name() {
		return gb2_f_name;
	}

	public void setGb2_f_name(String gb2_f_name) {
		this.gb2_f_name = gb2_f_name;
	}

	public String getGb2_regdate() {
		return gb2_regdate;
	}

	public void setGb2_regdate(String gb2_regdate) {
		this.gb2_regdate = gb2_regdate;
	}
}
