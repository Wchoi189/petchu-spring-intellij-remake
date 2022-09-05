package com.example.controller;

import com.example.dao.ServiceCoDAO;
import com.example.domain.ServiceCoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/serviceCo")
public class ServiceCoController {
	@Autowired
	ServiceCoDAO dao;
	@Resource(name = "uploadPath")
	String path;

	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName","serviceCo/list.jsp");
		return "/home";
	}
	@RequestMapping("/list.json")
	@ResponseBody
	public List<ServiceCoVO> listJSON(HttpSession session){
		List<ServiceCoVO> list=dao.list(session.getAttribute("id").toString());
		
		

		return list;
	}

	@RequestMapping("/insert")
	public String insert(Model model){
		model.addAttribute("pageName","serviceCo/insert.jsp");
		return "/home";
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(ServiceCoVO vo,MultipartHttpServletRequest multi ,HttpSession session) throws Exception {

		MultipartFile file = multi.getFile("file");
		if (!file.isEmpty()) {
			String image = "serviceCo/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + image));
			vo.setScimage(image);
			System.out.println(vo.toString());
			dao.insert(vo);
		}else{
			dao.insert(vo);
		}
		return "redirect:/serviceCo/list";
	}
	
	@RequestMapping("/update")
	public String update(Model model,int scno){
		model.addAttribute("vo",dao.read(scno));
		model.addAttribute("pageName","serviceCo/update.jsp");
		
		return "/home";

		
	}
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updatePost(ServiceCoVO vo, MultipartHttpServletRequest multi) throws Exception{

		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()){
			new File(path + vo.getScimage()).delete();
			String image= "serviceCo/" + System.currentTimeMillis()+"_"+file.getOriginalFilename();
			file.transferTo(new File(path + image));
			vo.setScimage(image);
		}
		dao.update(vo);
		return "redirect:/serviceCo/list";
	}
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public void delete(int scno){
		dao.delete(scno);
		
	}
}
