package com.example.domain;

public class shopproductVO {
	private int pno;
	private String pname;
	private int pprice;
	private String pbrand;
	private String pmaker;
	private String pcontents;
	private int prate;
	private String pimage;
	private String pcate1;
	private String pcate2;
	private String pcate3;
	private String pcate4;
	private int pqantity;
	private int pisdelete;
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
	public String getPmaker() {
		return pmaker;
	}
	public void setPmaker(String pmaker) {
		this.pmaker = pmaker;
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
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
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
	public int getPisdelete() {
		return pisdelete;
	}
	public void setPisdelete(int pisdelete) {
		this.pisdelete = pisdelete;
	}
	public int getPqantity() {
		return pqantity;
	}
	public void setPqantity(int pqantity) {
		this.pqantity = pqantity;
	}
	@Override
	public String toString() {
		return "shopproductVO [pno=" + pno + ", pname=" + pname + ", pprice=" + pprice + ", pbrand=" + pbrand
				+ ", pmaker=" + pmaker + ", pcontents=" + pcontents + ", prate=" + prate + ", pimage=" + pimage
				+ ", pcate1=" + pcate1 + ", pcate2=" + pcate2 + ", pcate3=" + pcate3 + ", pcate4=" + pcate4
				+ ", pqantity=" + pqantity + ", pisdelete=" + pisdelete + "]";
	}
	
	
}
