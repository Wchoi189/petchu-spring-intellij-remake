package com.example.controller;

import com.example.dao.HoschoolDAO;
import com.example.dao.RateDAO;
import com.example.dao.ReserveDAO;
import com.example.dao.UserDAO;
import com.example.domain.*;
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
import java.util.HashMap;
import java.util.List;


@Controller
@RequestMapping("/hoschool")
public class HoschoolController {
	@Autowired
	HoschoolDAO dao;
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	RateDAO rdao;
	
	@Autowired
	ReserveDAO vdao;
	
	
	@Resource(name="uploadPath")
	String  path;
	
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<RateVO> rvo = rdao.avgRate();
		model.addAttribute("rlist", rvo);
		model.addAttribute("pageName", "hoschool/hoschool.jsp");
		return "/home";
	}
	@RequestMapping("/read")
	public String read(Model model,int scno,String id, String checkout, String checkin, HttpSession session) {
		model.addAttribute("avgRate", rdao.avgRateRead(scno));
		session.setAttribute("checkin", checkin);
		session.setAttribute("checkout", checkout);
		model.addAttribute("vo",dao.read(scno));
		model.addAttribute("uvo",udao.read(id));
		model.addAttribute("pageName", "hoschool/hosread.jsp");
		return "/home";
	}
	@RequestMapping(value="/avgRate", method=RequestMethod.POST)
	@ResponseBody
	public double avgRate(int scno){
		return rdao.avgRateRead(scno);
	}
	@RequestMapping("/reviewList")
	@ResponseBody
	public HashMap<String, Object> reviewList(int scno, int start, int perPageNum){
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", rdao.reviewList(scno, start, perPageNum));
		map.put("count", rdao.reviewCount(scno));
		return map;
	}
	@RequestMapping(value="/rateInsert", method=RequestMethod.POST)
	public String rateInsert(RateVO vo) {
		rdao.rateInsert(vo);
		return "redirect:/hoschool/read?scno="+vo.getScno()+"&id=" + vo.getId();
	}

	@RequestMapping("/myList")
	public String myList(Model model, String id) {
		model.addAttribute("list", dao.myList(id));
		model.addAttribute("pageName", "user/mylist.jsp");
		return "/home";
	}
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object> listJson(Criteria cri, String checkin, String checkout) {
		HashMap<String, Object> map = new HashMap<>();
		PageMaker pm = new PageMaker();
		ReserveVO vo = new ReserveVO();
		
		vo.setKeyword(cri.getKeyword());
		vo.setSort(cri.getSort());
		vo.setCheckin(checkin);
		vo.setCheckout(checkout);

		map.put("list", dao.list(vo));

		System.out.println("............................"+map);
		return map;
	}
	@RequestMapping("/insert")
	public String insert(Model model) {
		model.addAttribute("pageName", "hoschool/hosInsert.jsp");
		return "/home";
	}
	
	@RequestMapping("/mylist.json")
	@ResponseBody
	public List<ServiceVO> mylist(String id) {
		return dao.myList(id);
	}
	
	@RequestMapping(value="/reviewAllCount", method=RequestMethod.POST)
	@ResponseBody
	public int reviewAllCount(String id, int scno) {
		return dao.reviewAllCount(scno, id);
	}
	
	@RequestMapping(value="/reviewWriteCount", method=RequestMethod.POST)
	@ResponseBody
	public int reviewWriteCount(String id, int scno) {
		return dao.reviewWriteCount(scno, id);
	}
	
	
	
	@RequestMapping(value="/servicedelete", method=RequestMethod.POST)
	public String servicedelete(String id,ServiceVO vo,int scno) {
		dao.delete(scno);
		return "redirect:/hoschool/myList?id="+vo.getId();
	}
	
	@RequestMapping(value="/serviceInsert", method=RequestMethod.POST)
	public String serviceInsert(ServiceVO vo, MultipartHttpServletRequest multi)throws Exception {
		
		System.out.println("............................컨트롤러 넘어옴");
		MultipartFile file=multi.getFile("file");
		MultipartFile backfile=multi.getFile("backfile");
		if(!file.isEmpty()){
			new File(path + vo.getScimage()).delete(); 
			String image= "pet/" + System.currentTimeMillis()+"_"+file.getOriginalFilename();
			System.out.println("................................scimage:"+file.getOriginalFilename());
			file.transferTo(new File(path + image));
			vo.setScimage(image);
		}
		if(!backfile.isEmpty()){
			new File(path + vo.getBgimage()).delete(); 
			String image= "pet/" + System.currentTimeMillis()+"_"+backfile.getOriginalFilename();
			System.out.println("................................bgimage:"+backfile.getOriginalFilename());
			backfile.transferTo(new File(path + image));
			vo.setBgimage(image);
		}
		System.out.println("............................컨트롤러 지나감");
		dao.insert(vo);
		return "redirect:/user/mypage?id="+vo.getId();
	}
	
	@RequestMapping(value="/serviceUpdate", method=RequestMethod.POST)
	public String serviceUpdate(ServiceVO vo, MultipartHttpServletRequest multi)throws Exception {
		MultipartFile file=multi.getFile("file");
		MultipartFile backfile=multi.getFile("backfile");
		if(!file.isEmpty()){
			new File(path + vo.getScimage()).delete(); 
			String image= "pet/" + System.currentTimeMillis()+"_"+file.getOriginalFilename();
			System.out.println("................................scimage:"+file.getOriginalFilename());
			file.transferTo(new File(path + image));
			vo.setScimage(image);
		}
		if(!backfile.isEmpty()){
			new File(path + vo.getBgimage()).delete(); 
			String image= "pet/" + System.currentTimeMillis()+"_"+backfile.getOriginalFilename();
			System.out.println("................................bgimage:"+backfile.getOriginalFilename());
			backfile.transferTo(new File(path + image));
			vo.setBgimage(image);
		}
		
		dao.update(vo);
		return "redirect:/hoschool/myList?id="+vo.getId();
		
	}
}
