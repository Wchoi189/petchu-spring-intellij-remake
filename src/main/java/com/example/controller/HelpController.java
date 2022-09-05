package com.example.controller;

import com.example.dao.HelpDAO;
import com.example.domain.HelpVO;

import com.example.service.StarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/help")
public class HelpController { //댓글 중복체크 컨트롤러
	
	@Autowired
	HelpDAO hdao;
	
	@Autowired
	StarService service;
	
	@RequestMapping(value="/updateHelp", method=RequestMethod.POST)
	public int updateHelp(HelpVO vo, Model model){
		int count=hdao.helpcheckcount(vo);
			if(service.helpcount(vo.getRid()) >= 0) {
				if(count == 0){ //처음으로 따봉 누를떄
					service.updatehelpcount(vo.getRid());
					hdao.inserthelp(vo);
					hdao.updatehelpcheck(vo);
				}else if(count == 1){ //따봉 취소 
					hdao.updatehelpcheckcancel(vo);
					service.updatehelpcountcancel(vo.getRid());
					hdao.deletehelp(vo);
				}
			}
		return count;
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public void inserthelp(HelpVO vo){
		int count=hdao.helpcheckcount(vo);
		if(count == 0){
			hdao.inserthelp(vo);
		}
		
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void deletehelp(HelpVO vo){
		hdao.deletehelp(vo);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public void updatehelpcheck(HelpVO vo){
		hdao.updatehelpcheck(vo);
	}
	
	@RequestMapping(value="/updatecancel", method=RequestMethod.POST)
	public void updatehelpcheckcancel(HelpVO vo){
		hdao.updatehelpcheckcancel(vo);
	}
	
	@RequestMapping("/count")
	public int helpcheck(HelpVO vo){
		int count=hdao.helpcheckcount(vo);
		return count;
	}
	
}
