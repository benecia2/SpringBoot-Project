package com.example.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.book.mapper.MemberMapper;
import com.example.book.model.MemberDTO;

@Service
public class MemberService{

	@Autowired
	private MemberMapper mMapper;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	//아이디중복체크
	public MemberDTO idchk(String id) {
		return mMapper.idchk(id);
	}
	
	//회원가입
	public void join(MemberDTO member) {
		String encPassword = encoder.encode(member.getPw());
		member.setAdmin("ROLE_MEMBER");
		member.setPw(encPassword);
		mMapper.join(member);
	}
	
	//회원정보보기
	public MemberDTO view(String id) {
		return mMapper.view(id);
	}
	
	//회원정보수정
	public void update(MemberDTO member) {
		String encPassword = encoder.encode(member.getPw());
		member.setPw(encPassword);
		mMapper.update(member);
	}
	
	//회원탈퇴
	public void delete(String id) {
		mMapper.delete(id);
	}
	
	//회원리스트
	public List<MemberDTO>list() {
		return mMapper.list();
	}
	
	//회원수
	public int getCount() {
		return mMapper.count();
	}	
	
	//전체보기(페이지)
	public List<MemberDTO>pagelist(int pageStart, int pageSize) {
		return mMapper.pagelist(pageStart, pageSize);
	}
	
	//전체보기(페이지+검색)
	public List<MemberDTO>pagelistBySearch(String field, String word, int pageStart, int pageSize) {
		return mMapper.pagelistBySearch(field, word, pageStart, pageSize);
	}
	
	//회원수(검색)
	public int getCountBySearch(String field, String word) {
		return mMapper.getCountBySearch(field, word);
	}
	
	//rentlist용
	public String rentlistID(String id) {
		return mMapper.rentlistID(id);
	}
}









