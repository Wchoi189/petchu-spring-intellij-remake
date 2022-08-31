package com.example.dao;

import java.util.List;

import com.example.domain.StarVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StarDAOImpl implements StarDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.StarMapper";
	


	@Override
	public List<StarVO> list() {
		return session.selectList(namespace + ".list");
	}


	@Override
	public void insert(StarVO vo) {
		session.insert(namespace + ".insert", vo);
		
	}

	@Override
	public double helpcount(int rid) {
		return session.selectOne(namespace + ".helpCount", rid);
	}


	@Override
	public void updateHelpcount(int rid) {
		session.update(namespace + ".updateHelpcount", rid);
	}

	
	@Override
	public void updateHelpcountCancel(int rid) {
		session.update(namespace + ".updateHelpcountCancel", rid);
		
	}


	@Override
	public double RatingAvg(int pno) {
		return session.selectOne(namespace + ".ratingAvg" , pno);
	}


	@Override
	public int updateRating(StarVO vo) {
		return session.update(namespace + ".updateRating", vo);
	}


	@Override
	public void delete(StarVO vo) {
		session.delete(namespace + ".delete", vo);
		
	}


	@Override
	public void update(StarVO vo) {
		session.update(namespace + ".update", vo);
		
	}
}
