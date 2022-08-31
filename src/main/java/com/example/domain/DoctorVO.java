package com.example.domain;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class DoctorVO extends UserVO{
	private int dno;
	private String id;
	private String dname;
	private String dlicense;
	@DateTimeFormat(pattern = "HH:mm")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm", timezone = "Asia/Seoul")
	private String open;
	@DateTimeFormat(pattern = "HH:mm")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm", timezone = "Asia/Seoul")
	private String o_break;
	@DateTimeFormat(pattern = "HH:mm")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm", timezone = "Asia/Seoul")
	private String c_break;
	@DateTimeFormat(pattern = "HH:mm")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm", timezone = "Asia/Seoul")
	private String close;
	private String dtel;
	private String dinfo;
	private String dzipcode;
	private String daddress1;
	private String daddress2;
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDlicense() {
		return dlicense;
	}
	public void setDlicense(String dlicense) {
		this.dlicense = dlicense;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getO_break() {
		return o_break;
	}
	public void setO_break(String o_break) {
		this.o_break = o_break;
	}
	public String getC_break() {
		return c_break;
	}
	public void setC_break(String c_break) {
		this.c_break = c_break;
	}
	public String getClose() {
		return close;
	}
	public void setClose(String close) {
		this.close = close;
	}
	public String getDtel() {
		return dtel;
	}
	public void setDtel(String dtel) {
		this.dtel = dtel;
	}
	public String getDinfo() {
		return dinfo;
	}
	public void setDinfo(String dinfo) {
		this.dinfo = dinfo;
	}
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
	@Override
	public String toString() {
		return "DoctorVO [dno=" + dno + ", id=" + id + ", dname=" + dname + ", dlicense=" + dlicense + ", open=" + open
				+ ", o_break=" + o_break + ", c_break=" + c_break + ", close=" + close + ", dtel=" + dtel + ", dinfo="
				+ dinfo + ", dzipcode=" + dzipcode + ", daddress1=" + daddress1 + ", daddress2=" + daddress2 + "]";
	}
	
	

}
