package com.example.dao;

import com.example.domain.Criteria;
import com.example.domain.RecruitVO;

import java.util.List;

public interface RecruitDAO {

	public List<RecruitVO> list(Criteria cri);
	public void insert(RecruitVO vo);
	public RecruitVO read(int bno);
	public void update(RecruitVO vo);
	public void delete(int bno);
}
