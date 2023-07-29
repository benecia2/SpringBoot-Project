package com.example.book.model;

import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Book {
	//도서넘버
	private int bnum;
	//도서명
	private String bname;
	//저자
	private String writer;
	//출판사
	private String publicsher;
	//책 이미지
	private String bimg;
	//줄거리
	private String content;
	//대여정보
	private String brentinfo;
	
	private String id;
	@Transient
	//파일 업로드
	private MultipartFile upload;
	
}
