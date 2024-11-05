package com.ict.guestbook2.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ict.guestbook2.vo.ImgVO;

@RestController
public class SummernoteAjaxController {
	
	@RequestMapping(value = "/saveImg", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> saveImg(ImgVO imgVO, HttpServletRequest request) {
		try {
			Map<String, String> map = new HashMap<String, String>();
			MultipartFile file = imgVO.getS_file();
			String fname = null;
			if(file.getSize()>0) {
				String path = request.getSession().getServletContext().getRealPath("/resources/upload");
				UUID uuid = UUID.randomUUID();
				fname = uuid.toString()+"_"+file.getOriginalFilename();
				// 업로드
				file.transferTo(new File(path,fname));
			}
			
			map.put("path", "resources/upload");
			map.put("fanme", fname);
			return map;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
}
