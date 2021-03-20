package com.share.nanu.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.mapper.NanuMapper;

import lombok.Setter;

@Service
public class MemberDetailsService implements UserDetailsService {

	@Setter(onMethod_ = @Autowired)
	private NanuMapper nmapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO mvo = nmapper.getMember(username);

		return mvo == null ? null : new Member(mvo);
	}

}
