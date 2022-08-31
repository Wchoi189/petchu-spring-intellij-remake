package com.example.dao;

import com.example.domain.DoctorRequestVO;

import java.util.List;

public interface DoctorRequestDAO {
	public void replyRequest(DoctorRequestVO vo);
	public List<DoctorRequestVO> resultRequestList(String id);
	public DoctorRequestVO resultRequest(int drno);
}
