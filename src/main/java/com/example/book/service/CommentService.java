package com.example.book.service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.book.mapper.BoardMapper;
import com.example.book.mapper.CommentMapper;
import com.example.book.model.Board;
import com.example.book.model.Comment;

@Service
public class CommentService {
	
	@Autowired
	private CommentMapper cmapper;
	
	@Autowired
	private BoardMapper bmapper;
	
	//댓글추가
	public void insert(Comment comment) {
		int bnum = comment.getBnum();
		cmapper.insert(comment);
		int replycnt = cmapper.reply(bnum);
		Board b = bmapper.reply2(bnum);
		b.setReplycnt(replycnt);
		bmapper.reply3(replycnt, bnum);
	}
	
	//댓글리스트
	public List<Comment>list(int bnum) {
		return cmapper.list(bnum);
	}
	
	//댓글삭제
	public void delete(int cnum) {
		Comment comment = cmapper.getCommentByCnum(cnum);
		int bnum = comment.getBnum();
		cmapper.delete(cnum);
		int replycnt = cmapper.reply(bnum);
		Board b = bmapper.reply2(bnum);
		b.setReplycnt(replycnt);
		bmapper.reply3(replycnt, bnum);
	}
		
	
}
