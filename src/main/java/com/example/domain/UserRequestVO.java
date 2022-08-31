package com.example.domain;

public class UserRequestVO extends PetVO{
	private int rno;
	private boolean d1;
	private boolean d2;
	private boolean d3;
	private boolean d4;
	private boolean d5;
	private String d_etc;
	private String dvedio;
	private String dimg1;
	private String dimg2;
	private String dimg3;
	private String dimg4;
	private int pno;
	private boolean is_checked;
	private String regdate;
	
	
	
	public String getRegdate() {
		return regdate;
	}



	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}



	public String getDimg4() {
		return dimg4;
	}



	public void setDimg4(String dimg4) {
		this.dimg4 = dimg4;
	}



	public int getRno() {
		return rno;
	}



	public void setRno(int rno) {
		this.rno = rno;
	}



	public boolean isD1() {
		return d1;
	}



	public void setD1(boolean d1) {
		this.d1 = d1;
	}



	public boolean isD2() {
		return d2;
	}



	public void setD2(boolean d2) {
		this.d2 = d2;
	}



	public boolean isD3() {
		return d3;
	}



	public void setD3(boolean d3) {
		this.d3 = d3;
	}



	public boolean isD4() {
		return d4;
	}



	public void setD4(boolean d4) {
		this.d4 = d4;
	}



	public boolean isD5() {
		return d5;
	}



	public void setD5(boolean d5) {
		this.d5 = d5;
	}



	public String getD_etc() {
		return d_etc;
	}



	public void setD_etc(String d_etc) {
		this.d_etc = d_etc;
	}



	public String getDvedio() {
		return dvedio;
	}



	public void setDvedio(String dvedio) {
		this.dvedio = dvedio;
	}



	public String getDimg1() {
		return dimg1;
	}



	public void setDimg1(String dimg1) {
		this.dimg1 = dimg1;
	}



	public String getDimg2() {
		return dimg2;
	}



	public void setDimg2(String dimg2) {
		this.dimg2 = dimg2;
	}



	public String getDimg3() {
		return dimg3;
	}



	public void setDimg3(String dimg3) {
		this.dimg3 = dimg3;
	}



	public int getPno() {
		return pno;
	}



	public void setPno(int pno) {
		this.pno = pno;
	}



	public boolean isIs_checked() {
		return is_checked;
	}



	public void setIs_checked(boolean is_checked) {
		this.is_checked = is_checked;
	}



	@Override
	public String toString() {
		return "UserRequestVO [rno=" + rno + ", d1=" + d1 + ", d2=" + d2 + ", d3=" + d3 + ", d4=" + d4 + ", d5=" + d5
				+ ", d_etc=" + d_etc + ", dvedio=" + dvedio + ", dimg1=" + dimg1 + ", dimg2=" + dimg2 + ", dimg3="
				+ dimg3 + ", pno=" + pno + ", is_checked=" + is_checked + "]";
	}

}
	