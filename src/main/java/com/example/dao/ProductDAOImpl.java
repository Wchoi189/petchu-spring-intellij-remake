package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ProductMapper";

	@Override
	public void insert(ProductVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public ProductVO check(int pno) {
		return session.selectOne(namespace + ".check", pno);
	}

	@Override
	public List<ProductVO> list(Criteria cri) {
		return session.selectList(namespace + ".list", cri);
	}

	@Override
	public int count() {
		return session.selectOne(namespace + ".count");
	}

	@Override
	public void qntUpdate(int code, int qnt) {
		HashMap<String , Object> map = new HashMap<>();
		map.put("code", code);
		map.put("qnt", qnt);
		session.update(namespace + ".qntUpdate", map);
	}

	@Override
	public void adminUpdate(ProductVO vo) {
		session.update(namespace + ".adminUpdate", vo);
	}

	@Override
	public ProductVO read(int pno) {
		return session.selectOne(namespace + ".read", pno);
	}

	@Override
	public List<ProductVO> order_list(Criteria cri) {
		return session.selectList(namespace + ".order_list", cri);
	}

	@Override
	public int order_count() {
		return session.selectOne(namespace+".order_count");
	}

	@Override
	public void order_state_update(ProductVO vo) {
		session.update(namespace+".order_state_update", vo);
		System.out.println("............"+vo.getUono()+"\n"+vo.getState());
	}



}
