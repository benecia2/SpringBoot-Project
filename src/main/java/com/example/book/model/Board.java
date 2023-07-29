package com.example.book.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Board {

	private int num;
	private String title;
	private String content;
	private String bwriter;
	private int bmnum;
	private Date regdate;
	private int replycnt;
	private String admin;
}
