package com.example.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.book.model.RentList;

@Mapper
public interface RentListMapper {
	
//추가
@Insert("insert into rentlist(bname, bwho, bdate, rdate ,bnum, rentinfo) values(#{bname},#{bwho},#{bdate},#{rdate},#{bnum},'대여승인중')")
public void insert(RentList rentlist);

//대여이력(전체보기)
@Select("select * from rentlist")
public List<RentList>list();

//대여이력(페이징)
@Select("select * from rentlist where rentinfo LIKE '대여승인%' order by rnum desc limit #{pageStart}, #{pageSize}")
public List<RentList>pagelist(int pageStart, int pageSize);

//개수
@Select("select count(*) from rentlist where rentinfo LIKE '대여승인%'")
public int getCount();

//상세페이지 (반납, 수정을 할 수 있는)
@Select("select * from rentlist where rnum=#{rnum}")
public RentList view(int rnum);

//수정
@Update("update rentlist set bname=#{bname},bwho=#{bwho},bdate=#{bdate},rdate=#{rdate},rentinfo=#{rentinfo} where rnum=#{rnum} ")
public void update(RentList rentlist);

//삭제
@Delete("delete from rentlist where rnum=#{rnum}")
public void delete(int rnum);



// 대여이력 조회 (페이징 - 검색)
@Select("SELECT * FROM rentlist WHERE ${field} LIKE CONCAT('%', #{word}, '%') and rentinfo LIKE '대여승인%' ORDER BY rnum DESC LIMIT #{pageStart}, #{pageSize}")
public List<RentList> pagelistBySearch(@Param("field") String field, @Param("word") String word,
		@Param("pageStart") int pageStart, @Param("pageSize") int pageSize);

//개수 (검색 결과에 따른 개수)
@Select("SELECT COUNT(*) FROM rentlist WHERE ${field} LIKE CONCAT('%', #{word}, '%') and rentinfo LIKE '대여승인%'")
public int getCountBySearch(@Param("field") String field, @Param("word") String word);


//대여이력(개인, 페이지+검색)
@Select("SELECT * FROM rentlist WHERE ${field} LIKE CONCAT('%', #{word}, '%') and bwho=#{bwho} ORDER BY rnum DESC LIMIT #{pageStart}, #{pageSize}")
public List<RentList> pagelistBySearch2(@Param("field") String field, @Param("word") String word,
		@Param("pageStart") int pageStart, @Param("pageSize") int pageSize, String bwho);

//대여이력(개인, 페이징)
@Select("select * from rentlist where bwho=#{bwho} order by rnum desc limit #{pageStart}, #{pageSize}")
public List<RentList>pagelist2(int pageStart, int pageSize, String bwho);

//개수(개인)
@Select("select count(*) from rentlist where bwho=#{bwho}")
public int getCount2(String bwho);

//개수 (개인, 검색 결과에 따른 개수)
@Select("SELECT COUNT(*) FROM rentlist WHERE ${field} LIKE CONCAT('%', #{word}, '%') and bwho=#{bwho}")
public int getCountBySearch2(@Param("field") String field, @Param("word") String word, String bwho);

//
@Select("select rentinfo from rentlist where bnum=#{bnum}")
public String rentinfo(int bnum);


}