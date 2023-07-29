package com.example.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.book.model.Board;
import com.example.book.model.Comment;
import com.example.book.service.CommentService;

@Controller
@RequestMapping("/reply/*")
public class CommentController {
	
	@Autowired
	private CommentService cservice;
	
	//댓글추가
	@PostMapping("/insert")
	@ResponseBody
	public String insert(@RequestBody Comment comment) {
		cservice.insert(comment);
		return "success";
	}
	
	//댓글리스트
	@GetMapping("/list/{num}")
	@ResponseBody
	public List<Comment>list(@PathVariable int num) {
		List<Comment>clist = cservice.list(num);
		return clist;
	}
	
	//댓글삭제
	@DeleteMapping("/delete/{cnum}")
	@ResponseBody
	public int delete(@PathVariable int cnum) {
		cservice.delete(cnum);
		return cnum;
	}
	
}




