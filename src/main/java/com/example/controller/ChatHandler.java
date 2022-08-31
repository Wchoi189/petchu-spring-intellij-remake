package com.example.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class ChatHandler extends TextWebSocketHandler{
	//���� ����Ʈ
	ArrayList<WebSocketSession> sessions = new ArrayList<>();
	
	
	//Ŭ���̾�Ʈ�� ������ ���� ���
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("���� ���� : " + session.getId());
		sessions.remove(session); //���ǿ��� ����
		super.afterConnectionClosed(session, status);
	}

	//Ŭ���̾�Ʈ�� ���� �� ���
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("���� �� : " + session.getId());
		sessions.add(session); //���ǿ� �߰�
		super.afterConnectionEstablished(session);
	}

	//Ŭ���̾�Ʈ���Լ� �޼����� ���� �� ���
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String strMessage = message.getPayload();
		System.out.println("�޼��� ����");
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
