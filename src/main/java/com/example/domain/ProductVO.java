package com.example.domain;

public class ProductVO {
	private int pno; 
	private String pname; 
	private int pprice; 
	private String pbrand; 
	private String pcontents; 
	private int prate; 
	private String pcate1; 
	private String pcate2;
	private String pcate3;
	private String pcate4;
	private String pimage;
	private String pmaker;
	private int pqantity;
	//order_list vo 추가 => 오류방지를 위해 일부러 extends 사용 안함
	private String uono;
	private String orno;
	private String uid;
	private String paydate;
	private int amount;
	private String zipcode;
	private String address1;
	private String address2;
	private String receiver;
	private String tel;
	private String omessage;
	private int sum;
	private int point;
	private int state;
	
	
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getUono() {
		return uono;
	}
	public void setUono(String uono) {
		this.uono = uono;
	}
	public String getOrno() {
		return orno;
	}
	public void setOrno(String orno) {
		this.orno = orno;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
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
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getOmessage() {
		return omessage;
	}
	public void setOmessage(String omessage) {
		this.omessage = omessage;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public int getPqantity() {
		return pqantity;
	}
	public void setPqantity(int pqantity) {
		this.pqantity = pqantity;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public String getPmaker() {
		return pmaker;
	}
	public void setPmaker(String pmaker) {
		this.pmaker = pmaker;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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
	public String getPbrand() {
		return pbrand;
	}
	public void setPbrand(String pbrand) {
		this.pbrand = pbrand;
	}
	public String getPcontents() {
		return pcontents;
	}
	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}
	public int getPrate() {
		return prate;
	}
	public void setPrate(int prate) {
		this.prate = prate;
	}
	public String getPcate1() {
		return pcate1;
	}
	public void setPcate1(String pcate1) {
		this.pcate1 = pcate1;
	}
	public String getPcate2() {
		return pcate2;
	}
	public void setPcate2(String pcate2) {
		this.pcate2 = pcate2;
	}
	public String getPcate3() {
		return pcate3;
	}
	public void setPcate3(String pcate3) {
		this.pcate3 = pcate3;
	}
	public String getPcate4() {
		return pcate4;
	}
	public void setPcate4(String pcate4) {
		this.pcate4 = pcate4;
	}
	
	@Override
	public String toString() {
		return "ProductVO [pno=" + pno + ", pname=" + pname + ", pprice=" + pprice + ", pbrand=" + pbrand
				+ ", pcontents=" + pcontents + ", prate=" + prate + ", pcate1=" + pcate1 + ", pcate2=" + pcate2
				+ ", pcate3=" + pcate3 + ", pcate4=" + pcate4 + ", pimage=" + pimage + ", pmaker=" + pmaker + "]";
	}
	
	
	
	
}
