package com.example.domain;

import java.util.Date;

public class FaqVO {

	private String title;
	private String contents;
	private int fno;
	private Date regdate;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "FaqVO [title=" + title + ", contents=" + contents + ", fno=" + fno + ", regdate=" + regdate + "]";
	}
	
	
	
}
