package com.example.dao;

import java.util.List;

import com.example.domain.PetVO;

public interface PetDAO {
	public List<PetVO> readPetList(String id);
	public PetVO readPet(int pno);
	public void insertPet(PetVO vo);
	public void deletePet(int pno);
	public void updatePet(PetVO vo);
}
