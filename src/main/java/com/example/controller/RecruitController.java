package com.example.controller;

import com.example.dao.RecruitDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.RecruitVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequestMapping("/recruit")
public class RecruitController {
	
	@Autowired
	RecruitDAO dao;
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public void update(RecruitVO vo){
		dao.update(vo);
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public void delete(int bno){
		dao.delete(bno);
	}
	@RequestMapping("/read")
	public String read(Model model, int bno){
		model.addAttribute("vo", dao.read(bno));
		model.addAttribute("pageName", "recruit/read.jsp");
		return "/home";
	}
	//insert
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insertPost(RecruitVO vo){
		dao.insert(vo);
		System.out.println(vo.toString());
		return "redirect:/recruit/list";
	}
	@RequestMapping("/insert")
	public String insert(Model model){
		model.addAttribute("pageName","recruit/insert.jsp");
		return "/home";
	}
	
	
	
	//목록페이지
		@RequestMapping("/list")
		public String list(Model model, Criteria cri){
			cri.setPerPageNum(5);
			PageMaker pm = new PageMaker();
			pm.setCri(cri);
			pm.setDisplayPageNum(6);

			model.addAttribute("pm", pm);
			model.addAttribute("page", cri.getPage());
			model.addAttribute("keyword", cri.getKeyword());

			model.addAttribute("list", dao.list(cri));
			model.addAttribute("pageName", "recruit/list.jsp");
		
			return "/home";
		}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object>listJSON (Criteria cri){
		HashMap<String,Object> map = new HashMap<>();
		cri.setPerPageNum(10);
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(6);
		
		map.put("pm", pm);
		map.put("list", dao.list(cri));
		return map;
		
		
	}

}
