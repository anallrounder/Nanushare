package com.share.nanu.service;

import java.util.List;

import com.share.nanu.VO.MemberVO;

public interface AdminPageService {

	List<MemberVO> getMember();

	List<MemberVO> getMemberView(String member_id);

}
