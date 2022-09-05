package com.example.controller;

import com.example.dao.ReserveDAO;
import com.example.dao.ServiceCoDAO;
import com.example.dao.UserDAO;
import com.example.domain.ReserveVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequestMapping("/reserve")
public class ReserveController {

	@Autowired
	ReserveDAO dao;
	
	@Autowired
	ServiceCoDAO sdao;
	
	@Autowired
	UserDAO udao;
	
	@RequestMapping("/reservePage")
	public String reservePage(Model model, String id, int scno){
		model.addAttribute("svo", sdao.read(scno));
		model.addAttribute("uvo", udao.read(id));
		model.addAttribute("pageName","hoschool/reserve.jsp");
		return "/home";
	}
	@RequestMapping("/checkDateList")
	@ResponseBody
	public HashMap<String, Object> checkDateList(String checkin, String checkout){
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", dao.checkDateList(checkin, checkout));
		return map; 
	}
	@RequestMapping("/reserveInsert")
	@ResponseBody
	public void reserveInsert(ReserveVO vo){
		dao.insert(vo);

	}
	@RequestMapping("/myreserveList")
	public String myreserveList(Model model, String id){
		model.addAttribute("sideMenu","mypageSidemenu.jsp");
		model.addAttribute("pageName", "user/myreserveList.jsp");
		return "/home";
	}
	@RequestMapping("/myreserveList.json")
	@ResponseBody
	public HashMap<String, Object> myreserveList(HttpSession session){
		HashMap<String, Object> map = new HashMap<>();
		String id = session.getAttribute("id").toString();
		map.put("list", dao.list(id));
		map.put("oldlist", dao.oldlist(id));
		return map;
	}
	@RequestMapping("/myReserve.json")
	@ResponseBody
	public ReserveVO myReserve(int rno){
		
		return dao.read(rno);
	}
	@RequestMapping(value="/updateReserve", method=RequestMethod.POST)
	@ResponseBody
	public void updateReserve(ReserveVO vo){
		dao.updateReserve(vo);

	}
	@RequestMapping(value="/ReserveEdit", method=RequestMethod.POST)
	@ResponseBody
	public void ReserveEdit(ReserveVO vo){
		dao.ReserveEdit(vo);

	}
	@RequestMapping("/comReserveList")
	public String comReserveList(Model model, String id){
		model.addAttribute("sideMenu","mypageSidemenu.jsp");
		model.addAttribute("pageName", "user/comReserveList.jsp");
		return "/home";
	}
	@RequestMapping("/comReserveList.json")
	@ResponseBody
	public HashMap<String, Object> comOldReserveList(String id, String keyword){
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("company", dao.myCompany(id));
		map.put("list", dao.comList(id,keyword));
		map.put("oldlist", dao.comOldlist(id,keyword));
		return map;
	}
}
