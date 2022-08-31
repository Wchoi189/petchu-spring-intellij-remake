package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;

public interface ProductDAO {
	public void insert (ProductVO vo);
	public ProductVO check(int pno);
	public List<ProductVO> list(Criteria cri);
	public int count();
	public void qntUpdate(int code, int qnt);
	public void adminUpdate(ProductVO vo);
	public ProductVO read(int pno);
	public int order_count();
	public List<ProductVO> order_list(Criteria cri);
	public void order_state_update(ProductVO vo);
}
