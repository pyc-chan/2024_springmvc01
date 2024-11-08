package com.ict.project.popup.service;

import javax.servlet.http.HttpServletRequest;

import com.ict.project.popup.vo.PopupVO;

public interface FileService {
	public void fileUpload(HttpServletRequest request, PopupVO pvo);
	
	public void fileUpdate(HttpServletRequest request, PopupVO pvo);
}
