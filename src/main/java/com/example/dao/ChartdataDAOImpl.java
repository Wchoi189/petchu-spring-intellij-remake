package com.example.dao;

import com.example.domain.ChartdataVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartdataDAOImpl implements ChartdataDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ChartdataMapper";
	
	@Override
	public ChartdataVO chartlist(String dname) {
		return session.selectOne(namespace + ".chartlist", dname);
	}
	

}
