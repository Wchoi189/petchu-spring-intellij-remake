package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.FaqVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAOImpl implements FaqDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.FaqMapper";
	 
	@Override
	public List<FaqVO> list(Criteria cri) {
		return session.selectList(namespace + ".list",cri);
	}
	@Override
	public void insert(FaqVO vo) {
		session.insert(namespace + ".insert", vo);
	}
	@Override
	public FaqVO read(int fno) {
		return session.selectOne(namespace + ".read", fno);
	} 
	@Override
	public void update(FaqVO vo) {
		session.update(namespace + ".update", vo);
	}
	@Override
	public void delete(int fno) {
		session.delete(namespace + ".delete", fno);
	}
	
	
	

}
