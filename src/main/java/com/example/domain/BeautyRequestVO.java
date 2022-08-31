package com.example.domain;

import org.springframework.format.annotation.DateTimeFormat;

public class BeautyRequestVO extends ServiceCoVO {
	public int brno;
	public String uid;
	public String nick;
	public String sccate;
    public String pcate;
    public String beauty_classification;
    public String weight;
    public String age;
    public String last_beautydate ;
    public String service_place;
    public String wish_date;
    public String wish_local1;
    public String wish_local2;
    public String detailed_matters;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public String bdate;
   
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public int choose_check;
    
	public int getChoose_check() {
		return choose_check;
	}
	public void setChoose_check(int choose_check) {
		this.choose_check = choose_check;
	}
	public int getBrno() {
		return brno;
	}
	public void setBrno(int brno) {
		this.brno = brno;
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
	public String getPcate() {
		return pcate;
	}
	public void setPcate(String pcate) {
		this.pcate = pcate;
	}
	public String getBeauty_classification() {
		return beauty_classification;
	}
	public void setBeauty_classification(String beauty_classification) {
		this.beauty_classification = beauty_classification;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getLast_beautydate() {
		return last_beautydate;
	}
	public void setLast_beautydate(String last_beautydate) {
		this.last_beautydate = last_beautydate;
	}
	public String getService_place() {
		return service_place;
	}
	public void setService_place(String service_place) {
		this.service_place = service_place;
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
	public String getDetailed_matters() {
		return detailed_matters;
	}
	public void setDetailed_matters(String detailed_matters) {
		this.detailed_matters = detailed_matters;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
    
	
    
    
}
