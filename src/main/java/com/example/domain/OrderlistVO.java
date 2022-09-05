package com.example.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class OrderlistVO extends shopproductVO {
	private int bno; //orderlist의 번호
	private String uid; //유저아이디
	private int pno; //상품번호 이게 안됨
	private int amount;//총 갯수
	private int final_price;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date odate;
	private String pname;
	private String pimage;
	
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getFinal_price() {
		return final_price;
	}
	public void setFinal_price(int final_price) {
		this.final_price = final_price;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	@Override
	public String toString() {
		return "OrderlistVO [bno=" + bno + ", uid=" + uid + ", pno=" + pno + ", amount=" + amount + ", final_price="
				+ final_price + ", odate=" + odate + ", getPname()=" + getPname() + ", getPimage()=" + getPimage()
				+ "]";
	}
	
	
	
	
	
}
