package com.example.book.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.book.model.Board;
import com.example.book.model.PageVO;
import com.example.book.service.BoardService;

@RequestMapping("/board/*")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService bservice;
	
	//게시판 글쓰기 폼
	@GetMapping("/insert")
	public String insert() {
		return "/board/insert";
	}
	
	//게시판 글쓰기
	@PostMapping("/insert")
	public String insert(Board board) {
		bservice.insert(board);
		return "redirect:list";
	}
	
	//게시글 전체보기
//	@GetMapping("/list")
//	public String list(Model model) {
//		int count = bservice.getCount();
//		model.addAttribute("count", count);
//		model.addAttribute("board", bservice.list());
//		return "board/list";
//	}
	
	//게시글 전체보기(페이징 추가)
//	@GetMapping("/list")
//	public String list(Model model, String pageNum) {
//		int currentPage = pageNum ==null?1:Integer.parseInt(pageNum);
//		int pageSize = 5;
//		int pageStart = (currentPage-1)*pageSize;
//		int count = bservice.getCount();
//		PageVO page = new PageVO(count, currentPage, pageSize);
//		model.addAttribute("count", count);
//		model.addAttribute("p", page);
//		model.addAttribute("board", bservice.pagelist(pageStart,pageSize));
//		return "board/list";
//	}
	
	//게시글 전체보기(페이지 + 검색)
	@GetMapping("/list")
	public String list(Model model, @RequestParam(required=false) String field,
			@RequestParam(required=false) String word,
			@RequestParam(required=false) String pageNum) {
		int currentPage = pageNum ==null?1:Integer.parseInt(pageNum);
		int pageSize = 5;
		int pageStart = (currentPage-1)*pageSize;
		
		if(field != null && word !=null) {
			int count = bservice.getCountBySearch(field, word);
			PageVO page = new PageVO(count, currentPage, pageSize);
			model.addAttribute("count", count);
			model.addAttribute("p", page);
			model.addAttribute("board", bservice.pagelistBySearch(field, word, pageStart, pageSize));
		} else {
			int count = bservice.getCount();
			PageVO page = new PageVO(count, currentPage, pageSize);
			model.addAttribute("count", count);
			model.addAttribute("p", page);
			model.addAttribute("board", bservice.pagelist(pageStart, pageSize));
		}
		return "board/list";
	}
	
	//게시글 상세보기
	@GetMapping("/view/{num}")
	public String view(@PathVariable int num, Model model) {
		Board board = bservice.view(num);
		model.addAttribute("board",board);
		return "board/view";
	}
	
	//게시글 수정폼
	@GetMapping("/update/{num}")
	public String update(@PathVariable int num, Model model) {
		model.addAttribute("board", bservice.view(num));
		return "board/update";
	}
	
	//게시글 삭제
	@DeleteMapping("/delete/{num}")
	@ResponseBody
	public int delete(@PathVariable int num) {
		bservice.delete(num);
		return num;
	}
	
	//게시글 수정
	@PutMapping("/update")
	@ResponseBody
	public String update(@RequestBody Board board) {
		bservice.update(board);
		return "success";
	}
	

	
}


