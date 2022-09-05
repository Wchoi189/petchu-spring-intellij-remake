package com.example.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import java.io.File;
import java.nio.file.Files;
import java.util.HashMap;

@Controller
public class FileController {
	@Resource(name = "uploadPath")
	String path;

	// 이미지파일 브라우저에 출력
	@RequestMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName) throws Exception {
		ResponseEntity<byte[]> result = null;
		// display fileName이 있는 경우
		if (!fileName.equals("")) {
			System.out.println("......" + path);
			File file = new File(path + fileName);
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}
	
	//ckEditor file upload
	@RequestMapping(value="/ckupload", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> updatePost(MultipartHttpServletRequest multi) throws Exception{
		HashMap<String, Object> map=new HashMap<>();
		MultipartFile file=multi.getFile("upload");
		//파일업로드
		if(!file.isEmpty()) {
			String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + "ckupload/" + fileName));
			String fileUrl = "/display?fileName=ckupload/" + fileName; 
			
			map.put("uploaded", 1);
			map.put("fileName", fileName);
			map.put("url", fileUrl);
		}
		return map;
	}  
}
