package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.ReviewVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Autowired
	SqlSession session;
	String namespace = "com.example.mapper.ReviewMapper";
	
	@Override
	public List<ReviewVO> list(int bno) {
		return session.selectList(namespace + ".list", bno);
	}

	@Override
	public void insert(ReviewVO vo) {
		HashMap<String,Object> omap = new HashMap<String,Object>();
		omap.put("uid", vo.getUid());
		omap.put("rtitle", vo.getRtitle());
		omap.put("star", vo.getStar());
		omap.put("review", vo.getReview());
		omap.put("pno", vo.getPno());
		omap.put("bno", vo.getBno());
		omap.put("rimage1", vo.getRimage1());
		omap.put("rimage2", vo.getRimage2());
		omap.put("rimage3", vo.getRimage3());
		System.out.println("test====="+omap);
		session.insert(namespace + ".insert", omap);
		
	}

	@Override
	public ReviewVO read(int rid, int pno) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("rid", rid);
		map.put("pno", pno);
		return session.selectOne(namespace + ".read", map);
	}

	@Override
	public void update(ReviewVO vo) {
		session.update(namespace + ".update", vo);
		
	}

	@Override
	public void delete(int rid) {
		session.delete(namespace + ".delete", rid);
	}

	@Override
	public List<ReviewVO> join(Criteria cri) {
		return session.selectList(namespace + ".join", cri);
	}

	@Override
	public int count() {
		return session.selectOne(namespace + ".count");
	}

	@Override
	public ReviewVO updateread(int rid) {

		return session.selectOne(namespace + ".updateread", rid);
	}

	@Override
	public int user_review_count(String uid, int bno) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("uid", uid);
		map.put("bno", bno);
		System.out.println(map+">>>>>>>><<<<<<");
		return session.selectOne(namespace+".user_review_count", map);
	}

	@Override
	public List<ReviewVO> idReview(String uid) {
		return session.selectList(namespace + ".idReview", uid);
	}

	@Override
	public int idReviewCount(String uid) {
		return session.selectOne(namespace + ".idReviewCount", uid);
	}

	@Override
	public void reviewUpdate(ReviewVO vo) {
		session.update(namespace + ".reviewUpdate", vo);
		
	}


}
