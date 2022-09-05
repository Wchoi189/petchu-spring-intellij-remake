package com.example.controller;

import com.example.dao.OrderlistDAO;
import com.example.dao.ProductDAO;
import com.example.dao.ReviewDAO;
import com.example.dao.UserDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ReviewVO;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
@Slf4j
@Controller
@RequestMapping("/review")
public class ReviewController {

	private static final Logger logger  = LoggerFactory.getLogger(ReviewController.class);
	@Autowired
	ReviewDAO dao;
	
	@Autowired
	OrderlistDAO odao;
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	ProductDAO pdao;
	
	@Resource(name="uploadPath")
	String path;
	
	//리뷰 입력페이지(출력)
			@RequestMapping("/update")
			public String update(Model model,int rid){
				model.addAttribute("vo",dao.updateread(rid));
				model.addAttribute("pageName", "review/update.jsp");
				
				return "/home";
			}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updatePost(ReviewVO vo, MultipartHttpServletRequest multi)throws Exception{
		System.out.println(".................file: "+vo.getRimage1());
		List<MultipartFile> fileList = multi.getFiles("uploadFile");
		int i = 0;
		System.out.println(".................if문 직전: "+vo.getRimage1());
		if(fileList.size() != 0){
			
				if(fileList.isEmpty()){
					System.out.println(".................if문 들어옴: "+vo.getRimage1());
					for(MultipartFile mf : fileList){
						String image = System.currentTimeMillis() + "_" + mf.getOriginalFilename();
							mf.transferTo(new File(path + image ));
							i++;
							System.out.println("..." + image + ":" + i + "번째" );
							
							if(i==1){
								vo.setRimage1(image);
								
							}
							if(i==2){
								vo.setRimage2(image);
							}	
					}
				}
			
		}
		
		dao.update(vo);
		System.out.println(vo.toString());
		return "redirect:/review/list";
	
	}
	//리뷰 delete
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public void delete(int rid){
		dao.delete(rid);
	}
	//리뷰 리드페이지
	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName", "review/list.jsp");
	
		return "/home";
	}
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String,Object> readJOSN(Criteria cri){
		HashMap<String,Object> map = new HashMap<>();
		cri.setPerPageNum(3);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(3);
		pm.setTotalCount(dao.count());
		
		map.put("pm", pm);
		map.put("cri", cri);
		map.put("join", dao.join(cri));
		return map;
		
	}
	//리뷰 입력페이지(출력)
		@GetMapping("/insert-review")
		public String insert(Model model,int pno, int bno){
			log.debug("review insert controller..");
			model.addAttribute("vo",odao.read(pno,bno));
			model.addAttribute("pageName", "review/insert.jsp");
			return "/home";
		}
		
		
		@PostMapping("/insert")
		public String insert(ReviewVO vo, MultipartHttpServletRequest multi, String uid, Integer pno){
			System.out.println(vo.getUid()+"이게 말이 되냐고");

			vo.setUid(uid);
			vo.setPno(pno);
			int result = dao.user_review_count(uid, vo.getBno());
			System.out.println(vo.toString()+"\n"+result+"<<<<<<<<<<<<");
			if(result>0){
				System.out.println("1개 이상 존재");
				return  "redirect:insert";	//값이 1개 이상일 때
			}
//			System.out.println(vo.toString()+"\ntttttttttttteeeeeeeeeest======="+vo.getUid());

			List<MultipartFile> fileList = multi.getFiles("file_input");

			int i=0;
			if(fileList.size()!=0){
				for(MultipartFile mf : fileList){
					String image = "review/shopproduct/" + System.currentTimeMillis() + "_" + mf.getOriginalFilename();

					try {
						mf.transferTo(new File(path + image));
						i++;
						System.out.println("갸아아아아아아악" + image + ":" + i + "번째");
						if(i==1){
							vo.setRimage1(image);
						}
						if(i==2){
							vo.setRimage2(image);
						}
						if(i==3){
							vo.setRimage3(image);
						}
						dao.insert(vo);
						System.out.println(vo.toString());
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}

//			return "0개";


			return "redirect:/review/list";
		}

	//orderlist/review 목록 json 데이터 생성
	@RequestMapping("/reviewable.json")
	@ResponseBody //데이터를 리턴
	public HashMap<String,Object> reviewableJSON(Criteria cri, int bno){
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(3);
		pm.setTotalCount(odao.count(cri));
		
		map.put("pm", pm);
		map.put("review", dao.list(bno));
		map.put("join", odao.join(cri));
		return map;

	}
	//리뷰 페이지
	//orderlist의 값과 user의 name을 가져오고 싶음
	@RequestMapping("/reviewable")
	public String reviewable(Model model,Criteria cri){ //model에 출력하고자하는 페이지를 담아줌
		//model.addAttribute("name",udao.read(session.getAttribute("id").toString()));
		//session.setAttribute("username", "red"); //로그인프로그램했다고 가정했다 생각하고
		cri.setPerPageNum(5);
		//cri.setPage(1);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(odao.count(cri));

		model.addAttribute("pm", pm);
		model.addAttribute("page",cri.getPage());
		model.addAttribute("join" ,odao.join(cri));
		model.addAttribute("pageName", "review/reviewable.jsp");
	
		return "/home";
	}
	
	@RequestMapping("/idReview.json")
	public String idReview(Model model,Criteria cri){
		return "/home";
	}
	
	@RequestMapping("/reviewUpdate")
	@ResponseBody
	public void reviewUpdate(ReviewVO vo){
		dao.reviewUpdate(vo);
	}

}