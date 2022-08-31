package com.example.domain;

import java.util.Date;

public class RecruitVO {
	private int bno;
	private String id;
	private String contents;
	private String type;
	
	private Date regdate;
	
	
	@Override
	public String toString() {
		return "RecruitVO [bno=" + bno + ", id=" + id + ", contents=" + contents + ", type=" + type + ", regdate="
				+ regdate + "]";
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	

}
