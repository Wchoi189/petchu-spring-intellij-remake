package com.example.dao;

import com.example.domain.ChatMessageVO;

import java.util.List;

public interface ChatMessageDAO {
	public List<ChatMessageVO> print(int crno);
	public void send(ChatMessageVO vo);
	public List<ChatMessageVO> chatList(String id);
	public ChatMessageVO receinfo(int crno);
	public void readdate(int crno, String id);
	public int notread(int crno, String id);
	public int notreadall(String id);
}
