package com.example.dao;

import com.example.domain.RateVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class RateDAOImpl implements RateDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.HoschoolMapper";
	
	@Override
	public void rateInsert(RateVO vo) {
		session.insert(namespace + ".rateInsert", vo);
	}

	@Override
	public List<RateVO> reviewList(int scno, int start, int perPageNum) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("scno", scno);
		map.put("perPageNum", perPageNum);
		return session.selectList(namespace + ".reviewList", map);
	}

	@Override
	public int reviewCount(int scno) {
		return session.selectOne(namespace + ".reviewCount", scno);
	}

	@Override
	public List<RateVO> avgRate(){
		return session.selectList(namespace + ".avgRate");
	}

	@Override
	public double avgRateRead(int scno) {
		return session.selectOne(namespace + ".avgRateRead", scno);
	}

}
