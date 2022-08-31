package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.OrderlistVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderlistDAOImpl implements OrderlistDAO {
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.OrderlistMapper";
	
	@Override //������  
	public List<OrderlistVO> list(Criteria cri) {
		return session.selectList(namespace + ".list", cri);
	}

	@Override
	public OrderlistVO read(int pno, int bno) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("pno", pno);
		map.put("bno", bno);
		System.out.println(".."+"pno"+"bno");
		return session.selectOne(namespace + ".read", map);
	}

	@Override
	public int count(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".count", cri);
	}

	@Override
	public List<OrderlistVO> join(Criteria cri) {
		return session.selectList(namespace + ".join", cri);
	}


}
