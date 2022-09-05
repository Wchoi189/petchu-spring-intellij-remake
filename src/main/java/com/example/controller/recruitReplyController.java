package com.example.controller;

import com.example.dao.RecruitReplyDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.RecruitReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
@Controller
@RequestMapping("/recruitReply")
public class recruitReplyController {
	@Autowired
	RecruitReplyDAO dao;
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public void insert(RecruitReplyVO vo){
		dao.insert(vo);
	}

	
	@RequestMapping(value="/update", method=RequestMethod.POST)
		public void update(RecruitReplyVO vo){
		dao.update(vo);
	}
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public void delete(int rno){
		dao.delete(rno);
	}
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object> listJSON(int bno, Criteria cri){
		HashMap<String, Object> map=new HashMap<>();
		cri.setPerPageNum(5);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(30);
		
		map.put("pm", pm);
		map.put("list", dao.list(bno, cri));
		return map;
	}
	
	
	
	
}
