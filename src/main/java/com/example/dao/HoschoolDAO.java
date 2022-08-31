package com.example.dao;

import java.util.List;

import com.example.domain.ReserveVO;
import com.example.domain.ServiceVO;


public interface HoschoolDAO {
//	public List<ServiceVO> list(Criteria cri);
	//public List<ReserveVO> list(Criteria cri, String checkin, String checkout);
	public List<ReserveVO> list(ReserveVO vo);
	public ServiceVO read(int scno);
	public void insert(ServiceVO vo);
	public void update(ServiceVO vo);
	public void delete(int scno);
	public List<ServiceVO> myList(String id);
	public void addinfo(int sno);
	public int chkscno();
	public void userDelete(String id);
	public int reviewAllCount(int scno, String id);
	public int reviewWriteCount(int scno, String id);
}
