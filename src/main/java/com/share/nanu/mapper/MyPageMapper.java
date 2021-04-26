package com.share.nanu.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.PointVO;
import com.share.nanu.mypaging.Criteria;

@Mapper
public interface MyPageMapper {

	// 마이페이지 - 나의 문의
	public List<BoardVO> mygetlist1(Criteria cri, String member_id);

	public int getTotalCnt1(Criteria cri, String member_id);

	// 마이페이지 - 나의 인증
	public List<BoardVO> mygetlist2(Criteria cri, String member_id);

	public int getTotalCnt2(Criteria cri, String member_id);

	// 마이페이지 - 나의 나눔
	public List<IteminvenVO> mygetlist3(Criteria cri, String member_id);

	public int getTotalCnt3(Criteria cri, String member_id);

	// 마이페이지 - 나의 댓글
	public List<BoardreplyVO> mygetlist4(Criteria cri, String rid);

	public int getTotalCnt4(Criteria cri, String rid);

	// 마이페이지 - 나의 결제
	public List<BoardreplyVO> mygetlist5(Criteria cri, String member_id);

	public int getTotalCnt5(Criteria cri, String member_id);

	// 마이페이지 - 나의 포인트
	public List<PointVO> mygetlist6(Criteria cri, String member_id);

	public int getTotalCnt6(Criteria cri, String member_id);

	// 회원수정
	public void memberModify(MemberVO mvo);

	// 회원탈퇴
	public void memberDelete(MemberVO mvo);

	// 카운트
	public int mycount(PointVO pointVO, String member_id);

	// 포인트 insert
	public void getMypoint(PointVO pointVO, String member_id);

	public PointVO mypnt(PointVO pointVO);

	// 카운트
	public int mycount2(PointVO pointVO, String member_id);

	// 포인트 insert
	public void getMypoint2(PointVO pointVO, String member_id);
	
	//동물상 테스트 카운트
	public int myAnimalFaceTestCount(PointVO pointVO, String member_id);
	
	//동물상 테스트 포인트 입력
	public void getMyAnimalFacePoint(PointVO pointVO, String member_id);

}
