package com.share.nanu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.ItemdonationVO;
import com.share.nanu.VO.MemberPointVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.PointVO;


@Mapper
public interface NanuDonationMapper {
	
	/* 물품 기부 */
	public MemberVO readMember(String member_id); // 물품신청서 회원 정보 불러오기
	public void saveForm(ItemdonationVO idvo); // 물품신청서 디비 입력
	public void countIDnt(MemberVO mvo); // 회원 물풐신청 횟수 카운트 +1
	
	/* 포인트 기부 */
	public List<MemberPointVO> getMP(MemberPointVO mvo); // 포인트 기부 페이지
	public void countPDnt(MemberVO mvo); // 회원 포인트(후원) 횟수 카운트 +1
	public void donatePoint(PointVO pvo); // 포인트 기부시 포인트 테이블 업데이트
	
	
}
