package com.example.controller;

import com.example.dao.ChartdataDAO;
import com.example.domain.ChartdataVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/chart")
public class ChartController {
	@Autowired
	ChartdataDAO dao;
	
	@RequestMapping("/list")
	public ChartdataVO list(String dname){
		return dao.chartlist(dname);
	}
}
