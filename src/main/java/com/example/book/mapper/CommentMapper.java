package com.example.book.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.book.model.Comment;

@Mapper
public interface CommentMapper {

	//댓글추가
	@Insert("insert into commentboard(cwriter,content,regdate,bnum) values(#{cwriter},#{content},now(),#{bnum})")
	public void insert(Comment comment);
	
	//댓글보기
	@Select("select * from commentboard where bnum=#{bnum}")
	public List<Comment>list(int bnum);
	
	//댓글삭제
	@Delete("delete from commentboard where cnum=#{cnum}")
	public void delete(int cnum);
	
	//댓글수조회(증가용)
	@Select("select count(*) from commentboard where bnum=#{bnum}")
	public int reply(int bnum);
	
	//댓글수조회(감소용-comment객체 부르기)
	@Select("select * from commentboard where cnum=#{cnum}")
    public Comment getCommentByCnum(int cnum);

}
