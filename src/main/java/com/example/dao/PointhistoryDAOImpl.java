package com.example.dao;

import com.example.domain.PointhistoryVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PointhistoryDAOImpl implements PointhistoryDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.PointhistoryMapper";
	
	@Override
	public List<PointhistoryVO> readPH(String id) {
		return session.selectList(namespace + ".readPH", id);
	}

	@Override
	public void insertPH(PointhistoryVO vo) {
		session.insert(namespace + ".insertPH", vo);
	}

}
