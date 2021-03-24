package com.share.nanu.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.MemberVO;

@Mapper
public interface NanuMapper {

	MemberVO getMember(String username); // 유저정보 가져오기

	public void memberJoin(MemberVO mvo); // 회원가입시 가입정보 저장

	public void insertAuth(MemberVO mvo); // 회원 권한 저장

}
