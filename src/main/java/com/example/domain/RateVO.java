package com.example.domain;

public class RateVO {
	private int rno;
	private String id;
	private int scno;
	private int rate;
	private String comments;
	private String revDate;
	private int start;
	private int perPageNum;
	private double avgrate;
	
	
	
	public double getAvgrate() {
		return avgrate;
	}
	public void setAvgrate(double avgrate) {
		this.avgrate = avgrate;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public String getRevDate() {
		return revDate;
	}
	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getScno() {
		return scno;
	}
	public void setScno(int scno) {
		this.scno = scno;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "RateVO [rno=" + rno + ", id=" + id + ", scno=" + scno + ", rate=" + rate + ", comments=" + comments
				+ "]";
	}
	
	
}
