package com.example.book.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.example.book.mapper.BoardMapper;
import com.example.book.model.Board;

@Service
public class BoardService {

		@Autowired
		private BoardMapper bmapper;
		
		//게시판 글쓰기
		public void insert(Board board) {
			bmapper.insert(board);
		}
		
		//게시판 전체보기
		public List<Board>list() {
			return bmapper.list();
		}
		
		//전체보기(페이지)
		public List<Board>pagelist(int pageStart, int pageSize) {
			return bmapper.pagelist(pageStart, pageSize);
		}
	
		//내 게시글 전체보기(member)와 연동
		public List<Board>listM(int pageStart, int pageSize, int bmnum) {
			return bmapper.lists(pageStart, pageSize, bmnum);
		}
		
		//전체보기(페이징+검색)
		public List<Board>pagelistBySearch(String field, String word, int pageStart, int pageSize) {
			return bmapper.pagelistBySearch(field, word, pageStart, pageSize);
		}
		
		//개수(검색)
		public int getCountBySearch(String field, String word) {
			return bmapper.getCountBySearch(field, word);
		}
		
		//게시글 개수
		public int getCount() {
			return bmapper.count();
		}		
		
		
		//게시글 개수
		public int getCount(int bmnum) {
			return bmapper.getCount(bmnum);
		}
		
		//게시글 상세보기
		public Board view(int num) {
			return bmapper.view(num);
		}
		
		//게시글 수정
		public void update(Board board) {
			bmapper.update(board);
		}
		
		//게시글 삭제
		public void delete(int num) {
			bmapper.delete(num);
		}
		

}
