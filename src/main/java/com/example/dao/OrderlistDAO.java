package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.OrderlistVO;

public interface OrderlistDAO {
	public List<OrderlistVO> list(Criteria cri);
	public OrderlistVO read(int pno,int bno);
	public int count(Criteria cri);
	public List<OrderlistVO> join(Criteria cri);
}
