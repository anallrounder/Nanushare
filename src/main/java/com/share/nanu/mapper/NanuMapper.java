package com.share.nanu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.MemberVO;

@Mapper
public interface NanuMapper {

	public List<MemberVO> getlist(MemberVO mvo);

}
