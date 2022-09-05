package com.example.controller;


import com.example.dao.ChatMessageDAO;
import com.example.dao.ChatRoomDAO;
import com.example.dao.UserDAO;
import com.example.domain.ChatMessageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("chat")
public class ChatController {
	
	@Autowired
	UserDAO udao;
	
	@Autowired
	ChatMessageDAO mdao;
	
	@Autowired
	ChatRoomDAO rdao;

	
	@RequestMapping("/main")
	public void main(Model model,HttpSession session){
		model.addAttribute("type", udao.typechk(session.getAttribute("id").toString()));
		model.addAttribute("chatList", mdao.chatList(session.getAttribute("id").toString()));
		model.addAttribute("pageName", "chat/main.jsp");
	}
	
	@RequestMapping("/room")
	public void main(Model model, int crno, HttpSession session){
		model.addAttribute("type", udao.typechk(session.getAttribute("id").toString()));
		model.addAttribute("receinfo", mdao.receinfo(crno));
		model.addAttribute("roominfo", rdao.roominfo(crno));
		model.addAttribute("crno", crno);
		model.addAttribute("message", mdao.print(crno));
		model.addAttribute("pageName", "chat/room.jsp");
	}
	
	@ResponseBody
	@RequestMapping("/message.json")
	public List<ChatMessageVO> messageList(int crno){
		return mdao.print(crno);
	}
	
	@ResponseBody
	@RequestMapping("/notread")
	public int notread(int crno, HttpSession session){
		return mdao.notread(crno, session.getAttribute("id").toString());
	}
	@ResponseBody
	@RequestMapping("/notreadall")
	public int notreadall(HttpSession session){
		return mdao.notreadall(session.getAttribute("id").toString());
	}
	@ResponseBody
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public void update(int crno, HttpSession session){
		mdao.readdate(crno, session.getAttribute("id").toString());
	}
	
	@ResponseBody
	@RequestMapping(value="/send", method=RequestMethod.POST)
	public void send(ChatMessageVO vo){
		mdao.send(vo);
	}
	@ResponseBody
	@RequestMapping("/create")
	public void create(String doctorid, HttpSession session){
		rdao.create(doctorid, session.getAttribute("id").toString());
	}
	@ResponseBody
	@RequestMapping("/selcrno")
	public int selcrno(String doctorid, HttpSession session){
		return rdao.selcrno(doctorid, session.getAttribute("id").toString());
	}

}
