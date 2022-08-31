package com.example.controller;


import java.io.File;
import javax.annotation.Resource;
import com.example.dao.PetDAO;
import com.example.domain.PetVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/mypet")
public class Mypetcontroller {
	@Resource(name="uploadPath")
	String  path;
	
	@Autowired
	PetDAO dao;
	
	@RequestMapping("/mypetInsert")
	public String mypetinsert(Model model, PetVO vo){
		model.addAttribute("sideMenu","mypageSidemenu.jsp");
		model.addAttribute("pageName","pet/mypetInsert.jsp");
		return "/home";
	}
	
	@RequestMapping("/mypetlist")
	public String mypetlist(Model model, String id){
		model.addAttribute("list",dao.readPetList(id));
		model.addAttribute("sideMenu","mypageSidemenu.jsp");
		model.addAttribute("pageName","pet/mypetlist.jsp");
		return "/home";
	}
	
	@RequestMapping("/mypetRead.json")
	@ResponseBody
	public PetVO read(int pno){
		return dao.readPet(pno);
	}
	
	
	@RequestMapping(value="/updatePet", method=RequestMethod.POST)
	@ResponseBody
	public void updatePet(PetVO vo, MultipartHttpServletRequest multi) throws Exception{
		
		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()){
			new File(path + vo.getPimage()).delete(); 
			String image= "pet/" + System.currentTimeMillis()+"_"+file.getOriginalFilename();
			file.transferTo(new File(path + image));
			vo.setPimage(image);
			System.out.println("........................."+vo.getPimage());
		}
		dao.updatePet(vo);
	}
	
	@RequestMapping(value="/insertPet", method=RequestMethod.POST)

	public String insertPet(PetVO vo, MultipartHttpServletRequest multi) throws Exception{
		MultipartFile file= multi.getFile("file");		
		String image = "pet/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
		file.transferTo(new File(path + image));
		vo.setPimage(image);
		dao.insertPet(vo);
		return "redirect:mypetlist?id="+vo.getId();
	}
}
