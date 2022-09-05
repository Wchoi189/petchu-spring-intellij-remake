package com.example.dao;

import com.example.domain.Criteria;
import com.example.domain.shopcartVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class shopcartDAOImpl implements shopcartDAO{

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.shopcartMapper";
	
	@Override
	public List<shopcartVO> cart_read(String uid) {
		return session.selectList(namespace+".cart_read", uid);
	}

	@Override
	public void cart_insert(shopcartVO vo) {
		session.insert(namespace+".cart_insert", vo);
	}

	@Override
	public void cart_delete(int cno) {
		session.delete(namespace+".cart_delete", cno);
	}

	@Override
	public void cart_update(int amount, int cno) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("amount", amount);
		map.put("cno", cno);
		session.update(namespace+".cart_update", map);
	}

	@Override
	public void cart_chk_update(int chk, int cno) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("chk", chk);
		map.put("cno", cno);
		session.update(namespace+".cart_chk_update", map);
	}

	@Override
	public List<shopcartVO> cart_buy(String uid) {
		return session.selectList(namespace+".cart_buy", uid);
	}

	@Override
	public void order_insert(shopcartVO vo) {
		session.insert(namespace+".order_insert", vo);
	}

	@Override
	public void chk_delete(shopcartVO vo) {
		session.delete(namespace+".chk_delete", vo);
	}

//	@Override
//	public List<shopcartVO> order_list(String uid) {
//		return session.selectList(namespace+".order_list", uid);
//	}

	@Override
	public List<shopcartVO> order_read(String orno) {
		return session.selectList(namespace+".order_read", orno);
	}
	@Override
	public shopcartVO cart_check(shopcartVO vo) {
		return session.selectOne(namespace+".cart_check", vo);
	}

	@Override
	public shopcartVO order_read_user(String orno) {
		return session.selectOne(namespace+".order_read_user",orno);
	}

	@Override
	public void sell_update(int amount, int pno) {
		//수량증가
		HashMap<String, Object> map = new HashMap<>();
		map.put("amount", amount);
		map.put("pno", pno);
		session.update(namespace+".sell_update", map);
	}

	@Override
	public List<shopcartVO> today_best_items() {
		return session.selectList(namespace+".today_best_items");
	}

	@Override
	public List<shopcartVO> best_items() {
		return session.selectList(namespace+".best_items");
	}

	@Override
	public shopcartVO user_point(String uid) {
		return session.selectOne(namespace+".user_point", uid);
	}

	@Override
	public void user_order_insert(shopcartVO vo) {
		session.insert(namespace+".user_order_insert", vo);
	}

	@Override
	public void user_point_minus(shopcartVO vo) {
		session.update(namespace+".user_point_minus", vo);
	}

	@Override
	public void user_point_history(shopcartVO vo) {
		session.insert(namespace+".user_point_history", vo);
	}

	@Override
	public void user_point_plus(int pricePoint, String uid) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("pricePoint", pricePoint);
		map.put("uid", uid);
		session.update(namespace+".user_point_plus", map);
	}

	@Override
	public void user_point_history_plus(String uid, int pricePoint) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("uid", uid);
		map.put("pricePoint", pricePoint);
		session.insert(namespace+".user_point_history_plus", map);
	}

	@Override
	public List<shopcartVO> record_best_items() {
		return session.selectList(namespace+".record_best_items");
	}
	
	@Override
	public List<shopcartVO> record_best_items2() {
		return session.selectList(namespace+".record_best_items2");
	}

	@Override
	public shopcartVO read_user_order(String orno) {
		return session.selectOne(namespace+".read_user_order", orno);
	}

	@Override
	public void user_order_delete(String bno) {
		session.update(namespace+".user_order_delete", bno);
	}

	@Override
	public int is_del(String orno) {
		return session.selectOne(namespace+".is_del", orno);
	}

	@Override
	public void product_count_update(shopcartVO vo) {
		session.update(namespace+".product_count_update", vo);
	}

	@Override
	public List<shopcartVO> order_list(String uid, Criteria cri) {
		HashMap<String,Object> omap = new HashMap<String,Object>();
		omap.put("uid",uid);
		omap.put("cri", cri);
		return session.selectList(namespace+".order_list", omap);

	}

	@Override
	public int order_count(String uid) {
		return session.selectOne(namespace+".order_count", uid);
	}

	@Override
	public shopcartVO state_read(String orno) {
		return session.selectOne(namespace+".state_read", orno);
	}
	
	@Override
	public List<shopcartVO> shop_review_list(int pno) {
		return session.selectList(namespace+".shop_review_list", pno);
	}

	@Override
	public int order_item_qnt(String orno) {
		return session.selectOne(namespace+".order_item_qnt", orno);
	}

	@Override
	public int order_sum(String orno) {
		return session.selectOne(namespace+".order_sum", orno);
	}

	@Override
	public int read_state(String orno) {
		return session.selectOne(namespace+".read_state", orno);
	}

	@Override
	public int read_rcount(int bno) {
		return session.selectOne(namespace+".read_rcount", bno);
	}

	@Override
	public void order_decision(String orno) {
		session.update(namespace+".order_decision", orno);
	}
}
