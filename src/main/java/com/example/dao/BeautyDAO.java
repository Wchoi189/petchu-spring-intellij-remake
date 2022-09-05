package com.example.dao;

import com.example.domain.BeautyRequestVO;

import java.util.List;

public interface BeautyDAO {
	public void beautyInsert(BeautyRequestVO vo);
	public List<BeautyRequestVO> beautyList();
	public BeautyRequestVO beautyRead(int brno);
	public BeautyRequestVO myBeautyRead(String uid);
	public List<BeautyRequestVO>  beautyDeadlineList(String uid);
	public List<BeautyRequestVO>  beautyChooseList(String uid);
	public int beautyCount(String uid);
	public int beautyTotalCount();
	public void bisDeleteUpdate(int brno);
	public void beautyChooseUpdate(int brno);
	public int brno(String uid);
}
