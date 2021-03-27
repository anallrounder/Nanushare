package com.share.nanu.service;

import org.springframework.stereotype.Service;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.mapper.NanuMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class NanuServiceImpl implements NanuService {

	private NanuMapper nmapper;

	@Override
	public void memberJoin(MemberVO mvo) { // 회원가입
		nmapper.memberJoin(mvo);
	}

	@Override
	public boolean idCheck(String memberId) { // 아이디 중복체크
		boolean idcheck = false;
		if (nmapper.idcheck(memberId) == null) { // 널이라는 의미는 중복된 아이디가 없다는 의미 왜냐하면 디비에 존재하지 않기때문
			idcheck = true;
		} else {
			idcheck = false;
		}
		return idcheck;

	}

}
