package com.example.dao;

import com.example.domain.StarVO;

import java.util.List;

public interface StarDAO {
	public List<StarVO> list();
	public void insert(StarVO vo);
	public double helpcount(int rid);
	public void updateHelpcount(int rid);
	public void updateHelpcountCancel(int rid);
	public double RatingAvg(int pno);
	public int updateRating(StarVO vo);
	public void delete(StarVO vo);
	public void update(StarVO vo);
}
