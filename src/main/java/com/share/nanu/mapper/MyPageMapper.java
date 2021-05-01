package com.share.nanu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.VO.DonationVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.PointVO;
import com.share.nanu.mypaging.Criteria;

@Mapper
public interface MyPageMapper {

	// 마이페이지 - 나의 문의
	public List<BoardVO> ask(Criteria cri, String member_id);

	public int getTotalCount_ask(Criteria cri, String member_id);

	// 마이페이지 - 나의 인증
	public List<BoardVO> content(Criteria cri, String member_id);

	public int getTotalCount_content(Criteria cri, String member_id);

	// 마이페이지 - 나의 나눔
	public List<IteminvenVO> give(Criteria cri, String member_id);

	public int getTotalCount_give(Criteria cri, String member_id);

	// 마이페이지 - 나의 댓글
	public List<BoardreplyVO> reply(Criteria cri, String rid);

	public int getTotalCount_reply(Criteria cri, String rid);

	// 마이페이지 - 나의 결제
	public List<DonationVO> pay(Criteria cri, String member_id);

	public int getTotalCount_pay(Criteria cri, String member_id);

	// 마이페이지 - 나의 포인트
	public List<PointVO> point(Criteria cri, String member_id);

	public int getTotalCount_point(Criteria cri, String member_id);

	// 회원수정
	public void memberModify(MemberVO mvo);

	// 회원탈퇴
	public void memberDelete(MemberVO mvo);

}
