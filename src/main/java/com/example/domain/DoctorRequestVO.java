package com.example.domain;

public class DoctorRequestVO extends PetVO{
	private int drno;
	private String drdisease;
	private String drcontent;
	private String drfile;
	private int drprice;
	private int pno;
	private String ddate;
	private int dno;
	private String dname;
	private String dzipcode;
	private String daddress1;
	private String daddress2;

	public String getDzipcode() {
		return dzipcode;
	}
	public void setDzipcode(String dzipcode) {
		this.dzipcode = dzipcode;
	}
	public String getDaddress1() {
		return daddress1;
	}
	public void setDaddress1(String daddress1) {
		this.daddress1 = daddress1;
	}
	public String getDaddress2() {
		return daddress2;
	}
	public void setDaddress2(String daddress2) {
		this.daddress2 = daddress2;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public int getDrno() {
		return drno;
	}
	public void setDrno(int drno) {
		this.drno = drno;
	}
	public String getDrdisease() {
		return drdisease;
	}
	public void setDrdisease(String drdisease) {
		this.drdisease = drdisease;
	}
	public String getDrcontent() {
		return drcontent;
	}
	public void setDrcontent(String drcontent) {
		this.drcontent = drcontent;
	}
	public String getDrfile() {
		return drfile;
	}
	public void setDrfile(String drfile) {
		this.drfile = drfile;
	}
	public int getDrprice() {
		return drprice;
	}
	public void setDrprice(int drprice) {
		this.drprice = drprice;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getDdate() {
		return ddate;
	}
	public void setDdate(String ddate) {
		this.ddate = ddate;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	@Override
	public String toString() {
		return "DoctorRequestVO [drno=" + drno + ", drdisease=" + drdisease + ", drcontent=" + drcontent + ", drfile="
				+ drfile + ", drprice=" + drprice + ", pno=" + pno + ", ddate=" + ddate + ", dno=" + dno + "]";
	}
	
	

}
