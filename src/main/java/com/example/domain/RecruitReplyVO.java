package com.example.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class RecruitReplyVO extends RecruitVO{
 private int rno;
 private int bno;
 private String reply;
 private String id;
 @JsonFormat (pattern="yyyy-MM-dd HH:mm", timezone="Asia/Seoul")
 private Date regdate;
public int getRno() {
	return rno;
}
public void setRno(int rno) {
	this.rno = rno;
}
public int getBno() {
	return bno;
}
public void setBno(int bno) {
	this.bno = bno;
}
public String getReply() {
	return reply;
}
public void setReply(String reply) {
	this.reply = reply;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
@Override
public String toString() {
	return "recruitReplyVO [rno=" + rno + ", bno=" + bno + ", reply=" + reply + ", id=" + id + ", regdate=" + regdate
			+ "]";
}
 
 
 
}
