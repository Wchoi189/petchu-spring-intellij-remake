package com.example.controller;
 
import java.util.HashMap;

import com.example.dao.FaqDAO;
import com.example.domain.Criteria;
import com.example.domain.FaqVO;
import com.example.domain.PageMaker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/faq")
public class FaqController {
	@Autowired
	FaqDAO dao;
	
	//���������
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
		model.addAttribute("pageName", "faq/list.jsp");
	
		return "/home";
	}
	@ResponseBody
	@RequestMapping("/list.json")
	public HashMap<String, Object> jsonList(Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		cri.setPerPageNum(5);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(6);

		map.put("list", dao.list(cri));
		map.put("pm", pm);

		return map;
	}
	//�Խñ��Է�ȭ��
	@RequestMapping("/insert")
	public String insert(Model model){
		model.addAttribute("pageName", "faq/insert.jsp");
		return "/home";
	}
	
	//�Խñ��Է�
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insertPost(FaqVO vo){
		dao.insert(vo);
		return "redirect:/faq/list";
	}
	 
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public void delete(int fno){
		dao.delete(fno);
		
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public void update(FaqVO vo){
	dao.update(vo); 
	}
}
