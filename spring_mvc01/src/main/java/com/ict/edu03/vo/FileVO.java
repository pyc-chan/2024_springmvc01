package com.ict.edu03.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	// DB 컬럼과 같아야 한다.(fname)
	private String name, fname;
	// 파라미터와 같은 이름으로 만들어야 한다.
	private MultipartFile f_name;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public MultipartFile getF_name() {
		return f_name;
	}
	public void setF_name(MultipartFile f_name) {
		this.f_name = f_name;
	}
}
