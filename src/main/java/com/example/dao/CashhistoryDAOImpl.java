package com.example.dao;

import com.example.domain.CashhistoryVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CashhistoryDAOImpl implements CashhistoryDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.CashhistoryMapper";
	
	@Override
	public List<CashhistoryVO> readCH(String id) {
		return session.selectList(namespace + ".readCH", id);
	}

	@Override
	public void insertCH(CashhistoryVO vo) {
		session.insert(namespace + ".insertCH", vo);
	}

}