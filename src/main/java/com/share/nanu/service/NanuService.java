package com.share.nanu.service;

import java.util.List;

import com.share.nanu.VO.MemberVO;

public interface NanuService {

	List<MemberVO> memberList(MemberVO mvo);

	public void memberJoin(MemberVO mvo);
}
