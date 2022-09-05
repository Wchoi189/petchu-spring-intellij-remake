package com.example.dao;

import com.example.domain.Criteria;
import com.example.domain.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.UserMapper";
 
	@Override
	public void insert(UserVO vo) {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public UserVO read(String id) {
		System.out.println(id);
		return session.selectOne(namespace+".read",id);
		
	}

	@Override
	public List<UserVO> list(Criteria cri) {
		return session.selectList(namespace + ".list", cri);
	}

	@Override
	public void update(UserVO vo) {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void updatepass(UserVO vo) {
		session.update(namespace + ".updatepass", vo);
	}

	@Override
	public void userDelete(String id) {
		session.update(namespace + ".userDelete", id);
		
	}

	@Override
	public void updatePoint(int amount, String id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("amount", amount);
		map.put("id", id);
		session.update(namespace + ".updatePoint", map);
		
	}

	@Override
	public int pointRead(String id) {
		return session.selectOne(namespace + ".pointRead", id);
	}

	@Override
	public String typechk(String id) {
		return session.selectOne(namespace + ".typechk", id);
	}

	@Override
	public int cashRead(String id) {
		return session.selectOne(namespace + ".cashRead", id);
	}

	@Override
	public void updateCash(int amount, String id) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("amount", amount);
		map.put("id", id);
		session.update(namespace + ".updateCash", map);
	}

	@Override
	public int userCount() {
		return session.selectOne(namespace + ".userCount");
	}

	@Override
	public List<HashMap<String, Object>> chartPrice() {
		return session.selectList(namespace + ".chartPrice");
	}

	@Override
	public List<HashMap<String, Object>> chartDate() {
		return session.selectList(namespace + ".chartDate");
	}

	
}