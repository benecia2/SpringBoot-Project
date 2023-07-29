package com.example.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.book.model.MemberDTO;

@Mapper
public interface MemberMapper {

	//회원가입
	@Insert("insert into member(id,pw,name,email,address,tel,admin) values(#{id},#{pw},#{name},#{email},#{address},#{tel},#{admin})")
	public void join(MemberDTO member);

	//아이디중복체크
	@Select("select * from member where id=#{id}")
	public MemberDTO idchk(String id); 
	
	//회원정보보기
	@Select("select * from member where id=#{id}")
	public MemberDTO view(String id);
	
	//회원정보변경
	@Update("update member set pw=#{pw},name=#{name},email=#{email},address=#{address},tel=#{tel} where id=#{id}")
	public void update(MemberDTO member);
	
	//회원탈퇴
	@Delete("delete from member where id=#{id}")
	public void delete(String id);
	
	//회원리스트
	@Select("select * from member")
	public List<MemberDTO> list();
	
	//회원리스트(페이지)
	@Select("select * from member order by mnum desc limit #{pageStart}, #{pageSize}")
	public List<MemberDTO>pagelist(int pageStart, int pageSize);
	
	//회원리스트(페이지+검색)
	@Select("select * from member where ${field} like concat('%', #{word}, '%') order by mnum desc limit #{pageStart}, #{pageSize}")
	public List<MemberDTO>pagelistBySearch(@Param("field") String field, @Param("word") String word,
			@Param("pageStart") int pageStart, @Param("pageSize") int pageSize);
	
	//개수
	@Select("select count(*) from member")
	public int count();
	
	//개수(검색)
	@Select("select count(*) from member where ${field} like concat('%', #{word}, '%')")
	public int getCountBySearch(@Param("field") String field, @Param("word") String word);
	
	//rentlist조회용
	@Select("select name from member where id=#{id}")
	public String rentlistID(String id);
}
