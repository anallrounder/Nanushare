//혜선 물품기부 컨트롤러 작성 03.18_목

package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.nanu.VO.ItemdonationVO;
import com.share.nanu.VO.MemberPointVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.PointVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.NanuDonationService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@AllArgsConstructor
@Controller
@RequestMapping("/donation/*")
public class NanuDonationController {

	@Autowired
	private NanuDonationService service;
	
	// 물품기부 메인
	@GetMapping("/item/main")
	public String itemMain(Model model, @AuthenticationPrincipal MemberDetails md) {
		log.info("item donation main page 호출");
		
		//@AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		/* model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); */
		if(md!=null) { //로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			model.addAttribute("username", md.getmember().getName());
		}
				
		return "donation/itemMain";
	}

	// 물품 신청서 작성 페이지 itemForm.jsp
	/*
	@GetMapping("/item/form") 
	public String itemForm(MemberVO mvo, Model model) throws Exception {
		log.debug("controller -- itemForm -- 호출");
		model.addAttribute("memberInfo", service.getMember(mvo.getMember_id()));
		return "donation/itemForm";
	}
	*/
	
	// 물품 신청서 작성 페이지 itemForm.jsp -> 로그인 사용자용
	@GetMapping("/item/form") 
	public String itemForm(MemberVO mvo, Model model, @AuthenticationPrincipal MemberDetails md) throws Exception {
		log.debug("controller -- itemForm -- 호출");
		model.addAttribute("list1", service.getMember());
		
		//@AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		/* model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); */
		if(md!=null) { //로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			model.addAttribute("username", md.getmember().getName());
		}
		
		return "donation/itemForm";
	}
	
	
	// 물품 나눔 후 정보 디비입력 + 수정 테이블에 따로따로 입력해야함 
	@PostMapping("/item/formAction")
	public String formAction(MemberVO mvo, ItemdonationVO idvo, Model model) throws Exception {
		log.debug("controller -- formAction -- 입력 값 DB로!!");
		service.countItemDonation(mvo); //멤버 테이블에 물품기부 횟수 카운트 +1
		service.saveForm(idvo);  //기부 테이블에 정보 입력
		return "donation/thanksPointDona"; // 감사 페이지로 연결 예정
	}

	// 돈기부여 메인 moneyMain.jsp
	@GetMapping("/money/main")
	public String moneyMain(Model model, @AuthenticationPrincipal MemberDetails md) {
		log.info("money donation main page 호출");
		
		//@AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		/* model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); */
		if(md!=null) { //로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			model.addAttribute("username", md.getmember().getName());
		}
		
		return "donation/moneyMain";
	}
	
	// 포인트 나눔하기 페이지 pointForm.jsp
	@GetMapping("/money/point")
	public String pointForm(MemberPointVO mpvo, Model model, @AuthenticationPrincipal MemberDetails md) throws Exception {
		log.debug("controller -- pointForm -- 호출");
		model.addAttribute("memberInfo", service.getMemberPoint(mpvo));
		
		//@AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		/* model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); */
		if(md!=null) { //로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			model.addAttribute("username", md.getmember().getName());
		}
		
		return "donation/pointForm";
	}
	
	// 포인트 전송 -> 데이터베이스 저장
	@PostMapping("/money/point/pointAction")
	public String pointAction(MemberPointVO mpvo, MemberVO mvo, PointVO pvo, Model model) throws Exception {
		log.debug("controller -- pointAction -- 입력 값 DB로!!");
		service.countPointDonation(mvo); //멤버 테이블에 물품기부 횟수 카운트 +1
		service.donatePoint(pvo);  // 포인트 테이블에 기부정보 입력
		//model.addAttribute("memberInfo", service.getMemberPoint(mpvo));->이 정보는 ajax 불러와야할것같다.. 이건 일단 검색좀 더 해보자.
		return "donation/thanksPointDona"; // 감사 페이지로 연결 예정
	}

	
}
