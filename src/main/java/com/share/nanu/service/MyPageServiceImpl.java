package com.share.nanu.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.mapper.MyPageMapper;
import com.share.nanu.mapper.NanuMapper;
import com.share.nanu.mypaging.Criteria;
import com.share.nanu.security.MemberDetails;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper mgmapper;

	@Autowired
	private NanuMapper nmapper;

	@Autowired
	BCryptPasswordEncoder encoder;

	// 마이페이지-나의문의
	@Override
	public List<BoardVO> myList1(Criteria cri,String member_id) {
		//member.setMember_id(mvo.getMember_id());
		return mgmapper.mygetlist1(cri,member_id);
	}

//	@Override
//	public List<BoardVO> myList1(Criteria cri,String member_id) {
//		return mgmapper.getPaging1(cri,member_id);
//	}

	@Override
	public int getTotalCount1(Criteria cri,String member_id) {
		return mgmapper.getTotalCnt1(cri,member_id);
	}
	
	// 마이페이지-나의인증
	@Override
	public List<BoardVO> myList2(Criteria cri,String member_id) {
		// TODO Auto-generated method stub
		return mgmapper.mygetlist2(cri,member_id);
	}

	
	/*
	 * public List<BoardVO> myList2(MemberDetails md) {
	 * System.out.println("3.인증내역 넘어감???"); MemberVO member =
	 * nmapper.getMember(md.getUsername()); if (md.getUsername() != null) {
	 * member.setMember_id(md.getUsername()); System.out.println("4.인증내역 넘어감???" +
	 * md.getUsername()); System.out.println("4.인증내역 넘어감???"); } return
	 * mgmapper.mygetlist2(md); }
	 */
//	@Override
//	public List<BoardVO> myList2(Criteria cri) {
//		return mgmapper.getPaging2(cri);
//	}

	@Override
	public int getTotalCount2(Criteria cri,String member_id) {
		return mgmapper.getTotalCnt2(cri,member_id);
	}

	// 마이페이지-나의나눔
//	@Override
//	public List<IteminvenVO> myList3() {
//		return mgmapper.mygetlist3();
//	}

	@Override
	public List<IteminvenVO> myList3(Criteria cri,String member_id) {
		return mgmapper.mygetlist3(cri,member_id);
	}

	@Override
	public int getTotalCount3(Criteria cri,String member_id) {
		return mgmapper.getTotalCnt3(cri,member_id);
	}

	// 마이페이지-나의댓글
//	@Override
//	public List<BoardreplyVO> myList4() {
//
//		return mgmapper.mygetlist4();
//	}

	@Override
	public List<BoardreplyVO> myList4(Criteria cri,String member_id) {

		return mgmapper.mygetlist4(cri,member_id);
	}

	@Override
	public int getTotalCount4(Criteria cri,String rid) {

		return mgmapper.getTotalCnt4(cri,rid);
	}
	
	// 마이페이지-나의결제
//		@Override
//		public List<BoardreplyVO> myList5() {
//
//			return mgmapper.mygetlist4();
//		}

		@Override
		public List<BoardreplyVO> myList5(Criteria cri,String member_id) {

			return mgmapper.mygetlist5(cri,member_id);
		}

		@Override
		public int getTotalCount5(Criteria cri,String member_id) {

			return mgmapper.getTotalCnt5(cri,member_id);
		}

		
		
	//회원수정
	@Override
	public void memberModifyPOST(MemberVO mvo) {

		MemberVO member = nmapper.getMember(mvo.getMember_id());
		if (mvo.getMember_id() != null) {
			member.setMember_id(mvo.getMember_id());
		}
		
		if (mvo.getName() != null) {
			member.setName(mvo.getName());
		}
		if (mvo.getSubemail() != null) {
			member.setSubemail(mvo.getSubemail());
		}
		if (mvo.getPw() != null) {
			member.setPw(encoder.encode(mvo.getPw()));
		}

		mgmapper.memberModify(member);
	}
	

	// 회원탈퇴페이지
//	@Override
//	public MemberVO memberDelete(MemberVO mvo) {
//		MemberVO member = nmapper.getMember(mvo.getMember_id());
//		if (mvo.getName() == member.setName() ) {
//			member.setName(mvo.getName());
//		}
//		if (mvo.getMember_id() != null) {
//			member.setMember_id(mvo.getMember_id());
//		}
//		if (mvo.getPw() != null) {
//			member.setPw(bCryptPasswordEncoder.encode(mvo.getPw()));
//		}
//		return mgmapper.memberDelete(mvo);
//	}


	@Override
	public void memberDelete(MemberVO mvo, @AuthenticationPrincipal MemberDetails md) {
		
		System.out.println(mvo.getMember_id());
		System.out.println(md.getUsername());
		if(mvo.getMember_id().equals(md.getUsername()) && mvo.getName().equals(md.getmember().getName())
		){			
			//mgmapper.authdel(mvo);
			mgmapper.memberDelete(mvo);	
			
		}
		
	}

	


	
}
