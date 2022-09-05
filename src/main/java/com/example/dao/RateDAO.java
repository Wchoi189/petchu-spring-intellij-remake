package com.example.dao;

import com.example.domain.RateVO;

import java.util.List;

public interface RateDAO {
	public void rateInsert(RateVO vo);
	public List<RateVO> reviewList(int scno, int start, int perPageNum);
	public int reviewCount(int scno);
	public List<RateVO> avgRate();
	public double avgRateRead(int scno);
}
