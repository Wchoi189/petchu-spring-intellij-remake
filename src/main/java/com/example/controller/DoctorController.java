package com.example.controller;

import com.example.dao.DoctorRequestDAO;
import com.example.dao.UserRequestDAO;
import com.example.domain.DoctorRequestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import java.io.File;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	@Resource(name="uploadPath")
	String  path;
	
	@Autowired
	UserRequestDAO udao;
	
	@Autowired
	DoctorRequestDAO ddao;
	
	@RequestMapping(value="/replyRequest", method=RequestMethod.POST)
	public String replyRequeset(DoctorRequestVO vo, MultipartHttpServletRequest multi) throws Exception{
		if(vo.getDno()!=0){
			MultipartFile file= multi.getFile("file");
			if(file.getOriginalFilename()!=null){
				String filename = "request/doctor/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
				file.transferTo(new File(path + filename));
				vo.setDrfile(filename);
			}
			ddao.replyRequest(vo);
		}
		return "redirect:/";
	}
	@ResponseBody
	@RequestMapping(value="/ischecked", method=RequestMethod.POST)
	public void ischecked(int rno){
	}
}
