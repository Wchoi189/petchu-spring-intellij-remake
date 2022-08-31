package com.example.dao;

import com.example.domain.HelpVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HelpDAOImpl implements HelpDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.HelpMapper";
	
	@Override
	public void inserthelp(HelpVO vo) {
		session.insert(namespace + ".insertHelp", vo);
	}

	@Override
	public void deletehelp(HelpVO vo) {
		session.delete(namespace + ".deleteHelp", vo);
	}

	@Override
	public void updatehelpcheck(HelpVO vo) {
		session.update(namespace + ".updateHelpCheck", vo);
		
	}

	@Override
	public void updatehelpcheckcancel(HelpVO vo) {
		session.update(namespace + ".updateHelpCheckCancel", vo);
		
	}

	@Override
	public int helpcheckcount(HelpVO vo) {
		return session.selectOne(namespace + ".helpCheck", vo);
	}

}
