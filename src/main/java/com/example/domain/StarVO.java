package com.example.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class StarVO extends UserVO{ //review db
	public int rid;
	public String rtitle;
	public double rdetailrate1;
	public double rdetailrate2;
	public double rdetailrate3;
	public double star;
	public String review;
	public String delivery_review;
	public double ratingAvg;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	public Date rdate;
	
	public String rimage1;
	public String rimage2;
	public String rimage3;
	public double helpcount;
	public int pno;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public double getRatingAvg() {
		return ratingAvg;
	}
	public void setRatingAvg(double ratingAvg) {
		this.ratingAvg = ratingAvg;
	}
	
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
	public double getRdetailrate1() {
		return rdetailrate1;
	}
	public void setRdetailrate1(double rdetailrate1) {
		this.rdetailrate1 = rdetailrate1;
	}
	public double getRdetailrate2() {
		return rdetailrate2;
	}
	public void setRdetailrate2(double rdetailrate2) {
		this.rdetailrate2 = rdetailrate2;
	}
	public double getRdetailrate3() {
		return rdetailrate3;
	}
	public void setRdetailrate3(double rdetailrate3) {
		this.rdetailrate3 = rdetailrate3;
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
	public String getDelivery_review() {
		return delivery_review;
	}
	public void setDelivery_review(String delivery_review) {
		this.delivery_review = delivery_review;
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
	public String getRimage3() {
		return rimage3;
	}
	public void setRimage3(String rimage3) {
		this.rimage3 = rimage3;
	}
	public double getHelpcount() {
		return helpcount;
	}
	public void setHelpcount(double helpcount) {
		this.helpcount = helpcount;
	}
}
