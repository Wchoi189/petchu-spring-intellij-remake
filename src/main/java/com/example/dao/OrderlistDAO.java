package com.example.dao;

import com.example.domain.Criteria;
import com.example.domain.OrderlistVO;

import java.util.List;

public interface OrderlistDAO {
	List<OrderlistVO> list(Criteria cri);
	OrderlistVO read(int pno,int bno);
	int count(Criteria cri);
	List<OrderlistVO> join(Criteria cri);
}
