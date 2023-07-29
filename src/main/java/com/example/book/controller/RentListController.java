package com.example.book.controller;


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

import com.example.book.model.Book;
import com.example.book.model.PageDTO;
import com.example.book.model.RentList;
import com.example.book.service.BookService;
import com.example.book.service.MemberService;
import com.example.book.service.RentListService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/rentlist/*")
public class RentListController {
	
	private final RentListService rentListService;
	private final BookService bservice;
	private final MemberService mservice;
	
	//추가폼(링크방식)
	@GetMapping("view/{bnum}/{bname}")
	public String insert(@PathVariable int bnum,  @PathVariable String bname  ,Model model) {
		model.addAttribute("bnum",bnum);
		model.addAttribute("bname",bname);
		return "rentlist/rentInsert";
	}
	
	/*
	//추가폼(파라미터방식)
	@GetMapping("view")
	public String insert(@RequestParam int bnum, @RequestParam String bname, Model model) {
		model.addAttribute("bnum",bnum);
		model.addAttribute("bname",bname);
		return "rentlist/rentInsert";
	}
	*/
	
	
	//추가
	@PostMapping("rentInsert")
	public String insert1(RentList rentlist) {
		rentListService.insert(rentlist);
		bservice.update2(rentlist);
		return "redirect:/rentlist/rentlist";
	}
	
/*	
	//전체보기(카운트) 대여이력
	@GetMapping("rentlist")
	public String list(Model model) {
		List<RentList>rentlist = rentListService.list();
		int count = rentListService.getCount();
		model.addAttribute("rentlists",rentlist);
		model.addAttribute("count",count);
		return "rentlist/rentList";
	}
	*/
	
	/*
	//전체보기(카운트) 대여이력 페이징 (검색 안하고 원상복구 하면 이거!!)
	@GetMapping("rentlist")
	public String list(Model model, String pageNum) {
		int currentPage = pageNum == null?1:Integer.parseInt(pageNum);
		int pageSize=4;
		int pageStart = (currentPage-1)*pageSize;
		int count = rentListService.getCount();
		PageDTO page = new PageDTO(count, pageSize, currentPage);
		model.addAttribute("count",count);
		model.addAttribute("p",page);
		model.addAttribute("rentlists",rentListService.pagelist(pageStart, pageSize));
		return "rentlist/rentList";
	}
	*/
	
	//전체보기 대여이력 페이징 검색, 결과에 따른 개수
	@GetMapping("rentlist")
	public String list(Model model, @RequestParam(required = false) String field,
	                   @RequestParam(required = false) String word,
	                   @RequestParam(required = false) String pageNum) {
	    int currentPage = pageNum == null ? 1 : Integer.parseInt(pageNum);
	    int pageSize = 5;
	    int pageStart = (currentPage - 1) * pageSize;
	    
	    if (field != null && word != null) {
	        int count = rentListService.getCountBySearch(field, word);
	        PageDTO page = new PageDTO(count, pageSize, currentPage);
	        model.addAttribute("count", count);
	        model.addAttribute("p", page);
	        model.addAttribute("rentlists", rentListService.pagelistBySearch(field, word, pageStart, pageSize));
	    } else {
	        int count = rentListService.getCount();
	        PageDTO page = new PageDTO(count, pageSize, currentPage);
	        model.addAttribute("count", count);
	        model.addAttribute("p", page);
	        model.addAttribute("rentlists", rentListService.pagelist(pageStart, pageSize));
	    }
	    return "rentlist/rentList";
	}
	
	
	//상세보기
	@GetMapping("find/{rnum}")
	public String view(@PathVariable int rnum, Model model) {
		RentList rent = rentListService.view(rnum);
		model.addAttribute("rent",rent);
		return "rentlist/rentView";
	}
	
	//수정폼
	@GetMapping("rentUpdate/{rnum}")
	public String update(@PathVariable int rnum, Model model) {
		RentList rent = rentListService.view(rnum);
		model.addAttribute("rent",rent);
		return "rentlist/rentUpdate";
	}
	
	//수정
	@PutMapping("rentUpdate")
	@ResponseBody
	public String update(@RequestBody RentList rentlist) {
		rentListService.update(rentlist);
		bservice.update(rentlist);
		return "success";
	}
	
	//삭제
	@DeleteMapping("rentDelete/{rnum}")
	@ResponseBody
	public int delete(@PathVariable int rnum) {
		rentListService.delete(rnum);
		return rnum;
	}
	
	@GetMapping("rentlist2/{id}")
	public String list2(Model model, @RequestParam(required = false) String field,
	                   @RequestParam(required = false) String word,
	                   @RequestParam(required = false) String pageNum, RentList rentlist, @PathVariable String id) {
	    int currentPage = pageNum == null ? 1 : Integer.parseInt(pageNum);
	    int pageSize = 5;
	    int pageStart = (currentPage - 1) * pageSize;
	    
	    if (field != null && word != null) {
	    	String bwho = mservice.rentlistID(id);
	        int count = rentListService.getCountBySearch2(field, word, bwho);
	        PageDTO page = new PageDTO(count, pageSize, currentPage);
	        model.addAttribute("count", count);
	        model.addAttribute("p", page);
	        model.addAttribute("rentlists", rentListService.pagelistBySearch2(field, word, pageStart, pageSize, bwho));
	    } else {
	    	String bwho = mservice.rentlistID(id);
	        int count = rentListService.getCount2(bwho);
	        PageDTO page = new PageDTO(count, pageSize, currentPage);
	        model.addAttribute("count", count);
	        model.addAttribute("p", page);
	        model.addAttribute("rentlists", rentListService.pagelist2(pageStart, pageSize, bwho));
	    }
	    return "rentlist/rentList2";
	}
	
	
	//전체보기 대여이력 페이징 검색, 결과에 따른 개수
		@GetMapping("rentlist3")
		public String list3(Model model, @RequestParam(required = false) String field,
		                   @RequestParam(required = false) String word,
		                   @RequestParam(required = false) String pageNum) {
		    int currentPage = pageNum == null ? 1 : Integer.parseInt(pageNum);
		    int pageSize = 5;
		    int pageStart = (currentPage - 1) * pageSize;
		    
		    if (field != null && word != null) {
		        int count = rentListService.getCountBySearch(field, word);
		        PageDTO page = new PageDTO(count, pageSize, currentPage);
		        model.addAttribute("count", count);
		        model.addAttribute("p", page);
		        model.addAttribute("rentlists", rentListService.pagelistBySearch(field, word, pageStart, pageSize));
		    } else {
		        int count = rentListService.getCount();
		        PageDTO page = new PageDTO(count, pageSize, currentPage);
		        model.addAttribute("count", count);
		        model.addAttribute("p", page);
		        model.addAttribute("rentlists", rentListService.pagelist(pageStart, pageSize));
		    }
		    return "rentlist/rentList3";
		}
	
}
