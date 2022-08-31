package com.example.service;

import com.example.dao.StarDAO;
import com.example.domain.StarVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class StarServiceImpl implements StarService{
	
	@Autowired
	StarDAO sdao;
	
	@Transactional
	@Override
	public void updatehelpcount(int rid) {
		sdao.updateHelpcount(rid);		
	}

	@Transactional
	@Override
	public void updatehelpcountcancel(int rid) {
		sdao.updateHelpcountCancel(rid);
		
	}
	
	@Transactional
	@Override
	public double helpcount(int rid) {
		double vo=sdao.helpcount(rid);
		return vo; 
	}

	@Override
	public void updateRatingAvg(int pno) {
		StarVO vo=new StarVO();
		double ratingAvg = sdao.RatingAvg(pno); //��ǰ�� ��� ���� ���ϱ�
		
		vo.setPno(pno);
		vo.setRatingAvg(ratingAvg); 
		
		sdao.updateRating(vo); // ��� ���� DB�� ����
	}
}
