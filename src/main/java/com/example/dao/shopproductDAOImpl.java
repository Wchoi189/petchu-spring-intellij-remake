package com.example.dao;

import com.example.domain.Criteria;
import com.example.domain.shopcartVO;
import com.example.domain.shopproductVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
@Repository
public class shopproductDAOImpl implements shopproductDAO{

	@Autowired
	SqlSession session;
	
	String namespace="com.example.mapper.shopproductMapper";

	//상품 정보 (추후 수정 필요)
	public List<shopproductVO> list() {
		return session.selectList(namespace+".list");
	}

	//상품 정보 페이지
	@Override
	public shopproductVO read(int pno) {
		return session.selectOne(namespace+".read", pno);
	}

	//카테고리 설정 후 필터링된 상품목록 페이지
	@Override
	public List<shopproductVO> contents_list(String selectCate, String selectCate2, String selectCate3, Criteria cri) {
		HashMap<String, Object> map = new HashMap<>();
		//카테고리 정보를 가지고 이동
		map.put("selectCate", selectCate);
		map.put("selectCate2", selectCate2);
		map.put("selectCate3", selectCate3);
		map.put("cri", cri);
		map.put("keyword", cri.getKeyword());
		return session.selectList(namespace+".contents_list", map);
	}

	//주문목록
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
