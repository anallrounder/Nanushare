package com.share.nanu.service;

import java.sql.Date;
import java.util.List;

import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.PointVO;
import com.share.nanu.mypaging.Criteria;
import com.share.nanu.security.MemberDetails;

public interface MyPageService {

	// 1.마이페이지-나의문의
	public List<BoardVO> ask(Criteria cri, String member_id);

	public int getTotalCount1(Criteria cri, String member_id);

	// 2.마이페이지-나의인증
	public List<BoardVO> content(Criteria cri, String member_id);

	public int getTotalCount2(Criteria cri, String member_id);

	// 3.마이페이지-나의나눔
	public List<IteminvenVO> give(Criteria cri, String member_id);

	public int getTotalCount3(Criteria cri, String member_id);

	// 4.마이페이지-나의댓글
	public List<BoardreplyVO> reply(Criteria cri, String rid);

	public int getTotalCount4(Criteria cri, String rid);

	// 5.마이페이지-나의결제
	public List<BoardreplyVO> pay(Criteria cri, String member_id);

	public int getTotalCount5(Criteria cri, String member_id);

	// 6.마이페이지-나의포인트
	public List<PointVO> point(Criteria cri, String username);

	public int getTotalCount6(Criteria cri, String member_id);

	// 회원수정
	public void memberModifyPOST(MemberVO mvo);

	// 회원탈퇴페이지
	public void memberDelete(MemberVO mvo, MemberDetails md);

}
