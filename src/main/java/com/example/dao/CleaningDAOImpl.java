package com.example.dao;

import com.example.domain.CleaningRequestVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CleaningDAOImpl implements CleaningDAO{

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.CleaningRequestMapper";
	
	@Override
	public void cleangingInsert(CleaningRequestVO vo) {
		session.insert(namespace + ".cleanInsert", vo);
		
	}

	@Override
	public List<CleaningRequestVO> cleanList() {
		return session.selectList(namespace + ".cleanList") ;
	}

	@Override
	public CleaningRequestVO cleanRead(int crno) {
		return session.selectOne(namespace + ".cleanRead", crno);
	}

	@Override
	public CleaningRequestVO myCleanRead(String uid) {
		return session.selectOne(namespace + ".mycleaningRead", uid);
	}

	@Override
	public int cleaningCount(String uid) {
		return session.selectOne(namespace + ".cleaningCount", uid);
	}

	@Override
	public void cisDeleteUpdate(int crno) {
		session.update(namespace + ".cisDeleteUpdate", crno);
		
	}

	@Override
	public List<CleaningRequestVO> cleanDeadlineList(String uid) {
		return session.selectList(namespace + ".cleanDeadlineList", uid);
	}

	@Override
	public int crno(String uid) {
		return session.selectOne(namespace + ".crno", uid);
	}

	@Override
	public List<CleaningRequestVO> cleanChooseList(String uid) {
		return session.selectList(namespace + ".cleanChooseList", uid);
	}

	@Override
	public void cleanChooseUpdate(int crno) {
		session.update(namespace + ".cChooseUpdate", crno);
		
	}

	@Override
	public int cleaningTotalCount() {
		return session.selectOne(namespace + ".cleaningTotalCount");
	}

}
