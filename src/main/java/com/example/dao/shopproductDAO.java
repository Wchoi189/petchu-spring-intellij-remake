package com.example.dao;

import com.example.domain.Criteria;
import com.example.domain.shopcartVO;
import com.example.domain.shopproductVO;

import java.util.List;


public interface shopproductDAO {
	public List<shopproductVO> list();
	public shopproductVO read(int pno);
	public List<shopproductVO> contents_list(String selectCate, String selectCate2, String selectCate3, Criteria cri);
	public shopcartVO cart_read(String uid); //주문목록
	public int totalCount(String selectCate, String selectCate2, String selectCate3, Criteria cri); //전체 데이터의 개수를 리턴 하는 메서드
}
