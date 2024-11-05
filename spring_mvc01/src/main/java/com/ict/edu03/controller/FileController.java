package com.ict.edu03.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.edu03.vo.FileVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class FileController {

	@GetMapping("/f_up1")
	public ModelAndView fileGetUp() {
		return new ModelAndView("day03/error");
	}

	// cos 라이브러리 사용
	@PostMapping("/f_up1")
	public ModelAndView fileUp(HttpServletRequest request, HttpServletResponse response) {
		try {

			ModelAndView mv = new ModelAndView("day03/result");
			// 실전에서는 프로젝트가 아닌 다른 곳에 저장할 수도 있다. (AWS의 S3나 서버의 특정위치)
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			// cos 라이브러리를 사용하면 request 대신에 MultipartRequest를 사용한다.
			MultipartRequest mr = new MultipartRequest(request, // request 대신하기 위해서 request를 받는다.
					path, // 저장위치
					// 1024(KB)*1024(MB)*1024(GB)*1024(TB)
					500 * 1024 * 1024, // 업로드 최대 크기 : 500MB
					"utf-8", // 한글 처리
					new DefaultFileRenamePolicy()); // 같은이름의 파일이 있을때 이름 뒤에 숫자를 붙여 업로드 한다.

			// String name = request.getParameter("name");
			// System.out.println("name : " + name); // null 나옴

			String name = mr.getParameter("name");
			String f_name = mr.getFilesystemName("f_name"); // 저장 당시 이름
			String file_type = mr.getContentType("f_name");

			// 해당 파일 정보추출
			File file = mr.getFile("f_name");
			long size = file.length() / 1024; // 파일 크기를 KB로 나타냄
			// E : 요일
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss E");

			// lastModified : 최종 수정 날짜
			String lastday = sdf.format(file.lastModified());

			mv.addObject("name", name);
			mv.addObject("f_name", f_name);
			mv.addObject("file_type", file_type);
			mv.addObject("size", size);
			mv.addObject("lastday", lastday);

			return mv;
		} catch (Exception e) {
			return new ModelAndView("day03/error");
		}
	}

	@GetMapping("/down")
	public void fileDown(HttpServletRequest request, HttpServletResponse response) {
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			String f_name = request.getParameter("f_name");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/" + f_name);

			f_name = URLEncoder.encode(f_name, "utf-8");
//			String r_path = URLEncoder.encode(path,"utf-8");

			// 브라우저 설정
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + f_name);

			// 실제 다운로드하기
			File file = new File(new String(path.getBytes(), "utf-8"));
			int b;
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			bos = new BufferedOutputStream(response.getOutputStream());

			while ((b = bis.read()) != -1) {
				bos.write(b);
				bos.flush();
			}

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				bos.close();
				bis.close();
				fis.close();
			} catch (Exception e2) {

			}
		}
	}

	@GetMapping("/f_up2")
	public ModelAndView file2GetUp() {
		return new ModelAndView("day03/error");
	}

	@PostMapping("/f_up2")
	public ModelAndView fileUp2(@RequestParam("f_name") MultipartFile fname, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("day03/result");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");

			// 파일 업로드할 때의 이름만 존재한다.
			// 즉 같은 이름의 파일을 업로드하면 업로드가 되지 않는다.
			// 파일이름 뒤에 id와 업로드 날짜를 붙인다.
			// 아니면 UUID를 생성해서 붙인다.
			UUID uuid = UUID.randomUUID();
			String f_name = uuid.toString() + "_" + fname.getOriginalFilename();

			String file_type = fname.getContentType();
			long size = fname.getSize() / 1024;
			// 실제 올리는 작업을 하자 (FileCopyUtils.copy(byte[] in, File out)) : byte타입배열을 지정한 File에
			// 복사한다.
			// 올린 파일을 byte[]로 만듬
			byte[] in = fname.getBytes();

			// 업로드할 장소와 저장 이름
			File out = new File(path, f_name);

			// file 복사 (upload = down)
			FileCopyUtils.copy(in, out);
			
			long lastModified = out.lastModified();
			// E : 요일
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss E");
			// lastModified : 최종 수정 날짜
			String lastday = sdf.format(lastModified);

			String name = request.getParameter("name");
			mv.addObject("name", name);
			mv.addObject("f_name", f_name);
			mv.addObject("file_type", file_type);
			mv.addObject("size", size);
			mv.addObject("lastday", lastday);

			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("day03/error");
		}

	}
	@GetMapping("/down2")
	public void fileDown2(HttpServletRequest request, HttpServletResponse response) {
		try {
			String f_name = request.getParameter("f_name");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/"+f_name);
			
			String age = request.getParameter("age");
			
			
			String r_path = URLEncoder.encode(f_name,"utf-8");
			
			
			System.out.println(f_name);
			// 브라우저 설정
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + r_path);
			
			// byte[] in
			File file = new File(new String(path.getBytes(), "utf-8"));
			FileInputStream in = new FileInputStream(file);
			
			// file out
			OutputStream out = response.getOutputStream();
			
			FileCopyUtils.copy(in, out);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	@GetMapping("/f_up3")
	public ModelAndView file3GetUp() {
		return new ModelAndView("day03/error");
	}

	@PostMapping("/f_up3")
	public ModelAndView fileUp3(
			FileVO fvo, 
			HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("day03/result");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");

			// 파일 업로드할 때의 이름만 존재한다.
			// 즉 같은 이름의 파일을 업로드하면 업로드가 되지 않는다.
			// 파일이름 뒤에 id와 업로드 날짜를 붙인다.
			// 아니면 UUID를 생성해서 붙인다.
			UUID uuid = UUID.randomUUID();
			
			MultipartFile fname = fvo.getF_name();
			String f_name = uuid.toString() + "_" + fname.getOriginalFilename();
			
			String age = request.getParameter("age");
			String file_type = fname.getContentType();
			long size = fname.getSize() / 1024;

			// 실제 올리는 작업을 하자 (FileCopyUtils.copy(byte[] in, File out)) : byte타입배열을 지정한 File에
			// 복사한다.
			// 올린 파일을 byte[]로 만듬
			byte[] in = fname.getBytes();

			// 업로드할 장소와 저장 이름
			File out = new File(path, f_name);

			// file 복사 (upload = down)
			FileCopyUtils.copy(in, out);
			
			String name = fvo.getName();
			
			
			long lastModified = out.lastModified();
			// E : 요일
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss E");
			// lastModified : 최종 수정 날짜
			String lastday = sdf.format(lastModified);
			

			mv.addObject("name", name);
			mv.addObject("f_name", f_name);
			mv.addObject("file_type", file_type);
			mv.addObject("size", size);
			mv.addObject("lastday", lastday);

			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("day03/error");
		}

	}
	
	@GetMapping("/down3")
	public void fileDown3(HttpServletRequest request, HttpServletResponse response) {
		try {
			String f_name = request.getParameter("f_name");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/"+f_name);
			
			String age = request.getParameter("age");
			
			
			
			f_name = URLEncoder.encode(f_name, "utf-8");
			
			System.out.println(f_name);
			// 브라우저 설정
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + f_name);
			
			// byte[] in
			File file = new File(new String(path.getBytes(), "utf-8"));
			FileInputStream in = new FileInputStream(file);
			
			// file out
			OutputStream out = response.getOutputStream();
			
			FileCopyUtils.copy(in, out);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
}
