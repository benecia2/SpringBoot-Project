package com.example.book.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


import com.example.book.model.Board;

@Mapper
public interface BoardMapper {
	//게시판 글쓰기
	@Insert("insert into board(title,content,bwriter,bmnum,regdate,admin) values(#{title},#{content},#{bwriter},#{bmnum},now(),#{admin})")
	public void insert(Board board);
	
	//게시판 전체보기
	@Select("select * from board")
	public List<Board>list();
	
	//내 게시글 전체보기(Member연동)
	@Select("select * from board where bmnum=#{bmnum} order by admin, num desc limit #{pageStart}, #{pageSize}")
	public List<Board>lists(int pageStart, int pageSize, int bmnum);
	
	//전체보기(페이지)
	@Select("select * from board order by admin, num desc limit #{pageStart}, #{pageSize}")
	public List<Board>pagelist(int pageStart, int pageSize);	

	//전체보기(페이지+검색)
	@Select("select * from board where ${field} like concat('%', #{word}, '%') order by admin, num desc limit #{pageStart}, #{pageSize}")
	public List<Board>pagelistBySearch(@Param("field") String field, @Param("word") String word,
			@Param("pageStart") int pageStart, @Param("pageSize") int pageSize);
	
	//개수(검색)
	@Select("select count(*) from board where ${field} like concat('%', #{word}, '%')")
	public int getCountBySearch(@Param("field") String field, @Param("word") String word);
	
	//개수
	@Select("select count(*) from board")
	public int count();
	
	//개수(member별)
	@Select("select count(*) from board where bmnum=#{bmnum}")
	public int getCount(int bmnum);
	
	//게시글 상세보기
	@Select("select * from board where num=#{num}")
	public Board view(int num);
	
	//수정
	@Update("update board set title=#{title}, content=#{content}, regdate=now() where num=#{num}")
	public void update(Board board);
	
	//삭제
	@Delete("delete from board where num=#{num}")
	public int delete(int num);
	
	//댓글수데이터조회
	@Select("select * from board where num=#{num}")
	public Board reply2(int num);
	
	//댓글수
	@Update("update board set replycnt=#{replycnt} where num=#{num}")
	public void reply3(int replycnt, int num);
	
	
	
	
}






