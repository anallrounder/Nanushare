package com.share.nanu.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.VO.ItemdonationVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.page.Criteria;

public interface MyPageService {

	// 마이페이지-나의문의
	public List<MemberVO> myList1();
	public List<MemberVO> myList1(Criteria cri);
	public int getTotalCount1(Criteria cri);

	// 마이페이지-나의인증
	public List<MemberVO> myList2();
	public List<MemberVO> myList2(Criteria cri);
	public int getTotalCount2(Criteria cri);

	// 마이페이지-나의나눔
	public List<IteminvenVO> myList3();
	public List<IteminvenVO> myList3(Criteria cri);
	public int getTotalCount3(Criteria cri);

	// 마이페이지-나의댓글
	public List<BoardreplyVO> myList4();
	public List<BoardreplyVO> myList4(Criteria cri);
	public int getTotalCount4(Criteria cri);

	// 회원수정
	public void memberModifyPOST(MemberVO mvo);

	// 회원탈퇴페이지
	public MemberVO memberDelete(MemberVO membervo);	
}
