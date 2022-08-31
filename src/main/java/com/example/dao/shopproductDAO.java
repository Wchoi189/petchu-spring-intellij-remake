package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.shopcartVO;
import com.example.domain.shopproductVO;

public interface shopproductDAO {
	public List<shopproductVO> list();
	public shopproductVO read(int pno);
	public List<shopproductVO> contents_list(String selectCate, String selectCate2, String selectCate3, Criteria cri);
	public shopcartVO cart_read(String uid); //�ֹ����
	public int totalCount(String selectCate, String selectCate2, String selectCate3, Criteria cri); //��ü �������� ������ ���� �ϴ� �޼���
}
