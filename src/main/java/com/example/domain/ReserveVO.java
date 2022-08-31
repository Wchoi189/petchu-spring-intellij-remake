package com.example.domain;

public class ReserveVO extends ServiceVO{
	private int rno;
	private int scno;
	private String id;
	private String checkin;
	private String checkout;
	private String request;
	private String userName;
	private String userTel;
	private String keyword; //�˻���
	private String sort;
	private String reserveDate;
	private int isEdit;
	private int isDel;
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
	
	
	public int getIsEdit() {
		return isEdit;
	}
	public void setIsEdit(int isEdit) {
		this.isEdit = isEdit;
	}
	public int getIsDel() {
		return isDel;
	}
	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
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
	public int getScprice() {
		return scprice;
	}
	public void setScprice(int scprice) {
		this.scprice = scprice;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public String getBgimage() {
		return bgimage;
	}
	public void setBgimage(String bgimage) {
		this.bgimage = bgimage;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
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

	
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}
	@Override
	public String toString() {
		return "ReservVO [rno=" + rno + ", scno=" + scno + ", id=" + id + ", checkin=" + checkin + ", checkout="
				+ checkout + ", reserveDate=" + reserveDate + "]";
	}
	
	
}
