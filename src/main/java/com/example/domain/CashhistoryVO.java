package com.example.domain;

public class CashhistoryVO{
	private int chno;
	private String id;
	private int amount;
	private String content;
	private String regdate;
	
	
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	public int getChno() {
		return chno;
	}
	public void setChno(int chno) {
		this.chno = chno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "PointhistoryVO [chno=" + chno + ", id=" + id + ", amount=" + amount + ", content=" + content + "]";
	}
	
}