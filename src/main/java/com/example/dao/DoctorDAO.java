package com.example.dao;

import java.util.List;

import com.example.domain.DoctorVO;

public interface DoctorDAO {
	public List<DoctorVO> hospitalList();
	public DoctorVO hospital(int dno);
	public void inserthospital(DoctorVO vo);
	public void updatehospital(DoctorVO vo);
	public int selectDno(String id);
}
