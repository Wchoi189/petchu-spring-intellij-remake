package com.example.dao;

import java.util.List;

import com.example.domain.UserRequestVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class UserRequestDAOImpl implements UserRequestDAO{

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.UserRequestMapper";
	@Override
	public void sendRequest(UserRequestVO vo) {
		session.insert(namespace + ".sendRequest", vo);		
	}
	@Override
	public List<UserRequestVO> requestList() {
		return session.selectList(namespace + ".RequestList");
	}
	@Override
	public UserRequestVO receRequest(int rno) {
		return session.selectOne(namespace + ".receRequest", rno);
	}
	@Override
	public List<UserRequestVO> chkRequest(int pno) {
		return session.selectOne(namespace + ".chkRequest", pno);
	}
	@Override
	public void updatechk(int rno) {
		session.update(namespace + ".updatechk", rno);
		
	}
	@Override
	public List<UserRequestVO> regdatechk(int pno) {
		return session.selectList(namespace + ".regdatechk", pno);
	}
	
}
