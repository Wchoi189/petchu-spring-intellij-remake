package com.example.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ServiceEstimateVO extends EstimateDTO{
	public int seno;
	public int scno;
    public int brno;
    public int crno;
    public int lrno; 
	public String uid;
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	public Date sedate; 
	public int price;
	public String fprice;
	public int secheck;
	public int failcheck;
	public int choose_check;
	
	public int getFailcheck() {
		return failcheck;
	}
	public void setFailcheck(int failcheck) {
		this.failcheck = failcheck;
	}
	public String getFprice() {
		return fprice;
	}
	public void setFprice(String fprice) {
		this.fprice = fprice;
	}
	public String getHouse_size() {
		return house_size;
	}
	public void setHouse_size(String house_size) {
		this.house_size = house_size;
	}
	public String description;
	public String scname;
	public String building_classification;
	public String house_size;
	public String getBuilding_classification() {
		return building_classification;
	}
	public void setBuilding_classification(String building_classification) {
		this.building_classification = building_classification;
	}
	
	
	public String getScname() {
		return scname;
	}
	public int getSecheck() {
		return secheck;
	}
	public void setSecheck(int secheck) {
		this.secheck = secheck;
	}
	public void setScname(String scname) {
		this.scname = scname;
	}
	public int getSeno() {
		return seno;
	}
	public void setSeno(int seno) {
		this.seno = seno;
	}
	public int getScno() {
		return scno;
	}
	public void setScno(int scno) {
		this.scno = scno;
	}
	public int getBrno() {
		return brno;
	}
	public void setBrno(int brno) {
		this.brno = brno;
	}
	public int getCrno() {
		return crno;
	}
	public void setCrno(int crno) {
		this.crno = crno;
	}
	public int getLrno() {
		return lrno;
	}
	public void setLrno(int lrno) {
		this.lrno = lrno;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Date getSedate() {
		return sedate;
	}
	public void setSedate(Date sedate) {
		this.sedate = sedate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
