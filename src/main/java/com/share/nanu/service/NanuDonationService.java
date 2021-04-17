// 혜선_ 물품기부 서비스 작성 03.18

package com.share.nanu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.share.nanu.VO.DonationVO;
import com.share.nanu.VO.ItemdonationVO;
import com.share.nanu.VO.MemberPointVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.PointVO;

import net.minidev.json.JSONObject;

public interface NanuDonationService {

	/* 물품 기부 */
	public List<MemberVO> getMember(); // 물품신청서 회원 정보 불러오기//로그인한 사용자용 - 로그인 사용자 용 test중

	public MemberVO getMember(String member_id); // 물품신청서 회원 정보 불러오기

	public void saveForm(ItemdonationVO idvo); // 물품신청서 -> 테이블에 저장

	public void countItemDonation(MemberVO mvo); // 멤버 테이블에 -> 물품기부횟수 카운트 +1

	/* 포인트 기부 */
	public List<MemberPointVO> getMemberPoint(MemberPointVO mvo); // 포인트 나눔 페이지 (포인트+멤버 테이블 조인_ resultMap: point +
																	// member) // 포인트정보불러오기

	public void countPointDonation(MemberVO mvo); // 멤버 테이블에 -> 포인트(후원) 기부횟수 카운트 +1

	public void donatePoint(PointVO pvo);// 포인트 테이블에 포인트 기부내역 업데이트

	// UNIXTimeStamp를 data타입으로 변경
	public String changeUNIXTimeStamp(String paidAt);

	// donation 테이블에 ajax에서 받아온 데이터 insert
	public void insertCardDona(DonationVO donavo);

	// 후원금 기부횟수 +1
	public void updateDntcnt(String member_id);

	// donation 테이블에서 주문번호가 존재하는지 조회
	public void getDonation(String merchantUid);
	
	//아임포트 엑세스 토큰 가져오기
	public JsonNode getImportToken(String impId, String impSecret, String impToken);
	
<<<<<<< HEAD

=======
	//아임포트 취소
	public JsonNode cancelPayment(String merchantUid, String cancelRequestAmount, String reason, String impCancelurl, String accessToken);
	
	//아임포트 취소후 결제 상태 업데이트
	public void updateState(String merchantUid);
	
	
>>>>>>> master_lhj
	

}
