package com.example.dao;

import com.example.domain.UserRequestVO;

import java.util.List;

public interface UserRequestDAO {
	public void sendRequest(UserRequestVO vo);
	public List<UserRequestVO> requestList();
	public UserRequestVO receRequest(int rno);
	public List<UserRequestVO> chkRequest(int pno);
	public void updatechk(int rno);
	public List<UserRequestVO> regdatechk(int pno);
}
