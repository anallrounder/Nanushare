package com.share.nanu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.mapper.NanuMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class NanuServiceImpl implements NanuService {
	
	private NanuMapper nmapper;



	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		
		return nmapper.getlist(mvo);
	}

}
