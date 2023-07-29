package com.example.book.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PageVO {

	private int totPage;
	private int blockPage;
	private int startPage;
	private int endPage;
	private int currentPage;
	private String field;
	private String word;
	
	public PageVO(int count, int currentPage, int pageSize) {
		totPage= count/pageSize + (count%pageSize==0?0:1);
		blockPage = 3;
		startPage = ((currentPage-1)/blockPage)*blockPage+1;
		endPage = startPage + blockPage-1; // 계산상 마지막 페이지
		if(endPage>totPage) endPage = totPage; //totPage가 실제 마지막 페이지
		
		setBlockPage(blockPage);
		setStartPage(startPage);
		setEndPage(endPage);
		setCurrentPage(currentPage);
		setTotPage(totPage);
	}
	
	
}
