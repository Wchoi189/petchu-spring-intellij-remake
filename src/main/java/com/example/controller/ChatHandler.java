package com.example.controller;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


public class ChatHandler extends TextWebSocketHandler{
	//세션 리스트
	ArrayList<WebSocketSession> sessions = new ArrayList<>();
	
	
	//클라이언트와 연결이 끊긴 경우
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("연결 끊김 : " + session.getId());
		sessions.remove(session); //세션에서 삭제
		super.afterConnectionClosed(session, status);
	}

	//클라이언트가 연결 된 경우
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("연결 됨 : " + session.getId());
		sessions.add(session); //세션에 추가
		super.afterConnectionEstablished(session);
	}

	//클라이언트에게서 메세지가 전송 된 경우
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String strMessage = message.getPayload();
		System.out.println("메세지 전송");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		strMessage += "|" + date;
		System.out.println(strMessage);
		
		for(WebSocketSession web: sessions){
			web.sendMessage(new TextMessage(strMessage));
		}
		super.handleTextMessage(session, message);
	}
	
}
