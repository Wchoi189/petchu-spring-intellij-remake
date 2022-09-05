package com.example.controller;

import com.example.dao.PetDAO;
import com.example.domain.PetVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/pet")
public class PetController {
	
	@Autowired
	PetDAO dao;
	
	@RequestMapping("/petlist")
	public List<PetVO> petlist(HttpSession session){
		return dao.readPetList(session.getAttribute("id").toString());
	}
	@RequestMapping("/readpet")
	public PetVO readpet(int pno){
		return dao.readPet(pno);
	}

}
