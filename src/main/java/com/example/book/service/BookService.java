package com.example.book.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.book.mapper.BookMapper;
import com.example.book.model.Book;
import com.example.book.model.RentList;

@Service
public class BookService {

	@Autowired
	private BookMapper bookMapper;
	
	//파일 업로드
	public void insert(Book book, String uploadFolder) {
		UUID uuid = UUID.randomUUID();
		MultipartFile f = book.getUpload();
		String uploadFileName="";
		
		if(!f.isEmpty()) {
			uploadFileName = uuid.toString()+"_"+f.getOriginalFilename();
			File saveFile = new File(uploadFolder,uploadFileName	);
			try {
				f.transferTo(saveFile);
				book.setBimg(uploadFileName);
			}catch(IllegalStateException | IOException e ) {
				e.printStackTrace();
			}
		}
		bookMapper.fileInsert(book);
	}
	
	//책 목록 전체보기
	public List<Book>fileList(){
		return bookMapper.fileList();
	}
	
	//책 목록 전체보기(페이징)
	public List<Book>pagelist(int pageStart, int pageSize){
		return bookMapper.pagelist(pageStart, pageSize);
	}
	
	
	// 개수만
	public int getCount() {
		return bookMapper.getCount();
	}
	
	//지정한 책 삭제
	public void delete(int bnum) {
		bookMapper.delete(bnum);
	}
	

	
	
	//대여이력 조회(페이징 - 검색)
	public List<Book> pagelistBySearch(String field, String word, int pageStart, int pageSize){
		return bookMapper.pagelistBySearch(field, word, pageStart, pageSize);
	}
	
	//개수 (검색 결과에 따른 개수)
	public int getCountBySearch(String field, String word) {
		return bookMapper.getCountBySearch(field, word);
	}
	
	//brentinfo수정
	public void update(RentList rentlist) {
		bookMapper.update(rentlist);
	}

	//대여시 brentinfo 기본값
	public void update2(RentList rentlist) {
		bookMapper.update2(rentlist);
	}
	
}
