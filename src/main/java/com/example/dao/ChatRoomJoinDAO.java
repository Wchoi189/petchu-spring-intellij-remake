package com.example.dao;

import com.example.domain.ChatRoomJoinVO;

import java.util.List;



public interface ChatRoomJoinDAO {
	public void create(String id, int crno);
	public List<ChatRoomJoinVO> chatList(String id);

}
