package com.share.nanu.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.mapper.MyPageMapper;
import com.share.nanu.page.Criteria;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper mgmapper;

	// 화면 뿌리기.
//	public List<MemberVO>
//
//	String email="111@chollian.net";
//
//	int s = email.indexOf("@");
//
//	String email_id = email.substring(0, s);
//
//	String email_domain = email.substring(s + 1);
//
//}

//	@Override
//	public MemberVO loginCheck(String memeber_id, String pw) {
//		// TODO Auto-generated method stub
//		return mgmapper.loginCheck(memeber_id, pw);
//	}
//	
	@Override
	public MemberVO loginCheck(MemberVO vo, HttpSession session) {
		// TODO Auto-generated method stub
		return mgmapper.loginCheck(vo, session);
	}

	// 마이페이지
//	@Override
//	public MemberVO readMember(MemberVO mvo) {
//		// TODO Auto-generated method stub
//		return mgmapper.memberLogin(mvo);
//	}

	// 로그인체크
//	@Override
//	public boolean loginCheck(MemberVO vo, HttpSession session) {
//				
//		boolean result = mgmapper.loginCheck(vo);
//		if(result) {
//			MemberVO vo2 = viewMember(vo);
//			session.setAttribute("member_id",vo2.getMember_id());
//			session.setAttribute("name",vo2.getName());
//		}
//		return result;
//	}

	// 로그인정보
//	@Override
//	public MemberVO viewMember(MemberVO vo) {
//		// TODO Auto-generated method stub
//		return mgmapper.viewMember(vo);
//	}

//	@Override
//	public MemberVO memberLogin(MemberVO membervo) {
//		// TODO Auto-generated method stub
//		return mgmapper.memberLogin(membervo);
//	}

	// 마이페이지-나의문의
	@Override
	public List<MemberVO> myList1() {
		// TODO Auto-generated method stub
		return mgmapper.mygetlist1();
	}
	
	@Override
	public List<MemberVO> myList1(Criteria cri) {
		// TODO Auto-generated method stub
		return mgmapper.getPaging1(cri);
	}
	@Override
	public int getTotalCount1(Criteria cri) {
		// TODO Auto-generated method stub
		return mgmapper.getTotalCnt1(cri);
	}

	// 마이페이지-나의인증
	@Override
	public List<MemberVO> myList2() {
		// TODO Auto-generated method stub
		return mgmapper.mygetlist2();
	}
	
	@Override
	public List<MemberVO> myList2(Criteria cri) {
		// TODO Auto-generated method stub
		return mgmapper.getPaging2(cri);
	}
	@Override
	public int getTotalCount2(Criteria cri) {
		// TODO Auto-generated method stub
		return mgmapper.getTotalCnt2(cri);
	}



	// 마이페이지-나의나눔
	@Override
	public List<IteminvenVO> myList3() {
		// TODO Auto-generated method stub
		return mgmapper.mygetlist3();
	}
//	@Override
//	public List<IteminvenVO> myList3(Criteria cri) {
//		// TODO Auto-generated method stub
//		return mgmapper.getPaging3(cri);
//	}
//	@Override
//	public int getTotalCount3(Criteria cri) {
//		// TODO Auto-generated method stub
//		return mgmapper.getTotalCnt3(cri);
//	}



	// 마이페이지-나의댓글
	@Override
	public List<BoardreplyVO> myList4() {
		// TODO Auto-generated method stub
		return mgmapper.mygetlist4();
	}
//	@Override
//	public List<BoardreplyVO> myList4(Criteria cri) {
//		// TODO Auto-generated method stub
//		return mgmapper.getPaging4(cri);
//	}
//	@Override
//	public int getTotalCount4(Criteria cri) {
//		// TODO Auto-generated method stub
//		return mgmapper.getTotalCnt4(cri);
//	}




	
	
	// 수정하는곳
	@Override
	public MemberVO membermodifyGET(String name) {
		return mgmapper.memberModifyGET(name);
	}

	// 수정후
	@Override
	public MemberVO memberModifyPOST(MemberVO memberVO) {

		// 비밀번호 인코딩
		// BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		// 비밀번호 암호화해서 저장
		// String securePw = encoder.encode(memberVO.getPw());
		// memberVO.setPw(securePw);

		return mgmapper.memberModifyPOST(memberVO);

	}

	// 회원탈퇴페이지
	@Override
	public MemberVO memberDelete(MemberVO membervo) {

		return mgmapper.memberDelete(membervo);
	}

}
