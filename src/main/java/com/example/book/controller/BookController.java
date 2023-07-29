package com.example.book.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.book.model.Book;
import com.example.book.model.PageDTO;
import com.example.book.model.RentList;
import com.example.book.service.BookService;
import com.example.book.service.RentListService;

@Controller
@RequestMapping("/book/*")
public class BookController {

	@Autowired
	private BookService bookService;
	
	@Autowired
	private RentListService rservice;
	
	//추가폼
	@GetMapping("bookInsert")
	public String insert() {
		return  "book/bookInsert";
	}
	
	//추가하기(파일업로드)
	@PostMapping("bookInsert")
	public String insert(Book book, HttpSession session) {
		String uploadFolder = session.getServletContext().getRealPath("/")+"\\resources\\img";
		bookService.insert(book, uploadFolder);
		return "redirect:bookList";
	}

	/*
	//책 목록 전체보기
	@GetMapping("bookList")
	public String list(Model model) {
		model.addAttribute("booklist",bookService.fileList());
		return "/book/bookList";
	}
	*/
	
/*	
	//책 목록 전체보기(페이징) (검색 안하고 원상복구 하면 이거!!)
	@GetMapping("bookList")
	public String list(Model model, String pageNum) {
		int currentPage = pageNum == null?1:Integer.parseInt(pageNum);
		int pageSize = 3;
		int pageStart = (currentPage-1)*pageSize;
		int count =  bookService.getCount();   
		PageDTO page = new PageDTO(count, pageSize, currentPage);
		model.addAttribute("count", count);
		model.addAttribute("p", page);
		model.addAttribute("booklist", bookService.pagelist(pageStart, pageSize));
		return "book/bookList";
	}
	*/
	
	
	
	//대여이력 조회 (페이징-검색)
	@GetMapping("bookList")
	public String list(Model model, @RequestParam(required = false) String field,
		@RequestParam(required = false) String word,
		@RequestParam(required = false) String pageNum) {
		int currentPage = pageNum == null ? 1 : Integer.parseInt(pageNum);
		int pageSize = 6;
		int pageStart = (currentPage -1) * pageSize;
		
		if(field != null && word != null) {
			int count = bookService.getCountBySearch(field, word);
			PageDTO page = new PageDTO(count, pageSize, currentPage);
			model.addAttribute("count",count);
			model.addAttribute("p",page);
			model.addAttribute("booklist", bookService.pagelistBySearch(field, word, pageStart, pageSize));
		}else {
			int count = bookService.getCount();
			PageDTO page = new PageDTO(count, pageSize, currentPage);
			model.addAttribute("count",count);
			model.addAttribute("p",page);
			model.addAttribute("booklist", bookService.pagelist(pageStart, pageSize));
		}
		return "book/bookList";
	}
	
	//지정한 책 삭제
	@DeleteMapping("bookDelete/{bnum}")
	@ResponseBody
	public int delete(@PathVariable int bnum) {
		bookService.delete(bnum);
		return bnum;
	}
	
	
	
}
