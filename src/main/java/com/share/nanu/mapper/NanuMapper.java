package com.share.nanu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.MemberVO;

@Mapper
public interface NanuMapper {

	public List<MemberVO> getlist(MemberVO mvo);
	
	MemberVO getMember(String username); // 유저정보 가져오기

	public void memberJoin(MemberVO mvo);

}
