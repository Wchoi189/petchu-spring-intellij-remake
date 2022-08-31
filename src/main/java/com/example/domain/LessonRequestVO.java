package com.example.domain;

import org.springframework.format.annotation.DateTimeFormat;

public class LessonRequestVO extends ServiceCoVO{
	public int lrno;
	public String uid;
	public String nick;
	public String lesson_classification;
	public String lesson_goal;
	public String lesson_method;
	public String age;
	public String gender;
	public String wish_gender;
	public String wish_date;
	public String wish_time;
	public String wish_local1;
	public String wish_local2;
	public String lesson_place;
	public String detailed_matters;
	public int choose_check;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public String ldate;
	
	
	public String getLdate() {
		return ldate;
	}
	public void setLdate(String ldate) {
		this.ldate = ldate;
	}
	public int getChoose_check() {
		return choose_check;
	}
	public void setChoose_check(int choose_check) {
		this.choose_check = choose_check;
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
	public String getLesson_classification() {
		return lesson_classification;
	}
	public void setLesson_classification(String lesson_classification) {
		this.lesson_classification = lesson_classification;
	}
	public String getLesson_goal() {
		return lesson_goal;
	}
	public void setLesson_goal(String lesson_goal) {
		this.lesson_goal = lesson_goal;
	}
	public String getLesson_method() {
		return lesson_method;
	}
	public void setLesson_method(String lesson_method) {
		this.lesson_method = lesson_method;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getWish_gender() {
		return wish_gender;
	}
	public void setWish_gender(String wish_gender) {
		this.wish_gender = wish_gender;
	}
	public String getWish_date() {
		return wish_date;
	}
	public void setWish_date(String wish_date) {
		this.wish_date = wish_date;
	}
	public String getWish_time() {
		return wish_time;
	}
	public void setWish_time(String wish_time) {
		this.wish_time = wish_time;
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
	public String getLesson_place() {
		return lesson_place;
	}
	public void setLesson_place(String lesson_place) {
		this.lesson_place = lesson_place;
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
