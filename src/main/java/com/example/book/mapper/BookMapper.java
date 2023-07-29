package com.example.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.book.model.Book;
import com.example.book.model.RentList;

@Mapper
public interface BookMapper {
	//추가(파일업로드)
	@Insert("insert into book(bname,writer,publicsher,bimg,content,brentinfo,id) values(#{bname},#{writer},#{publicsher},#{bimg},#{content},'대여가능',#{id})")
	public void fileInsert(Book book);
	
	//책 목록 전체보기
	@Select("select b.bnum,\r\n"
			+ "       b.bname,\r\n"
			+ "	   b.writer,\r\n"
			+ "	   b.publicsher,\r\n"
			+ "       b.bimg,\r\n"
			+ "       b.content,\r\n"
			+ "       (CASE WHEN (select count(*) from rentlist r where r.bnum = b.bnum) >= 1 THEN '대여불가' ELSE '대여가능' END) AS state\r\n"
			+ "from book b")
	public List<Book>fileList();
	
	//책 목록 전체보기(페이징)
	@Select("select * from book order by bnum asc limit #{pageStart}, #{pageSize}")
	public List<Book>pagelist(int pageStart, int pageSize);
	
	//개수
	@Select("select count(*) from book")
	public int getCount();
	
	//지정한 책 삭제
	@Delete("delete from book where bnum=#{bnum}")
	public void delete(int bnum);
	
	//rent수정시 brentinfo같이 업데이트
	@Update("update book set brentinfo=#{rentinfo} where bnum=#{bnum}")
	public void update(RentList rentlist);
	
	//rent등록시 brentinfo같이 업데이트
	@Update("update book set brentinfo='대여승인중' where bnum=#{bnum}")
	public void update2(RentList rentlist);
	
	
	// 대여이력 조회 (페이징 - 검색)
	@Select("select * from book where ${field} like concat('%', #{word}, '%') order by bnum desc limit #{pageStart}, #{pageSize}")
	public List<Book>pagelistBySearch(@Param("field") String field, @Param("word")String word,
			@Param("pageStart")int pageStart, @Param("pageSize")int pageSize);
	//개수 (검색 결과에 따른 개수)
	@Select("select count(*) from book where ${field} like concat('%', #{word}, '%')")
	public int getCountBySearch(@Param("field") String field, @Param("word") String word);

}
