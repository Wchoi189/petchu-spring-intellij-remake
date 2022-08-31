package com.example.dao;

import java.util.List;

import com.example.domain.BeautyRequestVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BeautyDAOImpl implements BeautyDAO{

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.BeautyRequestMapper";

	@Override
	public void beautyInsert(BeautyRequestVO vo) {
		session.insert(namespace + ".beautyInsert", vo);
		
	}

	@Override
	public List<BeautyRequestVO> beautyList() {
		return session.selectList(namespace + ".beautyList");
	}

	@Override
	public BeautyRequestVO beautyRead(int brno) {
		return session.selectOne(namespace + ".beautyRead", brno);
	}

	@Override
	public BeautyRequestVO myBeautyRead(String uid) {
		return session.selectOne(namespace + ".myBeautyRead", uid);
	}

	@Override
	public int beautyCount(String uid) {
		return session.selectOne(namespace + ".beautyCount", uid);
	}

	@Override
	public void bisDeleteUpdate(int brno) {
		session.update(namespace + ".bisDeleteUpdate", brno);
		
	}

	@Override
	public List<BeautyRequestVO> beautyDeadlineList(String uid) {
		return session.selectList(namespace + ".beautyDeadlineList", uid);
	}

	@Override
	public int brno(String uid) {
		return session.selectOne(namespace + ".brno", uid);
	}

	@Override
	public List<BeautyRequestVO> beautyChooseList(String uid) {
		return session.selectList(namespace + ".beautyChooseList", uid);
	}

	@Override
	public void beautyChooseUpdate(int brno) {
		session.update(namespace + ".bChooseUpdate", brno);
		
	}

	@Override
	public int beautyTotalCount() {
		return session.selectOne(namespace + ".beautyTotalCount");
	}

	
}
