package com.example.dao;

import com.example.domain.ChatRoomVO;

public interface ChatRoomDAO {
	public void create(String doctorid, String userid);
	public ChatRoomVO roominfo(int crno);
	public int selcrno(String doctorid, String userid);
}
