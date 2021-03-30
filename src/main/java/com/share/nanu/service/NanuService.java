package com.share.nanu.service;

import com.share.nanu.VO.MemberVO;

public interface NanuService {

	public void memberJoin(MemberVO mvo); // 회원가입

	public boolean idCheck(String memberId); // 아이디 중복 체크

	public void changePw(MemberVO mvo); //비밀번호 변경

	public MemberVO findEmail(String mail); //이메일 찾기

	

	

}
