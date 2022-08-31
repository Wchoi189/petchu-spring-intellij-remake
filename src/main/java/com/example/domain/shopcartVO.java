package com.example.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class shopcartVO {
	private int cno;
	private int pno;
	private String uid;
	private int amount;
	//
	private String pimage;
	private String pname;
	private int pprice;
	private int sum;
	private int chk;
	//
	private String bno;
	private String ono;
	private String oamount;
	private int final_price;
	private String orno;
	private String odate;
	private String zipcode;
	private String address1;
	private String address2;
	//
	private String receiver;
	private String tel;
	//
	private int sellcount;
	//
	private int point;
	//
	private String omessage;
	private int pqantity;
	private int state;
	////////////////////
	////review/////////
	private int rid;//�����ȣ
	private String rtitle; //���ٿ��
	private double star; //��
	private String review; //���� ����
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date rdate; //�����ۼ��ð�
	private String rimage1; 
	private String rimage2; //��ǰ�̹���
	private int helpcount; // ����Ǹ� ����

	
	
	public int getRid() {
		return rid;
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
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getPqantity() {
		return pqantity;
	}
	public void setPqantity(int pqantity) {
		this.pqantity = pqantity;
	}
	public String getOmessage() {
		return omessage;
	}
	public void setOmessage(String omessage) {
		this.omessage = omessage;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getSellcount() {
		return sellcount;
	}
	public void setSellcount(int sellcount) {
		this.sellcount = sellcount;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	public String getOrno() {
		return orno;
	}
	public void setOrno(String orno) {
		this.orno = orno;
	}
	public int getChk() {
		return chk;
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public String getOamount() {
		return oamount;
	}
	public void setOamount(String oamount) {
		this.oamount = oamount;
	}
	public int getFinal_price() {
		return final_price;
	}
	public void setFinal_price(int final_price) {
		this.final_price = final_price;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "shopcartVO [uid=" + uid + ", pno=" + pno + "]";
	}
}
