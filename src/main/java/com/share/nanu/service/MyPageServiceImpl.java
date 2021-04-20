package com.share.nanu.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.PointVO;
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

	// 1.마이페이지-나의문의
		@Override
		public List<BoardVO> myList1(Criteria cri, String member_id) {

			return mgmapper.mygetlist1(cri, member_id);
		}

		@Override
		public int getTotalCount1(Criteria cri, String member_id) {
			return mgmapper.getTotalCnt1(cri, member_id);
		}

		// 2.마이페이지-나의인증
		@Override
		public List<BoardVO> myList2(Criteria cri, String member_id) {
			return mgmapper.mygetlist2(cri, member_id);
		}

		@Override
		public int getTotalCount2(Criteria cri, String member_id) {
			return mgmapper.getTotalCnt2(cri, member_id);
		}

		// 3.마이페이지-나의나눔
		@Override
		public List<IteminvenVO> myList3(Criteria cri, String member_id) {
			return mgmapper.mygetlist3(cri, member_id);
		}

		@Override
		public int getTotalCount3(Criteria cri, String member_id) {
			return mgmapper.getTotalCnt3(cri, member_id);
		}

		//  4.마이페이지-나의댓글
		@Override
		public List<BoardreplyVO> myList4(Criteria cri, String member_id) {

			return mgmapper.mygetlist4(cri, member_id);
		}

		@Override
		public int getTotalCount4(Criteria cri, String rid) {

			return mgmapper.getTotalCnt4(cri, rid);
		}

		// 5.마이페이지 - 결제내역
		@Override
		public List<BoardreplyVO> myList5(Criteria cri, String member_id) {

			return mgmapper.mygetlist5(cri, member_id);
		}

		@Override
		public int getTotalCount5(Criteria cri, String member_id) {

			return mgmapper.getTotalCnt5(cri, member_id);
		}

		// 6.마이페이지 - 포인트내역
		@Override
		public List<PointVO> myList6(Criteria cri, String member_id) {

			return mgmapper.mygetlist6(cri, member_id);
		}

		@Override
		public int getTotalCount6(Criteria cri, String member_id) {

			return mgmapper.getTotalCnt6(cri, member_id);
		}

		// 회원수정
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

		@Override
		public void memberDelete(MemberVO mvo, @AuthenticationPrincipal MemberDetails md) {

			System.out.println(mvo.getMember_id());
			System.out.println(md.getUsername());
			if (mvo.getMember_id().equals(md.getUsername()) && mvo.getName().equals(md.getmember().getName())) {
				// mgmapper.authdel(mvo);
				// md.isAccountNonExpired(false);

				mgmapper.memberDelete(mvo);

			}

		}

		// 출첵 포인트 카운트
		@Override
		public int mycount(PointVO pointVO, String member_id) {

			return mgmapper.mycount(pointVO, member_id);
		}

		// 출첵 포인트 넣기
		@Override
		public void getMypoint(PointVO pointVO, String member_id) {
			mgmapper.getMypoint(pointVO, member_id);

		}

		// 출첵 포인트 카운트
		@Override
		public int mycount2(PointVO pointVO, String member_id) {

			return mgmapper.mycount2(pointVO, member_id);
		}

		// 출첵 포인트 넣기
		@Override
		public void getMypoint2(PointVO pointVO, String member_id) {
			mgmapper.getMypoint2(pointVO, member_id);

		}

		@Override
		public PointVO mypnt(PointVO pointVO) {

			return mgmapper.mypnt(pointVO);
		}

	}
