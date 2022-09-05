package com.example.dao;

import com.example.domain.ReserveVO;

import java.util.List;

public interface ReserveDAO {
	public List<ReserveVO> list(String id);
	public List<ReserveVO> oldlist(String id);
	public void insert(ReserveVO vo);
	public ReserveVO read(int rno);
	public List<ReserveVO> checkDateList(String checkin, String checkout);
	public void updateReserve(ReserveVO vo);
	public List<ReserveVO> comList(String id, String keyword);
	public List<ReserveVO> comOldlist(String id, String keyword);
	public List<ReserveVO> myCompany(String id);
	public void ReserveEdit(ReserveVO vo);
}
