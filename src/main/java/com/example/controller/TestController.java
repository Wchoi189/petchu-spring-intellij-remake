package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/temp")
public class TestController {

	@RequestMapping("temp_page")
	public String developer(Model model) {
		model.addAttribute("pageName", "temp/temp_page.jsp");
		return "/home";
	}
	
	@RequestMapping("/api_search")
	public String api_search(Model model) {
		model.addAttribute("pageName", "temp/api_search.jsp");
		return "/home";
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("pageName", "temp/list.jsp");
		return "/home";
	}
	@RequestMapping("/shopping_cart")
	public String cart_page(Model model) {
		model.addAttribute("pageName", "temp/shopping_cart.jsp");
		return "/home";
	}
	@RequestMapping("/payment_request")
	public String payment_request(Model model) {
		model.addAttribute("pageName", "temp/payment_request.jsp");
		return "/home";
	}
	@RequestMapping("/register")
	public String register(Model model) {
		model.addAttribute("pageName", "temp/register.jsp");
		return "/home";
	}
	
	@RequestMapping("/checkout")
	public String checkout(Model model) {
		model.addAttribute("pageName", "temp/checkout.jsp");
		return "/home";
	}
}
