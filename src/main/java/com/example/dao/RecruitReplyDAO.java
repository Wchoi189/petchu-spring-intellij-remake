package com.example.dao;

import com.example.domain.Criteria;
import com.example.domain.RecruitReplyVO;

import java.util.List;

public interface RecruitReplyDAO {

	public List<RecruitReplyVO> list(int bno, Criteria cri);
	public void insert(RecruitReplyVO vo);
	public void update(RecruitReplyVO vo);
	public void delete(int rno);

	
	
	
}
