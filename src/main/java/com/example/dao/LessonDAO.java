package com.example.dao;

import com.example.domain.LessonRequestVO;

import java.util.List;

public interface LessonDAO {
	public void lessonInsert(LessonRequestVO vo);
	public List<LessonRequestVO> lessonList();
	public LessonRequestVO lessonRead(int lrno);
	public LessonRequestVO myLessonRead(String uid);
	public List<LessonRequestVO> lessonDeadlineList(String uid);
	public List<LessonRequestVO> lessonChooseList(String uid);
	public int lessonCount(String uid);
	public int lessongTotalCount();
	public void lisDeleteUpdate(int lrno);
	public void lChooseUpdate(int lrno);
	public int lrno(String uid);
}
