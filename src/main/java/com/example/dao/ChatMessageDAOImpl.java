package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.domain.ChatMessageVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatMessageDAOImpl implements ChatMessageDAO{

	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ChatMessageMapper";
	
	@Override
	public List<ChatMessageVO> print(int crno) {
		return session.selectList(namespace + ".print", crno);
	}

	@Override
	public void send(ChatMessageVO vo) {
		session.insert(namespace + ".send", vo);
		
	}

	@Override
	public List<ChatMessageVO> chatList(String id) {
		return session.selectList(namespace + ".chatList", id);
	}

	@Override
	public Object receinfo(int crno) {
		return session.selectOne(namespace + ".receinfo", crno);
	}

	@Override
	public void readdate(int crno, String id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("crno", crno);
		map.put("id", id);
		session.update(namespace + ".readdate", map);
	}

	@Override
	public int notread(int crno, String id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("crno", crno);
		map.put("id", id);
		return session.selectOne(namespace +".notread",map);
	}

	@Override
	public int notreadall(String id) {
		return session.selectOne(namespace+ ".notreadall", id);
	}


}
