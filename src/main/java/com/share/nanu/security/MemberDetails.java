package com.share.nanu.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.share.nanu.VO.AuthVO;
import com.share.nanu.VO.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MemberDetails implements UserDetails, OAuth2User {
	//시큐리티 세션에는 authentication만 들어갈 수 있다. authentication에는 userDetails와 oauth2가 들어갈 수 있다.
	//일반 로그인을 하면 userDetails가 시큐리티 내부 authentication에 들어가고
	//oauth2 로그인을 하면 oauth2가 authentication에 들어간다. 
	//이를 하나로 묶어서 authentication에 넣어 처리

	private MemberVO mvo;
	private Map<String, Object> attributes;

	public MemberDetails(MemberVO mvo, Map<String, Object> attributes) { //oauth2 사용시 사용
		log.info("OAuth2 사용");
		this.mvo = mvo;
		this.attributes = attributes;
	}

	public MemberDetails(MemberVO mvo) { //일반 시큐리티 사용시 사용
		log.info("일반 시큐리티 사용");
		this.mvo = mvo;
	}

	// 유저 권한 목록, 해당 유저의 권한 리턴
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (AuthVO auth : mvo.getAuthList()) {
			authorities.add(new SimpleGrantedAuthority(auth.getAuthrole()));

		}

		return authorities;
	}

	@Override
	public String getPassword() { // 패스워드 리턴

		return mvo.getPw();
	}

	@Override
	public String getUsername() {// 아이디 리턴

		return mvo.getMember_id();
	}

	@Override
	public boolean isAccountNonExpired() { // 계정만료?

		return true;
	}

	@Override
	public boolean isAccountNonLocked() { // 계정이 잠겨있나 ?

		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {// 계정의 비밀번호가 1년이 지났나?

		return true;
	}

	@Override
	public boolean isEnabled() {// 계정이 활성화 되었나?
		// 휴면 계정 사용시 필요
		// 현재 시간 - 로긴시간 -> 1년초과시 return false 설정
		return true;
	}

	// oauth2User
	@Override
	public Map<String, Object> getAttributes() { //리소스 서버로부터 가져오는 회원정보

		return attributes;
	}

	@Override
	public String getName() {

		return null;
	}

}
