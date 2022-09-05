package com.example.dao;

import com.example.domain.ServiceEstimateVO;

import java.util.List;

public interface ServiceEstimateDAO {
	//채택
	public void secheckUpdate(int seno);
	
	public void bfailCheckUpdate(int brno);
	
	public void cfailCheckUpdate(int crno);
	
	public void lfailCheckUpdate(int lrno);
	
	//중복체크
	public int overlabCheck(ServiceEstimateVO vo);
	
	public int overlabCheck2(ServiceEstimateVO vo);
	
	public int overlabCheck3(ServiceEstimateVO vo);
	
	//미용
	public void binsert(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> blist(int scno);
	
	public List<ServiceEstimateVO> brnolist(int brno);
	
	public ServiceEstimateVO beautyEstimateRead(int brno, int scno);
	
	//홈 클리닝
	public void cinsert(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> crnolist(int crno);
	
	public ServiceEstimateVO cleanEstimateRead(int crno, int scno);
	
	
	//레슨
	public void linsert(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> lrnolist(int lrno);
	
	public ServiceEstimateVO lessonEstimateRead(int lrno, int scno);
	
	//내가 쓴 견적서 보기
	
	public List<ServiceEstimateVO> beautyViewList(int scno);
	public ServiceEstimateVO beautyViewRead(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> cleaningViewList(int scno);
	public ServiceEstimateVO cleaningViewRead(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> lessonViewList(int scno);
	public ServiceEstimateVO lessonViewRead(ServiceEstimateVO vo);
}
