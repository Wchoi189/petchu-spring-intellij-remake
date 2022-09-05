package com.example.dao;

import com.example.domain.DoctorVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DoctorDAOImpl implements DoctorDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.DoctorMapper";
	@Override
	public List<DoctorVO> hospitalList() {
		return session.selectList(namespace + ".hospitalList");
	}
	@Override
	public DoctorVO hospital(int dno) {
		return session.selectOne(namespace +".hospital", dno);
	}
	@Override
	public void inserthospital(DoctorVO vo) {
		session.insert(namespace + "inserthospital", vo);
	}
	@Override
	public void updatehospital(DoctorVO vo) {
		session.update(namespace + ".updatehospital", vo);
	}
	@Override
	public int selectDno(String id) {
		return session.selectOne(namespace + ".selectDno", id);
	}
	
	
}
