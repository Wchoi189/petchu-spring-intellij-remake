package com.example.domain;



public class CleaningRequestVO extends ServiceCoVO{
	public int crno;
	public String uid;
	public String nick;
	public String sccate;
    public String building_classification;
	public String house_size;
	public String wish_date;
	public String wish_local1;
	public String wish_local2;
	public String hope_matters;
	public int choose_check;
	
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	public String cdate;
	
	
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public int getChoose_check() {
		return choose_check;
	}
	public void setChoose_check(int choose_check) {
		this.choose_check = choose_check;
	}
	public int getCrno() {
		return crno;
	}
	public void setCrno(int crno) {
		this.crno = crno;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getSccate() {
		return sccate;
	}
	public void setSccate(String sccate) {
		this.sccate = sccate;
	}
	public String getBuilding_classification() {
		return building_classification;
	}
	public void setBuilding_classification(String building_classification) {
		this.building_classification = building_classification;
	}
	public String getHouse_size() {
		return house_size;
	}
	public void setHouse_size(String house_size) {
		this.house_size = house_size;
	}
	public String getWish_date() {
		return wish_date;
	}
	public void setWish_date(String wish_date) {
		this.wish_date = wish_date;
	}
	public String getWish_local1() {
		return wish_local1;
	}
	public void setWish_local1(String wish_local1) {
		this.wish_local1 = wish_local1;
	}
	public String getWish_local2() {
		return wish_local2;
	}
	public void setWish_local2(String wish_local2) {
		this.wish_local2 = wish_local2;
	}
	public String getHope_matters() {
		return hope_matters;
	}
	public void setHope_matters(String hope_matters) {
		this.hope_matters = hope_matters;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	
	
}
