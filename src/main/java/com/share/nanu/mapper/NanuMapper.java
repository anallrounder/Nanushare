package com.share.nanu.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.MemberVO;

@Mapper
public interface NanuMapper {

	public MemberVO getMember(String username); // 유저정보 가져오기

	public void memberJoin(MemberVO mvo); // 회원가입시 가입정보 저장

	public void insertAuth(MemberVO mvo); // 회원 권한 저장

	public MemberVO idcheck(String memberId);// 이메일 체크

	public void changePw(MemberVO mvo); //회원정보변경

	public MemberVO findEmail(String mail);

	

	

	

	

	

}
