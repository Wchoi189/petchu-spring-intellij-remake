package com.example.dao;

import com.example.domain.CashhistoryVO;

import java.util.List;


public interface CashhistoryDAO {
	public List<CashhistoryVO> readCH(String id);
	public void insertCH(CashhistoryVO vo);
}