package com.example.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.book.model.Board;
import com.example.book.model.MemberDTO;
import com.example.book.model.PageVO;
import com.example.book.service.BoardService;
import com.example.book.service.MemberService;


@Controller
public class MemberController {

	@Autowired
	private MemberService mservice;
	
	@Autowired
	private BoardService bservice;
	
	//회원가입 폼
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
	//회원가입
	@PostMapping("/join")
	@ResponseBody
	public String join(@RequestBody MemberDTO member) {
		if(mservice.idchk(member.getId())!=null) {
			return "fail";
		}
		mservice.join(member);
		return "success";
	}
	
	//로그인 폼
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	//로그인
	@PostMapping("/loginPro")
	public String loginPro() {
		return "/";
	}
	
	//회원정보보기
	@GetMapping("/view/{id}")
	public String view(@PathVariable String id, Model model, String pageNum) {
		int currentPage = pageNum ==null?1:Integer.parseInt(pageNum);
		int pageSize = 5;
		int pageStart = (currentPage-1)*pageSize;
		MemberDTO member = mservice.view(id);
		int bmnum = member.getMnum();
		int count = bservice.getCount(bmnum);
		PageVO page = new PageVO(count, currentPage, pageSize);
		List<Board>board = bservice.listM(pageStart,pageSize,bmnum);
		
		model.addAttribute("p", page);
		model.addAttribute("count", count);
		model.addAttribute("member", member);
		model.addAttribute("board", board);
		return "member/view";
	}
	
	//회원정보수정 폼
	@GetMapping("/update/{id}")
	public String update(@PathVariable String id, Model model) {
		MemberDTO member = mservice.view(id);
		model.addAttribute("member", member);
		return "member/update";
	}
	
	//회원정보수정
	@PutMapping("/update")
	@ResponseBody
	public String update(@RequestBody MemberDTO member) {
		mservice.update(member);
		return "success";
	}
	
	//회원탈퇴
	@DeleteMapping("/delete/{id}")
	@ResponseBody
	public String delete(@PathVariable String id) {
		mservice.delete(id);
		return "id";
	}
	
//	//회원리스트
//	@GetMapping("/list")
//	public String list(Model model) {
//		model.addAttribute("member", mservice.list());
//		return "/member/list";
//	}
	
	//회원리스트(페이징 추가)
//	@GetMapping("/list")
//	public String list(Model model, String pageNum) {
//		int currentPage = pageNum ==null?1:Integer.parseInt(pageNum);
//		int pageSize = 5;
//		int pageStart = (currentPage-1)*pageSize;
//		int count = mservice.getCount();
//		PageVO page = new PageVO(count, currentPage, pageSize);
//		model.addAttribute("count", count);
//		model.addAttribute("p", page);
//		model.addAttribute("member", mservice.pagelist(pageStart,pageSize));
//		return "member/list";
//	}
	
	//회원리스트(페이지+검색)
	@GetMapping("/list")
	public String list(Model model, @RequestParam(required = false) String field,
			@RequestParam(required = false) String word,
			@RequestParam(required = false) String pageNum) {
		int currentPage = pageNum ==null?1:Integer.parseInt(pageNum);
		int pageSize = 5;
		int pageStart = (currentPage-1)*pageSize;
		
		if(field != null && word != null) {
			int count = mservice.getCountBySearch(field, word);
			PageVO page = new PageVO(count, currentPage, pageSize);
			model.addAttribute("count", count);
			model.addAttribute("p", page);
			model.addAttribute("member", mservice.pagelistBySearch(field, word, pageStart, pageSize));
		} else {
			int count = mservice.getCount();
			PageVO page = new PageVO(count, currentPage, pageSize);
			model.addAttribute("count", count);
			model.addAttribute("p", page);
			model.addAttribute("member", mservice.pagelist(pageStart, pageSize));
		}
		return "member/list";
	}
	
	
}







