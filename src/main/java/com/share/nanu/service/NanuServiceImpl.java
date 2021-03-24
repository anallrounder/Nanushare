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
	public void memberJoin(MemberVO mvo) {
		nmapper.memberJoin(mvo);
	}

}
