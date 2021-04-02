// 혜선_ 물품 기부 서비스 Impl 작성중 03.18

package com.share.nanu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.nanu.VO.ItemdonationVO;
import com.share.nanu.VO.MemberPointVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.PointVO;
import com.share.nanu.mapper.NanuDonationMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class NanuDonationServiceImpl implements NanuDonationService {

	@Autowired
	private NanuDonationMapper ndmapper;

	// 물품신청서 회원 정보 불러오기
	@Override
	public MemberVO getMember(String member_id) {
		log.info("service---getMember ------호출");
		return ndmapper.readMember(member_id);
	}
	
	// 물품신청서 회원 정보 불러오기 - 로그인 사용자 용 test중
	@Override
	public List<MemberVO> getMember() {
		log.info("service---getMember ------호출");
		return  ndmapper.readMember();
	}

	// 물품신청서 테이블에 저장
	@Override
	public void saveForm(ItemdonationVO idvo) {
		log.info("service---saveForm ------호출");
		ndmapper.saveForm(idvo);
	}
	
	// 멤버 테이블에 물품기부횟수 카운트 +1
	@Override
	public void countItemDonation(MemberVO mvo) {
		log.info("service---countItemDonation ------호출");
		ndmapper.countIDnt(mvo);
	}

	// 포인트 나눔 페이지 : 멤버 + 포인트 조인해서 불러오기
	@Override
	public List<MemberPointVO> getMemberPoint(MemberPointVO mvo) {
		log.info("service---getMemberPoint ------호출");
		return ndmapper.getMP(mvo);
	}

	// 포인트 나눔 횟수 카운트 -> 멤버테이블에
	@Override
	public void countPointDonation(MemberVO mvo) {
		log.info("service---countPointDonation ------호출");
		ndmapper.countPDnt(mvo);
		
	}
	
	// 포인트 기부 변동사항 디비 저장
	@Override
	public void donatePoint(PointVO pvo) {
		log.info("service---donatePoint ------호출");
		ndmapper.donatePoint(pvo);
	}


	

}
