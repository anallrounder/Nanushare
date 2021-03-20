package com.share.nanu.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.share.nanu.VO.AuthVO;
import com.share.nanu.VO.MemberVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Member extends User{

	
	private MemberVO mvo;
	
	//부모 생성자 호출
	public Member(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		
		super(username, password, authorities);
		
	}
	
	public Member(MemberVO mvo) {
		super(mvo.getMember_id(), mvo.getPw(), getAuth(mvo));
		this.mvo = mvo;
	}
	
	//유저 권한 목록
	private static Collection<? extends GrantedAuthority> getAuth(MemberVO mvo) {
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (AuthVO auth : mvo.getAuthList()) {
			authorities.add(new SimpleGrantedAuthority(auth.getAuthrole()));
		}

		return authorities;
	}

}
