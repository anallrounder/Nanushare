package com.share.nanu.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.VO.DonationVO;
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
		public List<BoardVO> ask(Criteria cri, String member_id) {

			return mgmapper.ask(cri, member_id);
		}

		@Override
		public int getTotalCount_ask(Criteria cri, String member_id) {
			return mgmapper.getTotalCount_ask(cri, member_id);
		}

		// 2.마이페이지-나의인증
		@Override
		public List<BoardVO> content(Criteria cri, String member_id) {
			return mgmapper.content(cri, member_id);
		}

		@Override
		public int getTotalCount_content(Criteria cri, String member_id) {
			return mgmapper.getTotalCount_content(cri, member_id);
		}

		// 3.마이페이지-나의나눔
		@Override
		public List<IteminvenVO> give(Criteria cri, String member_id) {
			return mgmapper.give(cri, member_id);
		}

		@Override
		public int getTotalCount_give(Criteria cri, String member_id) {
			return mgmapper.getTotalCount_give(cri, member_id);
		}

		//  4.마이페이지-나의댓글
		@Override
		public List<BoardreplyVO> reply(Criteria cri, String member_id) {

			return mgmapper.reply(cri, member_id);
		}

		@Override
		public int getTotalCount_reply(Criteria cri, String rid) {

			return mgmapper.getTotalCount_reply(cri, rid);
		}

		// 5.마이페이지 - 결제내역
		@Override
		public List<DonationVO> pay(Criteria cri, String member_id) {

			return mgmapper.pay(cri, member_id);
		}

		@Override
		public int getTotalCount_pay(Criteria cri, String member_id) {

			return mgmapper.getTotalCount_pay(cri, member_id);
		}

		// 6.마이페이지 - 포인트내역
		@Override
		public List<PointVO> point(Criteria cri, String member_id) {

			return mgmapper.point(cri, member_id);
		}

		@Override
		public int getTotalCount_point(Criteria cri, String member_id) {

			return mgmapper.getTotalCount_point(cri, member_id);
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
	}
