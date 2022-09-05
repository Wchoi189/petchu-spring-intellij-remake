package com.example.controller;

import com.example.dao.*;
import com.example.domain.*;
import com.example.service.kakaoAPI;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserDAO dao;

	@Autowired
	PetDAO pdao;
	
	@Autowired
	BeautyDAO bdao;
	
	@Autowired
	CleaningDAO cdao;
	
	@Autowired
	LessonDAO ldao;
	
	@Resource(name = "uploadPath")
	String path;
	
	@Autowired
	private kakaoAPI kakao;

	@Autowired
	BCryptPasswordEncoder passEncoder;

	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("pageName", "user/login.jsp");
		return "/home";
	}
	@RequestMapping("/mypage")
	public String mypage(Model model,String id) {
		model.addAttribute("vo",dao.read(id));
		model.addAttribute("sideMenu","mypageSidemenu.jsp");
		model.addAttribute("pageName", "user/mypage.jsp");
		return "/home";
	}
	@RequestMapping("/passchk")
	public String passchk(Model model,String id) {
		model.addAttribute("sideMenu","mypageSidemenu.jsp");
		model.addAttribute("vo",dao.read(id));
		model.addAttribute("pageName", "user/passchk.jsp");
		return "/home";
	}
	
	@RequestMapping("/deletechk")
	public String deletechk(Model model,String id) {
		model.addAttribute("sideMenu","mypageSidemenu.jsp");
		model.addAttribute("vo",dao.read(id));
		model.addAttribute("pageName", "user/deletechk.jsp");
		return "/home";
	}
	@RequestMapping(value="/userdelete", method=RequestMethod.POST)
	public String userdelete(String id,HttpSession session) {
		dao.userDelete(id);
		session.invalidate();
		return "redirect:/user/login";
	}

	@RequestMapping("/changepass")
	public String changepass(Model model,String id) {
		model.addAttribute("vo",dao.read(id));
		model.addAttribute("pageName", "user/changepass.jsp");
		return "/home";
	}


	@RequestMapping("/usertype")
	public String usertype(Model model) {
		model.addAttribute("pageName", "user/usertype.jsp");
		return "/home";
	}


	//�씪諛섑쉶�썝
	@RequestMapping("/regi")
	public String regi(Model model) {
		model.addAttribute("pageName", "user/regi.jsp");
		return "/home";
	}
	//�쓽�궗�쉶�썝
	@RequestMapping("/regiDoc")
	public String regiDoc(Model model) {
		model.addAttribute("pageName", "user/regiDoc.jsp");
		return "/home";
	}
	//�뾽泥댄쉶�썝
	@RequestMapping("/regiCom")
	public String regiCom(Model model) {
		model.addAttribute("pageName", "user/regiCom.jsp");
		return "/home";
	}


	@RequestMapping(value = "/kakao/login", method = RequestMethod.GET)
	   public @ResponseBody String kakaoLogin(String code) {// data return

	      // post 방식 key=value 데이터를 요청(카카오 쪽으로)
	      RestTemplate rt = new RestTemplate();

	      // HttpHeader object create
	      HttpHeaders headers = new HttpHeaders();
	      headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

	      // HttpBody object create 
	      MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
	      params.add("grant_type", "authorization_code");
	      params.add("client_id", "c2296b03372a2c967d4061bfc5a0d724");
	      params.add("redirect_uri", "http://localhost:8088/user/kakao/login");
	      params.add("code", code);

	      // header,body를 하나로 하기
	      HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

	      
	      // http요청 POST방식 response 응답
	      ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
	            kakaoTokenRequest, String.class);
	      ObjectMapper objectMapper = new ObjectMapper();
	      OAuth_Token oauthToken = null;

	      try {
	         oauthToken = objectMapper.readValue(response.getBody(), OAuth_Token.class);
	      } catch (JsonParseException e) {
	         e.printStackTrace();
	      } catch (JsonMappingException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	     
	      System.out.println("kakao acssece token:" + oauthToken.getAccess_token());
	      RestTemplate rt2 = new RestTemplate();

	      // HttpHeader object create
	      HttpHeaders headers2 = new HttpHeaders();

	      headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
	      headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

	      // header,body를 하나로 하기
	      HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);

	      // http요청 POST방식 response 응답
	      ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
	            kakaoProfileRequest2, String.class);

	      System.out.println(response2.getBody());
	      ObjectMapper objectMapper2 = new ObjectMapper();
	      KakaoProfile kakaoProfile = null;

	      try {
	         kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
	      } catch (JsonParseException e) {
	         e.printStackTrace();
	      } catch (JsonMappingException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }

	      System.out.println("카카오번호 :" + kakaoProfile.getId());
	      System.out.println("카카오이메일 :" + kakaoProfile.getKakao_account().getEmail());
	      
	      System.out.println("사이트유저네임 :" + kakaoProfile.getKakao_account().getEmail()+"_"+kakaoProfile.getId());
	      System.out.println("사이트 이메일 :" + kakaoProfile.getKakao_account().getEmail());
	      UUID tempPass=UUID.randomUUID();
	      System.out.println("사이트 pass :" + tempPass);  

	      return response2.getBody();

	   }

	@RequestMapping("/sendpage")
	public String sendpage(Model model, String id) {
		model.addAttribute("pageName", "user/sendRequest.jsp");
		model.addAttribute("vo", dao.read(id));
		model.addAttribute("list", pdao.readPetList(id));
		return "/home";
	}
	@Autowired
	DoctorDAO ddao;
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(UserVO vo, DoctorVO dvo, MultipartHttpServletRequest multi) throws Exception {

		MultipartFile file = multi.getFile("file");
		String password = passEncoder.encode(vo.getPass());
		vo.setPass(password);
		if (!file.isEmpty()) {
			String image = "photo/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + image));
			vo.setImage(image);
			dao.insert(vo);
		}
		if(vo.getType()=="의사"){
			ddao.inserthospital(dvo);
		}
		return "redirect:/user/login";
	}

	@RequestMapping(value = "/kakaoLogout")
	public String kakaoLogout(HttpSession session) {
		kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		return "redirect:/";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public int loginPost(String id, String pass, HttpSession session) {
		int result = 0;
		UserVO vo = dao.read(id);

		if (vo != null) {
			if (vo.getPass().equals(pass)) {
			/*if (passEncoder.matches(pass, vo.getPass())) {*/
				if(vo.getIsDelete()==1){
					result = 3;
				}else{
					result = 1;
					session.setAttribute("id", id);
					session.setAttribute("nick", vo.getNick());
					session.setAttribute("type", vo.getType());
					session.setAttribute("point", vo.getPoint());
					System.out.println("point : " + vo.getPoint());
				}

			} else {
				result = 2;
			}
		}
		return result;
	}

	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updatePost(UserVO vo, MultipartHttpServletRequest multi) throws Exception{

		MultipartFile file=multi.getFile("file");
		if(!file.isEmpty()){
			new File(path + vo.getImage()).delete();
			String image= "product/" + System.currentTimeMillis()+"_"+file.getOriginalFilename();
			file.transferTo(new File(path + image));
			vo.setImage(image);
		}
		dao.update(vo);
		return "redirect:/user/mypage?id="+vo.getId();
	}

	@RequestMapping(value="/updatepass", method=RequestMethod.POST)
	public String updatepass(UserVO vo){
		String password = passEncoder.encode(vo.getPass());
		vo.setPass(password);
		dao.updatepass(vo);

		return "redirect:/user/mypage?id="+vo.getId();
	}
	//포인트 관리
	@Autowired
	PointhistoryDAO phdao;
	
	@ResponseBody
	@RequestMapping(value="/updatepoint")
	public void updatePoint(PointhistoryVO vo,int amount, HttpSession session){
		dao.updatePoint(amount, session.getAttribute("id").toString());
		phdao.insertPH(vo);
	}
	
	@Autowired
	CashhistoryDAO chdao;
	
	@ResponseBody
	@RequestMapping(value="/updatecash", method=RequestMethod.POST)
	public void updateCash(int amount, HttpSession session){
		CashhistoryVO vo = new CashhistoryVO();
		vo.setId(session.getAttribute("id").toString());
		vo.setAmount(amount);
		vo.setContent("캐쉬 충전");
		dao.updateCash(amount, session.getAttribute("id").toString());
		chdao.insertCH(vo);
	}

	
	@RequestMapping(value="/pointRead")
	public String pointRead(Model model, HttpSession session){
		model.addAttribute("point",dao.pointRead(session.getAttribute("id").toString()));
		model.addAttribute("cash", dao.cashRead(session.getAttribute("id").toString()));
		model.addAttribute("pointhistory",phdao.readPH(session.getAttribute("id").toString()));
		model.addAttribute("cashhistory",chdao.readCH(session.getAttribute("id").toString()));
		model.addAttribute("pageName", "user/point.jsp");
		return "/home";
	}
	
	//서비스 요청서 관리
	
	//내가 작성한 요청서
	@RequestMapping(value="/myRequest")
	public String myRequest(Model model, HttpSession session){
		model.addAttribute("bvo", bdao.myBeautyRead(session.getAttribute("id").toString()));
		model.addAttribute("cvo", cdao.myCleanRead(session.getAttribute("id").toString()));
		model.addAttribute("lvo", ldao.myLessonRead(session.getAttribute("id").toString()));
		model.addAttribute("sideMenu", "mypageSidemenu.jsp");
		model.addAttribute("pageName", "myRequest/Request.jsp");
		return "/home";
	}
	//마감처리한 요청서
	@RequestMapping(value="/myDeadlineList")
	public String myDeadlineList(Model model, HttpSession session){
		model.addAttribute("bvo", bdao.beautyDeadlineList(session.getAttribute("id").toString()));
		model.addAttribute("cvo", cdao.cleanDeadlineList(session.getAttribute("id").toString()));
		model.addAttribute("lvo", ldao.lessonDeadlineList(session.getAttribute("id").toString()));
		model.addAttribute("sideMenu", "mypageSidemenu.jsp");
		model.addAttribute("pageName", "myRequest/deadlineRequest.jsp");
		return "/home";
	}
	
	//채택한 요청서
		@RequestMapping(value="/myChooseList")
		public String myChooseList(Model model, HttpSession session){
			model.addAttribute("bvo", bdao.beautyChooseList(session.getAttribute("id").toString()));
			model.addAttribute("cvo", cdao.cleanChooseList(session.getAttribute("id").toString()));
			model.addAttribute("lvo", ldao.lessonChooseList(session.getAttribute("id").toString()));
			model.addAttribute("sideMenu", "mypageSidemenu.jsp");
			model.addAttribute("pageName", "myRequest/chooseRequest.jsp");
			return "/home";
		}
	
	//미용 마감
	@ResponseBody
	@RequestMapping(value ="/bisDeleteUpdate", method = RequestMethod.POST)
	public void bisDeleteUpdate(HttpSession session, Model model, int brno){
		bdao.bisDeleteUpdate(brno);
	}
	
	//홈 클리닝 마감
	@ResponseBody
	@RequestMapping(value ="/cisDeleteUpdate", method = RequestMethod.POST)
	public void cisDeleteUpdate(HttpSession session, Model model, int crno){
		cdao.cisDeleteUpdate(crno);
	}
	
	//레슨 마감
	@ResponseBody
	@RequestMapping(value ="/lisDeleteUpdate", method = RequestMethod.POST)
	public void lisDeleteUpdate(HttpSession session, Model model, int lrno){
		ldao.lisDeleteUpdate(lrno);
	}
	

	@RequestMapping("/bread")
		public String beautyRead(Model model, int brno){
			model.addAttribute("bvo", bdao.beautyRead(brno));
			model.addAttribute("pageName", "myRequest/beautyread.jsp");
			return "/home";
		}
	
	@RequestMapping("/cread")
		public String cleanRead(Model model, int crno){
			model.addAttribute("cvo", cdao.cleanRead(crno));
			model.addAttribute("pageName", "myRequest/cleaningread.jsp");
			return "/home";
		}
	
	@RequestMapping("/lread")
		public String lessonRead(Model model, int lrno){
			model.addAttribute("lvo", ldao.lessonRead(lrno));
			model.addAttribute("pageName", "myRequest/lessonread.jsp");
			return "/home";
		}
	@RequestMapping("/chartPrice.json")
	@ResponseBody
	public List<List<Object>> chartPrice(){
		List<List<Object>> array=new ArrayList<>();
		List<HashMap<String, Object>> list = dao.chartPrice();
		
		List<Object> arr = new ArrayList<>();
		arr.add("ID");
		arr.add("포인트 사용액");
		arr.add("결제금액");
		arr.add("총 결제금액");
		array.add(arr);
		
		for(HashMap<String, Object> map : list){
			arr = new ArrayList<>();
			arr.add(map.get("uid"));
			arr.add(map.get("point"));
			arr.add(map.get("sum"));
			arr.add(map.get("total"));
			array.add(arr);
		}
		System.out.println("........................123123"+ array);
		return array;
	}
	@RequestMapping("/chartDate.json")
	@ResponseBody
	public List<List<Object>> chartDate(){
		List<List<Object>> array=new ArrayList<>();
		List<HashMap<String, Object>> list = dao.chartDate();
		
		List<Object> arr = new ArrayList<>();
		arr.add("일자");
		arr.add("포인트 사용액");
		arr.add("결제금액");
		arr.add("총 결제금액");
		array.add(arr);
		
		for(HashMap<String, Object> map : list){
			arr = new ArrayList<>();
			arr.add(map.get("fdate"));
			arr.add(map.get("point"));
			arr.add(map.get("sum"));
			arr.add(map.get("total"));
			array.add(arr);
		}
		System.out.println("........................123123"+ array);
		return array;
	}
}