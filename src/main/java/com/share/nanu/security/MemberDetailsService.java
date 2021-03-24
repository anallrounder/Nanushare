package com.share.nanu.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.mapper.NanuMapper;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberDetailsService implements UserDetailsService{
	//로그인시 반드시 호출되는 함수
	//시큐리시 설정에서 로그인 요청이 오면 자동으로 userDetailsService 타입으로 ioc되어있는 loadUserByUsername 함수가 실행
	@Setter(onMethod_ = @Autowired)
	private NanuMapper nmapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//로그인 페이지에서 input에서 아이디적는부분의 name="username", loadUserByUsername 파라미터명과 같아야함
		
		log.warn("load user by MemberVO number: " + username);
		MemberVO mvo = nmapper.getMember(username);//membervo 가져오기

		log.warn("quired by MemberVO mapper : " + mvo);
		return mvo == null ? null : new MemberDetails(mvo);
	}

}
