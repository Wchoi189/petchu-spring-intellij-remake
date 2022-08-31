package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.shopcartVO;


public interface shopcartDAO {
	public List<shopcartVO> cart_read(String uid);
	public void cart_insert(shopcartVO vo);
	public void cart_delete(int cno);
	public void cart_update(int amount, int cno);
	public void cart_chk_update(int chk, int cno);
	public List<shopcartVO> cart_buy(String uid);
	public void order_insert(shopcartVO vo);
	public void chk_delete(shopcartVO vo);
//	public List<shopcartVO> order_list(String uid);
	public List<shopcartVO> order_read(String orno);
	public shopcartVO cart_check(shopcartVO vo);
	public shopcartVO order_read_user(String orno);
	public void sell_update(int amount, int pno);
	public List<shopcartVO> today_best_items();
	public List<shopcartVO> best_items();
	public shopcartVO user_point(String uid);
	public void user_order_insert(shopcartVO vo);
	public void user_point_minus(shopcartVO vo);
	public void user_point_history(shopcartVO vo);
	public void user_point_plus(int pricePoint, String uid);
	public void user_point_history_plus(String uid, int pricePoint);
	public List<shopcartVO> record_best_items();
	public List<shopcartVO> record_best_items2();
	public shopcartVO read_user_order(String orno);
	public void user_order_delete(String bno);
	public int is_del(String orno);
	public void product_count_update(shopcartVO vo);
	public List<shopcartVO> order_list(String uid, Criteria cri);
	public int order_count(String uid);
	public shopcartVO state_read(String orno);
	public List<shopcartVO> shop_review_list(int pno);
	public int order_item_qnt(String orno);
	public int order_sum(String orno);
	public int read_state(String orno);
	public int read_rcount(int bno);
	public void order_decision(String orno);
}
