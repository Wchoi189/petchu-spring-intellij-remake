package com.example.dao;

import java.util.HashMap;
import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.shopcartVO;
import com.example.domain.shopproductVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class shopproductDAOImpl implements shopproductDAO{

	@Autowired
	SqlSession session;
	
	String namespace="com.example.mapper.shopproductMapper";

	//��ǰ ���� (���� ���� �ʿ�)
	public List<shopproductVO> list() {
		return session.selectList(namespace+".list");
	}

	//��ǰ ���� ������
	@Override
	public shopproductVO read(int pno) {
		return session.selectOne(namespace+".read", pno);
	}

	//ī�װ� ���� �� ���͸��� ��ǰ��� ������
	@Override
	public List<shopproductVO> contents_list(String selectCate, String selectCate2, String selectCate3, Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		//ī�װ� ������ ������ �̵�
		map.put("selectCate", selectCate);
		map.put("selectCate2", selectCate2);
		map.put("selectCate3", selectCate3);
		map.put("cri", cri);
		map.put("keyword", cri.getKeyword());
		return session.selectList(namespace+".contents_list", map);
	}

	//�ֹ����
		@Override
		public shopcartVO cart_read(String uid) {
			return session.selectOne(namespace+".cart_read", uid);
		}

		@Override
		public int totalCount(String selectCate, String selectCate2, String selectCate3, Criteria cri) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("selectCate", selectCate);
			map.put("selectCate2", selectCate2);
			map.put("selectCate3", selectCate3);
			map.put("keyword", cri.getKeyword());
			return session.selectOne(namespace+".totalCount", map);
		}
	
	

}
