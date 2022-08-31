package com.example.dao;

import java.util.List;

import com.example.domain.DoctorRequestVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DoctorRequestDAOImpl implements DoctorRequestDAO{

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.DoctorRequestMapper";
	
	@Override
	public void replyRequest(DoctorRequestVO vo) {
		session.insert(namespace + ".replyRequest", vo);
		
	}

	@Override
	public List<DoctorRequestVO> resultRequestList(String id) {
		return session.selectList(namespace + ".resultRequestList", id);
	}

	@Override
	public DoctorRequestVO resultRequest(int drno) {
		return session.selectOne(namespace + ".resultRequest", drno);
	}

}
