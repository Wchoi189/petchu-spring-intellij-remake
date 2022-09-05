package com.example.dao;

import com.example.domain.ChatRoomVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

@Repository
public class ChatRoomDAOImpl implements ChatRoomDAO{

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ChatRoomMapper";
	
	@Override
	public void create(String doctorid, String userid) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("doctorid", doctorid);
		map.put("userid", userid);
		session.insert(namespace + ".create", map);		
	}


	@Override
	public ChatRoomVO roominfo(int crno) {
		return session.selectOne(namespace+ ".roominfo", crno);
	}


	@Override
	public int selcrno(String doctorid, String userid) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("doctorid", doctorid);
		map.put("userid", userid);
		return session.selectOne(namespace + ".selcrno", map);
	}
	
}
