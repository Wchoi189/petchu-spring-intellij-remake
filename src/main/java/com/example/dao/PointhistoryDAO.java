package com.example.dao;

import com.example.domain.PointhistoryVO;

import java.util.List;

public interface PointhistoryDAO {
	public List<PointhistoryVO> readPH(String id);
	public void insertPH(PointhistoryVO vo);
}
