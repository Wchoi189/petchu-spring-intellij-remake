package com.example.dao;

import com.example.domain.CleaningRequestVO;

import java.util.List;



public interface CleaningDAO {
	public void cleangingInsert(CleaningRequestVO vo);
	public List<CleaningRequestVO> cleanList();
	public Object cleanRead(int crno);
	public CleaningRequestVO myCleanRead(String uid);
	public List<CleaningRequestVO> cleanDeadlineList(String uid);
	public List<CleaningRequestVO> cleanChooseList(String uid);
	public int cleaningCount(String uid);
	public int cleaningTotalCount();
	public void cisDeleteUpdate(int crno);
	public void cleanChooseUpdate(int crno);
	public int crno(String uid);
}
