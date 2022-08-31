package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.domain.ReserveVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReserveDAOImpl implements ReserveDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ReserveMapper";

	@Override
	public List<ReserveVO> list(String id) {
		return session.selectList(namespace + ".list", id);
	}

	@Override
	public void insert(ReserveVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public ReserveVO read(int rno) {
		return session.selectOne(namespace + ".read", rno);
	}

	@Override
	public List<ReserveVO> checkDateList(String checkin, String checkout) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("checkin", checkin);
		map.put("checkout", checkout);
		return session.selectList(namespace + ".checkDate", map);
	}

	@Override
	public List<ReserveVO> oldlist(String id) {
		return session.selectList(namespace + ".oldlist", id);
	}

	@Override
	public void updateReserve(ReserveVO vo) {
		System.out.println("................................DAOimpl vo: "+vo);
		session.update(namespace + ".updateReserve", vo);
		
	}

	@Override
	public List<ReserveVO> comList(String id, String keyword) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("keyword", keyword);
		return session.selectList(namespace + ".comList", map);
	}

	@Override
	public List<ReserveVO> comOldlist(String id, String keyword) {
		HashMap<String, Object> map1 = new HashMap<>();
		map1.put("id", id);
		map1.put("keyword", keyword);
		return session.selectList(namespace + ".comOldlist",map1);
	}

	@Override
	public List<ReserveVO> myCompany(String id) {
		return session.selectList(namespace + ".myCompany", id);
	}

	@Override
	public void ReserveEdit(ReserveVO vo) {
		session.update(namespace + ".ReserveEdit", vo);
		
	}


	
}
