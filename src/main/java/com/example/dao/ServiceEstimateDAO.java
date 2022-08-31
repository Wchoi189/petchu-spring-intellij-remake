package com.example.dao;

import com.example.domain.ServiceEstimateVO;

import java.util.List;



public interface ServiceEstimateDAO {
	//ä��
	public void secheckUpdate(int seno);
	
	public void bfailCheckUpdate(int brno);
	
	public void cfailCheckUpdate(int crno);
	
	public void lfailCheckUpdate(int lrno);
	
	//�ߺ�üũ
	public int overlabCheck(ServiceEstimateVO vo);
	
	public int overlabCheck2(ServiceEstimateVO vo);
	
	public int overlabCheck3(ServiceEstimateVO vo);
	
	//�̿�
	public void binsert(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> blist(int scno);
	
	public List<ServiceEstimateVO> brnolist(int brno);
	
	public ServiceEstimateVO beautyEstimateRead(int brno, int scno);
	
	//Ȩ Ŭ����
	public void cinsert(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> crnolist(int crno);
	
	public ServiceEstimateVO cleanEstimateRead(int crno, int scno);
	
	
	//����
	public void linsert(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> lrnolist(int lrno);
	
	public ServiceEstimateVO lessonEstimateRead(int lrno, int scno);
	
	//���� �� ������ ����
	
	public List<ServiceEstimateVO> beautyViewList(int scno);
	public ServiceEstimateVO beautyViewRead(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> cleaningViewList(int scno);
	public ServiceEstimateVO cleaningViewRead(ServiceEstimateVO vo);
	
	public List<ServiceEstimateVO> lessonViewList(int scno);
	public ServiceEstimateVO lessonViewRead(ServiceEstimateVO vo);
}
