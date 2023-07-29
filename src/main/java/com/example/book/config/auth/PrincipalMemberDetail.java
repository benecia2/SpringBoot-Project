package com.example.book.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.book.mapper.MemberMapper;
import com.example.book.model.MemberDTO;

@Service
public class PrincipalMemberDetail implements UserDetailsService{
	
	@Autowired MemberMapper mMapper;

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		MemberDTO member = mMapper.idchk(id);
		if(member==null) return null;
		PrincipalMember pmember = new PrincipalMember(member);
		return pmember;
	}

}
