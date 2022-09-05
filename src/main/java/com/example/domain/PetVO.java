package com.example.domain;

public class PetVO extends UserVO{
	private int pno;
	private String pname;
	private String pimage;
	private String pcate; //대분류 | 고양이: 1, 강아지 : 2, etc :3
	private String pcate_1;
	private int pweight;
	private String pgender; // 남 / 여 / 모름
	private String pspaying; //중성화여부 | 함 / 안함 / 모름
	private int page; //나이
	private String pbreed; //품종
	private String id; //사용자 아이디
	
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
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public String getPcate() {
		return pcate;
	}
	public void setPcate(String pcate) {
		this.pcate = pcate;
	}
	public String getPcate_1() {
		return pcate_1;
	}
	public void setPcate_1(String pcate_1) {
		this.pcate_1 = pcate_1;
	}
	public int getPweight() {
		return pweight;
	}
	public void setPweight(int pweight) {
		this.pweight = pweight;
	}
	public String getPgender() {
		return pgender;
	}
	public void setPgender(String pgender) {
		this.pgender = pgender;
	}
	public String getPspaying() {
		return pspaying;
	}
	public void setPspaying(String pspaying) {
		this.pspaying = pspaying;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getPbreed() {
		return pbreed;
	}
	public void setPbreed(String pbreed) {
		this.pbreed = pbreed;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "PetVO [pno=" + pno + ", pname=" + pname + ", pimage=" + pimage + ", pcate=" + pcate + ", pcate_1="
				+ pcate_1 + ", pweight=" + pweight + ", pgender=" + pgender + ", pspaying=" + pspaying + ", page="
				+ page + ", pbreed=" + pbreed + ", id=" + id + "]";
	}
	
	
}
