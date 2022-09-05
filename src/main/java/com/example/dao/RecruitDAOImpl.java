package com.example.dao;

import com.example.domain.Criteria;
import com.example.domain.RecruitVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RecruitDAOImpl implements RecruitDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.RecruitMapper";
	@Override
	public List<RecruitVO> list(Criteria cri) {
		return session.selectList(namespace+".list",cri);
	}
	@Override
	public void insert(RecruitVO vo) {
		session.insert(namespace+".insert",vo);
	}
	@Override
	public RecruitVO read(int bno) {
		return session.selectOne(namespace+".read",bno);
	}
	@Override
	public void update(RecruitVO vo) {
		session.update(namespace+".update",vo);
	}
	@Override
	public void delete(int bno) {
		session.delete(namespace+".delete",bno);
		
	}



	
}
