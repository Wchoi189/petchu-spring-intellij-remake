package com.example.controller;

import com.example.dao.ProductDAO;
import com.example.dao.UserDAO;
import com.example.domain.Criteria;
import com.example.domain.NaverAPI;
import com.example.domain.PageMaker;
import com.example.domain.ProductVO;
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
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductDAO dao;


    @Autowired
    UserDAO udao;

    @RequestMapping("/userList")
    public String userList(Model model) {
        model.addAttribute("submenu", "submenu.jsp");
        model.addAttribute("pageName", "product/userMG.jsp");
        return "/home";
    }

    @RequestMapping("/chart")
    public String chart(Model model) {
        model.addAttribute("submenu", "submenu.jsp");
        model.addAttribute("pageName", "product/chart.jsp");
        return "/home";
    }

    @RequestMapping("/userList.json")
    @ResponseBody
    public HashMap<String, Object> userListJSON(Criteria cri) {
        HashMap<String, Object> map = new HashMap<>();
        cri.setPerPageNum(5);

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(udao.userCount());

        map.put("pm", pm);
        map.put("list", udao.list(cri));

        return map;
    }

    @RequestMapping(value = "/userdelete", method = RequestMethod.POST)
    @ResponseBody
    public void userdelete(String id, HttpSession session) {
        udao.userDelete(id);
    }

    @RequestMapping(value = "/qntUpdate", method = RequestMethod.POST)
    @ResponseBody
    public void qntUpdate(int code, int qnt) {
        dao.qntUpdate(code, qnt);
    }

    @Resource(name = "uploadPath")
    String path;

    @RequestMapping("/insert")
    public String insert(Model model) {
        model.addAttribute("submenu", "submenu.jsp");
        model.addAttribute("pageName", "product/insert.jsp");
        return "/home";
    }

    @RequestMapping("/read")
    public String read(Model model, int pno) {
        model.addAttribute("vo", dao.read(pno));
        model.addAttribute("pageName", "product/read.jsp");
        return "/home";
    }

    @RequestMapping("/list")
    public String list(Model model) {
        model.addAttribute("submenu", "submenu.jsp");
        model.addAttribute("pageName", "product/list.jsp");
        return "/home";
    }

    @RequestMapping("/shop.json")
    @ResponseBody
    public String shop(String query, int page, String display) {
        return NaverAPI.connection(query, page, display);
    }

    @RequestMapping("/list.json")
    @ResponseBody
    public Map<String, Object> list(Criteria cri) {
        Map<String, Object> map = new HashMap<>();
        cri.setPerPageNum(10);

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(dao.count());

        map.put("pm", pm);
        map.put("list", dao.list(cri));

        return map;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    public void insert(ProductVO vo) {
        //이미지 내 pc로 카피
		/*
		String str = vo.getPimage();
		String fileName = str.substring(str.lastIndexOf("/")+1);
		
		try {
			URL url = new URL(str);
			InputStream in = url.openStream();
			OutputStream out = new FileOutputStream(path + "product/" + fileName);
			FileCopyUtils.copy(in, out);
			vo.setPimage("product/" + fileName);
			dao.insert(vo);
		} catch (Exception e) {
			System.out.println("오류: " + e.toString());
		}
		*/
        dao.insert(vo);
    }

    @RequestMapping(value = "/adminUpdate", method = RequestMethod.POST)
    public String adminUpdate(ProductVO vo, MultipartHttpServletRequest multi) throws Exception {
        MultipartFile file = multi.getFile("file");
		/*
		if(!file.isEmpty()){		
			new File(path + vo.getPimage()).delete();
			String image = "product/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(path + image));
			vo.setPimage(image);
		}
		*/
        dao.adminUpdate(vo);
        return "redirect:/product/list";
    }


    @RequestMapping("/order_list.json")
    @ResponseBody
    public Map<String, Object> order_list(Criteria cri) {
        Map<String, Object> map = new HashMap<>();
        cri.setPerPageNum(10);

        PageMaker pm = new PageMaker();
        pm.setCri(cri);
        pm.setTotalCount(dao.order_count());

        map.put("pm", pm);
        map.put("list", dao.order_list(cri));

        return map;
    }

    @RequestMapping("/order_list")
    public String order_list(Model model) {
        model.addAttribute("submenu", "submenu.jsp");
        model.addAttribute("pageName", "product/order_list.jsp");
        return "/home";
    }

    @RequestMapping(value = "order_state_update", method = RequestMethod.POST)
    @ResponseBody
    public void order_state_update(ProductVO vo) {
        dao.order_state_update(vo);
    }
}
