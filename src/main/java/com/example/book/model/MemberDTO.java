package com.example.book.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MemberDTO {
	
	private int mnum;
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String email;
	private String address;
	private String tel;
	private String admin;
}
