package com.example.book.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class RentList {
	//대여번호
	private int rnum;
	//도서명
	private String bname;
	//대여인
	private String bwho;
	//대여날짜
	private String bdate;
	//반납날짜
	private String rdate;
	//도서 넘버:FK (Book bnum을 참조한다)
	private int bnum;
	//대여정보
	private String rentinfo;
}
