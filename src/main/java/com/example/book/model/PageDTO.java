package com.example.book.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PageDTO {
	private int totPage;
	private int blockPage;
	private int startPage;
	private int endPage;
	private int currentPage;
	
	public PageDTO(int count, int pageSize, int currentPage) {
		totPage =count/pageSize+(count%pageSize==0?0:1);	//27 한화면 5  ==> 총 페이지 수 8
		blockPage = 3; //[이전] 456[다음]		[이전] 789 [다음]
		startPage =((currentPage-1)/blockPage)*blockPage+1;
		endPage =startPage+blockPage-1;	//계산상 마지막 페이지
		if(endPage > totPage)	endPage = totPage;	// totPage가 실제 마지막 페이지
		
		
		setCurrentPage(currentPage);
		setEndPage(endPage);
		setBlockPage(blockPage);
		setTotPage(totPage);
		
		
	}
}
