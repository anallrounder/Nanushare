package com.share.nanu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.mypaging.Criteria;

@Mapper
public interface MyPageMapper {

	// 마이페이지 - 나의 문의
	//public List<MemberVO> mygetlist1();
	public List<BoardVO> getPaging1(Criteria cri, String member_id);
	public int getTotalCnt1(Criteria cri);

	// 마이페이지 - 나의 인증
	//public List<MemberVO> mygetlist2();
	public List<MemberVO> getPaging2(Criteria cri);
	public int getTotalCnt2(Criteria cri);

	// 마이페이지 - 나의 나눔
	//public List<IteminvenVO> mygetlist3();
	public List<IteminvenVO> getPaging3(Criteria cri);
	public int getTotalCnt3(Criteria cri);

	// 마이페이지 - 나의 댓글
	//public List<BoardreplyVO> mygetlist4();
	public List<BoardreplyVO> getPaging4(Criteria cri);
	public int getTotalCnt4(Criteria cri);
	
	// 마이페이지 - 나의 결제
	public List<BoardreplyVO> getPaging5(Criteria cri);
	public int getTotalCnt5(Criteria cri);

	// 회원수정
	public void memberModify(MemberVO mvo);
	
	
	// 회원탈퇴
	public void memberDelete(MemberVO mvo);
	public void authdel(MemberVO mvo);

}
