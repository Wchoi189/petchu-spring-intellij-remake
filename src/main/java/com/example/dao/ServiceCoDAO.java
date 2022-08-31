package com.example.dao;

import com.example.domain.ServiceCoVO;

import java.util.List;



public interface ServiceCoDAO {
	public List<ServiceCoVO>list(String id);
	
	public void insert(ServiceCoVO vo);
	
	public Object read (int scno);
	
	public void update(ServiceCoVO vo);

	public void delete(int scno);

	public List<ServiceCoVO> partialbRead0(String id);
	
	public ServiceCoVO partialbRead(String id);
	
	public ServiceCoVO partialbRead2(String id);
	
	public ServiceCoVO partialbRead3(String id);

}
