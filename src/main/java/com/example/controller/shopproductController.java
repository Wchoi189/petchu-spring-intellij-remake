package com.example.controller;

import com.example.dao.UserDAO;
import com.example.dao.shopcartDAO;
import com.example.dao.shopproductDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.shopcartVO;
import com.example.domain.shopproductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/shopproduct")
public class shopproductController {
	@Autowired
	shopproductDAO dao;
	@Autowired
	shopcartDAO cartdao;
	@Autowired
	UserDAO userdao;
	
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public void delete(int cno){
		cartdao.cart_delete(cno);
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	@ResponseBody
	public int insert(shopcartVO vo){
		//System.out.println("...................."+vo);
		//System.out.println("\n\n��� : " + resutlCart);
		
		//vo�� uid�� pno�� ��Ƽ� check	
		shopcartVO resutlCart = cartdao.cart_check(vo);
		//if result�� null�̶�� ���
		if(resutlCart==null){
			//�ߺ����� ���� ��쿡�� ��� insert �۾� ����
			cartdao.cart_insert(vo);	
			return 1;
		}else{
			//�̹� ��ϵ� ��ǰ�� ���� ��� 0
			return 0;
		}
	}
	
	//��ٱ��� ��� JSON
	@RequestMapping("/cart_read.json")
	@ResponseBody
	public List<shopcartVO> cart(String uid){
		List<shopcartVO> clist=cartdao.cart_read(uid);
		return clist;
	}
	
	//��ٱ��� ��� - ��ٱ��� �������� �̵��ϴ� ȭ���� ������ ��.
	@RequestMapping("/cart_read")
	public String cart_list(Model model){
		model.addAttribute("pageName", "shopproduct/cart_read.jsp");
		return "/home";
	}
	
	//������ǰ ���Ž� ������
	@RequestMapping("/multi_buy")
	public String multi_buy(Model model, String uid){
		//user ���� �ҷ�����
		model.addAttribute("vo", userdao.read(uid));
		//���⿡ point ���
		model.addAttribute("uvo", cartdao.user_point(uid));
		model.addAttribute("pageName", "shopproduct/multi_buy.jsp");
		return "/home";
	}
	
	//����� list JSON
	@RequestMapping("/multi_buy.json")
	@ResponseBody
	public List<shopcartVO> buy_list(String uid){
		List<shopcartVO> list=cartdao.cart_buy(uid);
		return list;
	}
	
	//����� list JSON
	@RequestMapping("/list.json")
	@ResponseBody
	public List<shopproductVO> list(){
		List<shopproductVO> list=dao.list();
		return list;
	}
	
	
	//����� list
	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName", "shopproduct/list.jsp");
		return "/home";
	}
	
	@RequestMapping("/main")
	public String main(Model model){
//		List<shopcartVO> tvo=cartdao.today_best_items();
//		List<shopcartVO> bvo=cartdao.best_items();
		List<shopcartVO> bvo=cartdao.record_best_items();
		List<shopcartVO> b2vo=cartdao.record_best_items2();
//		model.addAttribute("tlist", tvo);
//		model.addAttribute("blist", bvo);
		model.addAttribute("blist", bvo);
		model.addAttribute("blist2", b2vo);
		model.addAttribute("pageName", "shopproduct/main.jsp");
		return "/home";
	}
	//Shopproduct main���� ����Ʈ/������ ��ǰ ��� ���
	@RequestMapping("/main.json")
	@ResponseBody
	public HashMap<String,Object> main_best(){
		HashMap<String,Object> map=new HashMap<String,Object>();
		try {
		List<shopcartVO> best1=cartdao.best_items();
		List<shopcartVO> today1=cartdao.today_best_items();
		map.put("best1", best1);
		map.put("today1", today1);

		}catch(Exception e){
			e.printStackTrace();
		}
	return map;
	}
	
//	//������ ����Ʈ JSON
//	@RequestMapping("/contents_list.json")
//	@ResponseBody
//	public List<shopproductVO> contents_list(String selectCate, String selectCate2, String selectCate3){
//		List<shopproductVO> list=dao.contents_list(selectCate, selectCate2, selectCate3);
//		return list;
//	}
	
	//������ ����Ʈ JSON test
	@RequestMapping("/contents_list.json")
	@ResponseBody
	public Map<String,Object> contents_list(String selectCate, String selectCate2, String selectCate3, Criteria cri){
		Map<String,Object> map=new HashMap<>();
		cri.setPerPageNum(20);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(10);
		pm.setTotalCount(dao.totalCount(selectCate, selectCate2, selectCate3, cri));
		System.out.println("asfddsfsdfs.............."+pm.getStartPage()+"\n"+pm.getTotalCount()+"\n"+pm.getCri());
		map.put("pm", pm);
		map.put("list", dao.contents_list(selectCate, selectCate2, selectCate3, cri));
		return map;
	}

	//���͸��� ��ǰ���
	@RequestMapping("/contents_list")
	public String contents_list(Model model, String selectCate, String selectCate2, String selectCate3, HttpSession session){
		session.setAttribute("cate", selectCate);
		session.setAttribute("cate2", selectCate2);
		session.setAttribute("cate3", selectCate3);
		model.addAttribute("pageName", "shopproduct/contents_list.jsp");
//		model.addAttribute("list", dao.contents_list(selectCate, selectCate2, selectCate3));
//		model.addAttribute("list_", dao.list());
		return "/home";
	}
	
	//��ǰ ���� ������
	@RequestMapping("/buy")
	public String buy(Model model, int pno, int amount, HttpSession session, String uid){
		//user ���� �ҷ�����
		model.addAttribute("uvo", userdao.read(uid));	
		System.out.println("test............"+userdao.read(uid));
		//
		session.setAttribute("pno", pno);
		session.setAttribute("amount", amount);
		model.addAttribute("vo", dao.read(pno));
		model.addAttribute("pageName", "shopproduct/buy.jsp");
		return "/home";
	}

	
	//��ǰ ���� ��� (�� ������)
	@RequestMapping("/read")
	public String read(Model model, int pno, String selectCate, String selectCate2, String selectCate3, HttpSession session){
		session.setAttribute("cate", selectCate);
		session.setAttribute("cate2", selectCate2);
		session.setAttribute("cate3", selectCate3);
		model.addAttribute("vo", dao.read(pno));
		model.addAttribute("pageName", "shopproduct/read.jsp");
		return "/home";
	}
	
	//īƮ��� ������Ʈ
	@RequestMapping(value="/cart_update", method=RequestMethod.POST)
	@ResponseBody
	public void cart_update(int amount, int cno){
		cartdao.cart_update(amount, cno);	
	}
	
	//īƮchk ������Ʈ
		@RequestMapping(value="/cart_chk_update", method=RequestMethod.POST)
		@ResponseBody
		public void cart_chk_update(int chk, int cno){
			cartdao.cart_chk_update(chk, cno);	
		}
		
	//��ǰ ����
	@RequestMapping(value="/order_insert", method=RequestMethod.POST)
	@ResponseBody
	public void order_insert(shopcartVO vo){
		//���
		cartdao.order_insert(vo);
		//��ٱ���chk ��� ����
		cartdao.chk_delete(vo);
		//shopproduct ���ż��� �߰�
		cartdao.sell_update(vo.getAmount(), vo.getPno());
		//shopproduct �������� ������Ʈ
		cartdao.product_count_update(vo);
	}
	
	/////
	//�ֹ���� JSON
	@RequestMapping("/order_list.json")
	@ResponseBody
	public HashMap<String,Object> order_list(String uid, Criteria cri){
		HashMap<String,Object> omap =new HashMap<String,Object>();
		cri.setPerPageNum(20);
//	pagination
		PageMaker opm= new PageMaker();
		opm.setCri(cri);
		opm.setTotalCount(cartdao.order_count(uid));
		opm.setDisplayPageNum(5);  //pagination���� ������ ���� ��� ���̴�
		omap.put("pm", opm);
		omap.put("olist", cartdao.order_list(uid,cri));
		return omap;
	}
	
	
	
	
	//���Ÿ�� - �� ���� ������ �̵���� �޾ƾ� ��
	@RequestMapping("/order_list")
	public String order_list(Model model){
		model.addAttribute(	"pageName", "shopproduct/order_list.jsp");
		return "/home";
	}
	
	//read.json
	@RequestMapping("/read.json")
	@ResponseBody
	public shopproductVO read(int pno){
		shopproductVO vo=dao.read(pno);
		return vo;
	}
	
	//order_read.json
	@RequestMapping("/order_read.json")
	@ResponseBody
	public List<shopcartVO> order_read(String orno){
		//shopcartVO vo=cartdao.order_read(pno, orno);
		List<shopcartVO> list=cartdao.order_read(orno);
		return list;
	}
	
	//�ֹ���� - read������
	@RequestMapping("/order_read")
	public String order_read(Model model, String orno){
		model.addAttribute("orno", orno);
		model.addAttribute("uvo", cartdao.order_read_user(orno));
		model.addAttribute("ovo", cartdao.read_user_order(orno));
		model.addAttribute("del", cartdao.is_del(orno));
		model.addAttribute("state", cartdao.state_read(orno));
		model.addAttribute("pageName", "shopproduct/order_read.jsp");
		return "/home";
	}

	//��ǰ ���� ����
	@RequestMapping(value="/order_single_insert", method=RequestMethod.POST)
	@ResponseBody
	public void order_single_insert(shopcartVO vo){
		//���
		cartdao.order_insert(vo);
		//shopproduct ���ż��� �߰�
		cartdao.sell_update(vo.getAmount(), vo.getPno());
		//shopproduct ��ǰ���� ����
		cartdao.product_count_update(vo);
	}
	
	//��ǰ ���Ž� point �̵�
	@RequestMapping(value="user_order_insert", method=RequestMethod.POST)
	@ResponseBody
	public void order_insert(shopcartVO vo, int btnPoint){
//		System.out.println(".................."+vo.getOrno()+"\n"+vo.getUid()+"\n"+vo.getPoint()+"\n"+vo.getSum()+"\n"+btnPoint);
		if(btnPoint==1){
			//����Ʈ ����ڶ�� user ���̺��� ����Ʈ ����
			cartdao.user_point_minus(vo);
			//������ ���� history�� ���
			cartdao.user_point_history(vo);
		}
		//���ų��� �Է�
		cartdao.user_order_insert(vo);
		//����Ʈ ����
		int price = vo.getSum();
		int pricePoint = price/10;
		if(pricePoint>0){
			cartdao.user_point_plus(pricePoint, vo.getUid());
			//�������� history�� ���
			cartdao.user_point_history_plus(vo.getUid(), pricePoint);
		}
	}
	
	//��ǰ ���Ž� point �̵�
	@RequestMapping(value="user_order_delete", method=RequestMethod.POST)
	@ResponseBody
	public void order_delete(String bno){
		System.out.println("asdfdasfasdfdasf2342234324324\n"+bno);
		cartdao.user_order_delete(bno);
	}
	
//	//�ֹ���Ȳ ���
	@RequestMapping(value="state_read", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> state_read(String orno){
		shopcartVO resutlState = cartdao.state_read(orno);
		Map<String,Object> map=new HashMap<>();
		map.put("sum", cartdao.order_sum(orno));
		map.put("qnt", cartdao.order_item_qnt(orno));
		map.put("vo", cartdao.state_read(orno));
		return map;
	}
	
	//��ǰ ������ json
	@RequestMapping("/shop_review_list.json")
	@ResponseBody
	public List<shopcartVO> shop_review_list(int pno){
		//shopcartVO vo=cartdao.order_read(pno, orno);
		List<shopcartVO> list=cartdao.shop_review_list(pno);
		return list;
	}
	
//	//�ֹ���Ȳ ���
	@RequestMapping(value="read_rcount", method=RequestMethod.POST)
	@ResponseBody
	public int read_rcount(int bno){
		int result = cartdao.read_rcount(bno);
		return result;
	}
	
	//����Ȯ��
	@RequestMapping(value="order/decision", method=RequestMethod.POST)
	@ResponseBody
	public void order_decision(String orno){
		cartdao.order_decision(orno);
	}

}
