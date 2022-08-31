package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.domain.ChatRoomJoinVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomJoinDAOImpl implements ChatRoomJoinDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ChatRoomJoinMapper";
	
	@Override
	public void create(String id, int crno) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("crno", crno);
		session.insert(namespace + ".create", map);
	}

	@Override
	public List<ChatRoomJoinVO> chatList(String id) {
		return session.selectList(namespace + ".chatList", id);
	}

}
