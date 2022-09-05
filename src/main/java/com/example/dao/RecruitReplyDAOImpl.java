package com.example.dao;

import com.example.domain.Criteria;
import com.example.domain.RecruitReplyVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class RecruitReplyDAOImpl implements RecruitReplyDAO{

	@Autowired
	SqlSession session;
	
	String namespace="com.example.mapper.RecruitReplyMapper";
	
	
	@Override
	public List<RecruitReplyVO> list(int bno, Criteria cri) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("bno", bno);
		map.put("cri", cri);
		return session.selectList(namespace+".list",map);
	}

	@Override
	public void insert(RecruitReplyVO vo) {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public void update(RecruitReplyVO vo) {
		session.update(namespace+".update",vo);
		
	}

	@Override
	public void delete(int rno) {
		session.delete(namespace+".delete",rno);
		
	}

	
}
