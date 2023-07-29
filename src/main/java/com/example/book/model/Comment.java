package com.example.book.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Comment {
	
	private int cnum;
	private String cwriter;
	private String content;
	private Date regdate;
	private int bnum;
}
