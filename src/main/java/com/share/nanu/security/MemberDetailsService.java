package com.share.nanu.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.mapper.NanuMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberDetailsService implements UserDetailsService {
	//로그인시 반드시 호출되는 함수
	
	@Setter(onMethod_ = @Autowired)
	private NanuMapper nmapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.warn("load user by MemberVO number: " + username);
		MemberVO mvo = nmapper.getMember(username);//membervo 가져오기

		log.warn("quired by MemberVO mapper : " + mvo);
		return mvo == null ? null : new Member(mvo);
	}

}
