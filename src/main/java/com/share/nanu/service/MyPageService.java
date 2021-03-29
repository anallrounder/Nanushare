package com.share.nanu.service;

import java.util.List;

import javax.servlet.http.HttpSession;


import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.VO.ItemdonationVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.page.Criteria;

public interface MyPageService {

	//마이페이지
	//MemberVO memberLogin(MemberVO membervo);
	//MemberVO readMember(MemberVO mvo);
	
	
	public MemberVO loginCheck(MemberVO vo, HttpSession session);
	
	
	//회원로그인체크
	//public boolean loginCheck(MemberVO vo, HttpSession session);
	//회원로그인정보
	//public MemberVO viewMember(MemberVO member);
	
	
	// 마이페이지-나의문의
	List<MemberVO> myList1();
	List<MemberVO> myList1(Criteria cri);
	public int getTotalCount1(Criteria cri);

	// 마이페이지-나의인증
	List<MemberVO> myList2();
	List<MemberVO> myList2(Criteria cri);
	public int getTotalCount2(Criteria cri);

	// 마이페이지-나의나눔
	List<IteminvenVO> myList3();
//	List<IteminvenVO> myList3(Criteria cri);
//	public int getTotalCount3(Criteria cri);

	// 마이페이지-나의댓글
	List<BoardreplyVO> myList4();
//	List<BoardreplyVO> myList4(Criteria cri);
//	public int getTotalCount4(Criteria cri);

	


	//마이페이지-수정페이지
	MemberVO membermodifyGET(String member_id);
	
	//회원수정
	MemberVO memberModifyPOST(MemberVO memberVO);

	
	//회원탈퇴페이지
	MemberVO memberDelete(MemberVO membervo);



	



	
}
