package com.example.dao;

import java.util.List;

import com.example.domain.ServiceCoVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository
public class ServiceCoDAOImpl implements ServiceCoDAO{

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ServiceCoMapper";
	
	@Override
	public List<ServiceCoVO> list(String id) {
		return session.selectList(namespace+".list",id);
	}

	@Override
	public void insert(ServiceCoVO vo) {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public Object read(int scno) {
		return session.selectOne(namespace+".read",scno);
	}

	@Override
	public void update(ServiceCoVO vo) {
		session.update(namespace+".update",vo);
		
	}

	@Override
	public void delete(int scno) {
		session.delete(namespace+".delete",scno);
		
	}
	
	
		
	@Override
	public ServiceCoVO partialbRead(String id) {
		return session.selectOne(namespace + ".partialbRead", id);
	}

	@Override
	public ServiceCoVO partialbRead2(String id) {
		return session.selectOne(namespace + ".partialbRead2", id);
	}

	@Override
	public ServiceCoVO partialbRead3(String id) {
		return session.selectOne(namespace + ".partialbRead3", id);
	}

	@Override
	public List<ServiceCoVO> partialbRead0(String id) {
		return session.selectList(namespace + ".partialbRead0", id);
	}
	
	

}
