package com.example.dao;

import com.example.domain.HelpVO;

public interface HelpDAO {
	public void inserthelp(HelpVO vo);
	public void deletehelp(HelpVO vo);
	public void updatehelpcheck(HelpVO vo);
	public void updatehelpcheckcancel(HelpVO vo);
	public int helpcheckcount(HelpVO vo);
}
