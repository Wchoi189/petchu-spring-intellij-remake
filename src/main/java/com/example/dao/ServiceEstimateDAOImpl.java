package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.domain.ServiceEstimateVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ServiceEstimateDAOImpl implements ServiceEstimateDAO {

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ServiceEstimateMapper";
	
	@Override
	public void binsert(ServiceEstimateVO vo) {
		session.insert(namespace + ".brnoInsert", vo);
	}

	@Override
	public void cinsert(ServiceEstimateVO vo) {
		session.insert(namespace + ".crnoInsert", vo);
	}

	@Override
	public void linsert(ServiceEstimateVO vo) {
		session.insert(namespace + ".lrnoInsert", vo);
	}

	@Override
	public List<ServiceEstimateVO> blist(int scno) {
		return session.selectList(namespace + ".brnoList", scno);
	}

	@Override
	public int overlabCheck(ServiceEstimateVO vo) {
		return session.selectOne(namespace + ".overlapCheck", vo);
	}

	@Override
	public int overlabCheck2(ServiceEstimateVO vo) {
		return session.selectOne(namespace + ".overlapCheck2", vo);
	}

	@Override
	public int overlabCheck3(ServiceEstimateVO vo) {
		return session.selectOne(namespace + ".overlapCheck3", vo);
	}

	@Override
	public List<ServiceEstimateVO> beautyViewList(int scno) {
		return session.selectList(namespace + ".beautyViewList", scno);
	}

	@Override
	public List<ServiceEstimateVO> cleaningViewList(int scno) {
		return session.selectList(namespace + ".cleaningViewList", scno);
	}

	@Override
	public List<ServiceEstimateVO> lessonViewList(int scno) {
		return session.selectList(namespace + ".lessonViewList", scno);
	}

	@Override
	public ServiceEstimateVO beautyViewRead(ServiceEstimateVO vo) {
		return session.selectOne(namespace+ ".beautyViewRead" , vo);
	}

	@Override
	public ServiceEstimateVO cleaningViewRead(ServiceEstimateVO vo) {
		return session.selectOne(namespace+ ".cleaningViewRead" , vo);
	}
	
	@Override
	public ServiceEstimateVO lessonViewRead(ServiceEstimateVO vo) {
		return session.selectOne(namespace+ ".lessonViewRead" , vo);
	}

	@Override
	public List<ServiceEstimateVO> brnolist(int brno) {
		return session.selectList(namespace + ".brnoList", brno);
	}

	@Override
	public List<ServiceEstimateVO> crnolist(int crno) {
		return session.selectList(namespace + ".crnoList", crno);
	}

	@Override
	public List<ServiceEstimateVO> lrnolist(int lrno) {
		return session.selectList(namespace + ".lrnoList", lrno);
	}

	@Override
	public ServiceEstimateVO beautyEstimateRead(int brno, int scno) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("brno", brno);
		map.put("scno", scno);
		return session.selectOne(namespace+ ".beautyEstimateRead" , map);
	}

	@Override
	public ServiceEstimateVO cleanEstimateRead(int crno, int scno) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("crno", crno);
		map.put("scno", scno);
		return session.selectOne(namespace+ ".cleanEstimateRead" , map);
	}

	@Override
	public ServiceEstimateVO lessonEstimateRead(int lrno, int scno) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("lrno", lrno);
		map.put("scno", scno);
		return session.selectOne(namespace+ ".lessonEstimateRead" , map);
	}

	@Override
	public void secheckUpdate(int seno) {
		session.update(namespace + ".secheck", seno);
		
	}

	@Override
	public void bfailCheckUpdate(int brno) {
		session.update(namespace + ".bfailCheck", brno);
		
	}

	@Override
	public void cfailCheckUpdate(int crno) {
		session.update(namespace + ".cfailCheck", crno);
		
	}

	@Override
	public void lfailCheckUpdate(int lrno) {
		session.update(namespace + ".lfailCheck", lrno);
		
	}
	
}
