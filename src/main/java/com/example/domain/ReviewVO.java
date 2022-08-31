package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReviewVO extends OrderlistVO{
	private int rid;//�����ȣ
	private String rtitle; //���ٿ��
	private double star; //��
	private String review; //���� ����
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date rdate; //�����ۼ��ð�
	private String rimage1; 
	private String rimage2; //��ǰ�̹���
	private String rimage3;
	private int helpcount; // ����Ǹ� ����
	private int pno; //��ǰ��ȣ
	private String uid; //�������̵�
	private int bno;
	public int getRid() {
		return rid;
	}
	public String getRimage3() {
		return rimage3;
	}
	public void setRimage3(String rimage3) {
		this.rimage3 = rimage3;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public String getRimage1() {
		return rimage1;
	}
	public void setRimage1(String rimage1) {
		this.rimage1 = rimage1;
	}
	public String getRimage2() {
		return rimage2;
	}
	public void setRimage2(String rimage2) {
		this.rimage2 = rimage2;
	}
	public int getHelpcount() {
		return helpcount;
	}
	public void setHelpcount(int helpcount) {
		this.helpcount = helpcount;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "ReviewVO [rid=" + rid + ", rtitle=" + rtitle + ", star=" + star + ", review=" + review + ", rdate="
				+ rdate + ", rimage1=" + rimage1 + ", rimage2=" + rimage2 + ", helpcount=" + helpcount + ", pno=" + pno
				+ ", uid=" + uid + ", bno=" + bno + "]";
	}
	

	
	
	
}
