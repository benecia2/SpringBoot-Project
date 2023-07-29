package com.example.book.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.book.mapper.BookMapper;
import com.example.book.mapper.RentListMapper;
import com.example.book.model.RentList;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class RentListService {

	private final RentListMapper rentListMapper;
	
	
	//추가
	public void insert(RentList rentlist) {
		rentListMapper.insert(rentlist);
	}
	
	//대여이력조회(전체보기)
	public List<RentList>list(){
		return rentListMapper.list();
	}
	
	//대여이력조회(전체보기 --페이징)
	public List<RentList>pagelist(int pageStart, int pageSize){
		return rentListMapper.pagelist(pageStart, pageSize);
	}
	
	
	//개수
	public int getCount() {
		return rentListMapper.getCount();
	}
	
	//상세페이지 (반납, 수정을 할 수 있는)
	public RentList view(int rnum) {
		return rentListMapper.view(rnum);
	}
	
	//수정
	public void update(RentList rentlist) {
		rentListMapper.update(rentlist);
	}
	
	//삭제
	public void delete(int rnum) {
		rentListMapper.delete(rnum);
	}
	
	
	
	
	// 대여이력 조회 (페이징 - 검색)
	public List<RentList> pagelistBySearch(String field, String word, int pageStart, int pageSize) {
	    return rentListMapper.pagelistBySearch(field, word, pageStart, pageSize);
	}

	// 개수 (검색 결과에 따른 개수)
	public int getCountBySearch(String field, String word) {
	    return rentListMapper.getCountBySearch(field, word);
	}
	
	// 대여이력 조회(개인, 페이징+검색)
	public List<RentList> pagelistBySearch2(String field, String word, int pageStart, int pageSize, String bwho) {
	    return rentListMapper.pagelistBySearch2(field, word, pageStart, pageSize, bwho);
	}	
	
	//대여이력조회(개인, 페이징)
	public List<RentList>pagelist2(int pageStart, int pageSize, String bwho){
		return rentListMapper.pagelist2(pageStart, pageSize, bwho);
	}
	
	//개수(개인)
	public int getCount2(String bwho) {
		return rentListMapper.getCount2(bwho);
	}
	
	// 개수 (개인, 검색 결과에 따른 개수)
	public int getCountBySearch2(String field, String word, String bwho) {
	    return rentListMapper.getCountBySearch2(field, word, bwho);
	}
	
	//
	public String rentinfo(int bnum) {
		return rentListMapper.rentinfo(bnum);
	}
}
