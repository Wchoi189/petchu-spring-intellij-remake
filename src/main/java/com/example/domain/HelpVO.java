package com.example.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class HelpVO extends StarVO { //댓글추천 중복체크  DB
	private int hno;
	private String uid;
	private int rid;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date hdate;
	
	private int helpcheck;

	public int getHno() {
		return hno;
	}

	public void setHno(int hno) {
		this.hno = hno;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public Date getHdate() {
		return hdate;
	}

	public void setHdate(Date hdate) {
		this.hdate = hdate;
	}

	public int getHelpcheck() {
		return helpcheck;
	}

	public void setHelpcheck(int helpcheck) {
		this.helpcheck = helpcheck;
	}
	
	
}
