package com.example.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
@Getter
@Setter
@ToString
public class OrderlistVO extends shopproductVO {
	private int bno; //orderlist의 번호
	private String uid; //유저아이디
	private int pno; //상품번호 이게 안됨
	private int amount;//총 갯수
	private int final_price;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date odate;
	private String pname;
	private String pimage;
	private double star;

}
