package com.share.nanu.service;

import javax.inject.Inject;

import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.mapper.NanuMapper;

import lombok.NoArgsConstructor;

@NoArgsConstructor
@Service
public class MemberService {
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Inject
	private BCryptPasswordEncoder passwordEncoder;

	@Inject
	private NanuMapper nmapper;

	@Transactional(rollbackFor = Exception.class)
	public void addMember(MemberVO mvo) {
		String password = mvo.getPw();
		String encode = passwordEncoder.encode(password);

		mvo.setPw(encode);

		nmapper.memberJoin(mvo);
		nmapper.insertAuth(mvo);

	}

}
