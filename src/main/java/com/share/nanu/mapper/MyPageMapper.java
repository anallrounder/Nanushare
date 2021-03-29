package com.share.nanu.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.page.Criteria;

@Mapper
public interface MyPageMapper {
	
	//public MemberVO memberLogin(MemberVO mvo);
	//로그인체크
	public MemberVO loginCheck(MemberVO vo, HttpSession session);
	//로그인정보
	//public MemberVO viewMember(MemberVO vo);

	
	//public MemberVO loginCheck(String memeber_id, String pw);
	
	//마이페이지 - 나의 문의
	public List<MemberVO> mygetlist1();
	public List<MemberVO> getPaging1(Criteria cri);
	public int getTotalCnt1(Criteria cri);

	//마이페이지 - 나의 인증
	public List<MemberVO> mygetlist2();
	public List<MemberVO> getPaging2(Criteria cri);
	public int getTotalCnt2(Criteria cri);
	
	
	//마이페이지 - 나의 나눔
	public List<IteminvenVO> mygetlist3();
	//public List<IteminvenVO> getPaging3(Criteria cri);
	//public int getTotalCnt3(Criteria cri);
	
	//마이페이지 - 나의 댓글
	public List<BoardreplyVO> mygetlist4();
	//public List<BoardreplyVO> getPaging4(Criteria cri);
	//public int getTotalCnt4(Criteria cri);
	
	
	
	
	//수정하는곳
	public MemberVO memberModifyGET(String name);

	public MemberVO memberModifyPOST(MemberVO memberVO);

	
	//회원탈퇴
	public MemberVO memberDelete(MemberVO membervo);

	

}
