package com.example.domain;

public class ServiceVO {
	private int scno;
	private String id;
	private String sccate;
	private String scname;
	private String scimage;
	private String sclicense;
	private String sctel;
	private String sczipcode;
	private String scaddress1;
	private String scaddress2;
	private String sconeline;
	private String scdetail_description;
	private String opentime;
	private String breaktime;
	private String closetime;
	private int scprice;
	private int isDelete;
	private String bgimage;
	private String tag;
	
	
	
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getScprice() {
		return scprice;
	}
	public void setScprice(int scprice) {
		this.scprice = scprice;
	}
	public String getBgimage() {
		return bgimage;
	}
	public void setBgimage(String bgimage) {
		this.bgimage = bgimage;
	}
	public int getScno() {
		return scno;
	}
	public void setScno(int scno) {
		this.scno = scno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSccate() {
		return sccate;
	}
	public void setSccate(String sccate) {
		this.sccate = sccate;
	}
	public String getScname() {
		return scname;
	}
	public void setScname(String scname) {
		this.scname = scname;
	}
	public String getScimage() {
		return scimage;
	}
	public void setScimage(String scimage) {
		this.scimage = scimage;
	}
	public String getSclicense() {
		return sclicense;
	}
	public void setSclicense(String sclicense) {
		this.sclicense = sclicense;
	}
	public String getSctel() {
		return sctel;
	}
	public void setSctel(String sctel) {
		this.sctel = sctel;
	}
	public String getSczipcode() {
		return sczipcode;
	}
	public void setSczipcode(String sczipcode) {
		this.sczipcode = sczipcode;
	}
	public String getScaddress1() {
		return scaddress1;
	}
	public void setScaddress1(String scaddress1) {
		this.scaddress1 = scaddress1;
	}
	public String getScaddress2() {
		return scaddress2;
	}
	public void setScaddress2(String scaddress2) {
		this.scaddress2 = scaddress2;
	}
	public String getSconeline() {
		return sconeline;
	}
	public void setSconeline(String sconeline) {
		this.sconeline = sconeline;
	}
	public String getScdetail_description() {
		return scdetail_description;
	}
	public void setScdetail_description(String scdetail_description) {
		this.scdetail_description = scdetail_description;
	}
	public String getOpentime() {
		return opentime;
	}
	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}
	public String getBreaktime() {
		return breaktime;
	}
	public void setBreaktime(String breaktime) {
		this.breaktime = breaktime;
	}
	public String getClosetime() {
		return closetime;
	}
	public void setClosetime(String closetime) {
		this.closetime = closetime;
	}
	@Override
	public String toString() {
		return "ServiceVO [scno=" + scno + ", id=" + id + ", sccate=" + sccate + ", scname=" + scname + ", scimage="
				+ scimage + ", sclicense=" + sclicense + ", sctel=" + sctel + ", sczipcode=" + sczipcode
				+ ", scaddress1=" + scaddress1 + ", scaddress2=" + scaddress2 + ", sconeline=" + sconeline
				+ ", scdetail_description=" + scdetail_description + ", opentime=" + opentime + ", breaktime="
				+ breaktime + ", closetime=" + closetime + "]";
	}
	
	
}
