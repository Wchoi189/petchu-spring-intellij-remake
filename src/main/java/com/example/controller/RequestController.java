package com.example.controller;

import java.io.File;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.example.dao.*;
import com.example.domain.ServiceEstimateVO;
import com.example.domain.UserRequestVO;
import com.example.domain.DoctorVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



@Controller
@RequestMapping("/request")
public class RequestController {
	@Resource(name="uploadPath")
	String  path;
		
	@Autowired
    UserRequestDAO dao;
	
	@Autowired
	DoctorDAO ddao;

	//����Ʈ �߰�
	@Autowired
    PointhistoryDAO phdao;
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	BeautyDAO bdao;
	
	@Autowired
    CleaningDAO cdao;
	
	@Autowired
	LessonDAO ldao;
	
	@Autowired
	ServiceCoDAO scdao;
	
	@Autowired
    ServiceEstimateDAO sedao;
	
	@RequestMapping(value="/send", method=RequestMethod.POST)
	public String send(UserRequestVO vo, HttpSession session, MultipartHttpServletRequest multi) throws Exception{
		List<MultipartFile> fileList = multi.getFiles("uploadFile");
		int i=0;
		if(fileList.size()!=0){
			for(MultipartFile mf : fileList){
				String image = "request/user/" + System.currentTimeMillis() + "_" + mf.getOriginalFilename();
				
				mf.transferTo(new File(path + image));
				i++;
				System.out.println("���ƾƾƾƾƾƾ�" + image + ":" + i + "��°");
				if(i==1){
					vo.setDimg1(image);
				}
				if(i==2){
					vo.setDimg2(image);
				}
				if(i==3){
					vo.setDimg3(image);
				}if(i==4){
					vo.setDimg4(image);
				}
			}
			
		}
		
		dao.sendRequest(vo);
		
/*		//����Ʈ�߰�
		PointhistoryVO phvo = new PointhistoryVO();
		phvo.setId(session.getAttribute("id").toString());
		phvo.setAmount(500);
		phvo.setContent("�������ۼ�");
		
		udao.updatePoint(500, session.getAttribute("id").toString());
		phdao.insertPH(phvo);*/
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/list")
	public String requestList(Model model){
		model.addAttribute("list", dao.requestList());
		System.out.println("1111111111111");
		model.addAttribute("pageName", "user/doctor/receRequestList.jsp");
		return "/home";
	}
	
	//���� ��û�� ����Ʈ
	@RequestMapping(value="/servicelist")
	public String serviceRequestList(Model model, HttpSession session){
		model.addAttribute("beautyList", bdao.beautyList());
		model.addAttribute("cleanList", cdao.cleanList());
		model.addAttribute("lessonList", ldao.lessonList());
		model.addAttribute("pageName", "service/sclist.jsp");
		return "/home";
	}
	
	//��û�� ��
	@ResponseBody
	@RequestMapping(value="/servicecount", method=RequestMethod.POST)
	public int serviceTotalCount(Model model, HttpSession session){
		int count1 = bdao.beautyTotalCount();
		int count2 = cdao.cleaningTotalCount();
		int count3 = ldao.lessongTotalCount();
		
		int totalCount = count1 + count2 + count3;
		
		return totalCount;
	}
	
	@RequestMapping(value="/read")
	public String receRequest(Model model, int rno, HttpSession session){
		model.addAttribute("hospital", ddao.selectDno(session.getAttribute("id").toString()));
		model.addAttribute("vo", dao.receRequest(rno));
		model.addAttribute("pageName", "user/doctor/receRequest.jsp");
		return "/home";
	}
	
	@Autowired
    DoctorRequestDAO drdao;
	
	@RequestMapping(value="/result")
	public String resultRequestList(Model model, HttpSession session){
		model.addAttribute("bvo", bdao.myBeautyRead(session.getAttribute("id").toString()));
	    model.addAttribute("cvo", cdao.myCleanRead(session.getAttribute("id").toString()));
	    model.addAttribute("lvo", ldao.myLessonRead(session.getAttribute("id").toString()));
		model.addAttribute("list", drdao.resultRequestList(session.getAttribute("id").toString()));
		model.addAttribute("pageName", "user/resultRequestList.jsp");
		return "/home";
	}
	
	//ä��
	@ResponseBody
	@RequestMapping("/bchoose")
	public void beutyChoose(int seno, int brno){
		sedao.secheckUpdate(seno);
		bdao.bisDeleteUpdate(brno);
		bdao.beautyChooseUpdate(brno);
		sedao.bfailCheckUpdate(brno);
	}
	
	@ResponseBody
	@RequestMapping("/cchoose")
	public void celanChoose(int seno, int crno){
		sedao.secheckUpdate(seno);
		cdao.cisDeleteUpdate(crno);
		cdao.cleanChooseUpdate(crno);
		sedao.cfailCheckUpdate(crno);
	}
	
	@ResponseBody
	@RequestMapping("/lchoose")
	public void lessonChoose(int seno, int lrno){
		sedao.secheckUpdate(seno);
		ldao.lisDeleteUpdate(lrno);
		ldao.lChooseUpdate(lrno);
		sedao.lfailCheckUpdate(lrno);
	}
	
	// �̿� ������ ����Ʈ
	@RequestMapping("/belist.json")
	@ResponseBody
	public List<ServiceEstimateVO> belistJson(int brno){
		List<ServiceEstimateVO> list=sedao.brnolist(brno);
		return list;
	}
	
	// �̿� �������� ��ü ����
	@RequestMapping("/beread")
	public String beautyEstimateRead(int brno, int scno, Model model, HttpSession session){
		model.addAttribute("bvo", sedao.beautyEstimateRead(brno, scno));
		model.addAttribute("pageName", "user/beautyEstimateInfo.jsp");
		return "/home";
	}
	
	// ȨŬ���� ������ ����Ʈ
	@RequestMapping("/celist.json")
	@ResponseBody
	public List<ServiceEstimateVO> celistJson(int crno){
		List<ServiceEstimateVO> list=sedao.crnolist(crno);
		return list;
	}
	
	// ȨŬ���� �������� ��ü ����
	@RequestMapping("/ceread")
	public String cleanEstimateRead(int crno, int scno, Model model, HttpSession session){
		model.addAttribute("cvo", sedao.cleanEstimateRead(crno, scno));
		model.addAttribute("pageName", "user/cleanEstimateInfo.jsp");
		return "/home";
	}
	
	
	// ���� ������ ����Ʈ
	@RequestMapping("/lelist.json")
	@ResponseBody
	public List<ServiceEstimateVO> lelistJson(int lrno){
		List<ServiceEstimateVO> list=sedao.lrnolist(lrno);
		return list;
	}
	
	//���� �������� ��ü ����
	@RequestMapping("/leread")
	public String lessonEstimateRead(int lrno, int scno, Model model, HttpSession session){
		model.addAttribute("lvo", sedao.lessonEstimateRead(lrno, scno));
		model.addAttribute("pageName", "user/lessonEstimateInfo.jsp");
		return "/home";
	}
	
	@RequestMapping(value="/resultread")
	public String resultRequest(Model model, int drno, HttpSession session){
		model.addAttribute("vo", drdao.resultRequest(drno));
		model.addAttribute("uvo",udao.read(session.getAttribute("id").toString()));
		model.addAttribute("pageName", "user/resultRequest.jsp");
		return "/home";
	}
	
	@ResponseBody
	@RequestMapping(value="doctorinfo")
	public DoctorVO doctorinfo(int dno){
		return ddao.hospital(dno);
	}
	
	@ResponseBody
	@RequestMapping(value="regdatechk")
	public List<UserRequestVO> regdatechk(int pno){
		return dao.regdatechk(pno);
	}
	
}
