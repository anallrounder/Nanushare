package com.share.nanu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.MemberVO;

@Mapper
public interface AdminMapper {

	List<MemberVO> member();

	List<MemberVO> member_view(String member_id);

}
