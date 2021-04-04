package com.share.nanu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.DonationVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.NanuDonationService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/my/**")
public class DonationImportController {
	
	
	@Autowired
	private NanuDonationService ndservice;
	
	@GetMapping("/moneyDonationForm") //후원금 기부페이지 이동
	public ModelAndView moneyForm(ModelAndView mav) {		
		log.info("후원금 기부 페이지 이동");
		mav.setViewName("donationImport/moneyDonationForm");
		return mav;
	}
	
	@PostMapping("/commonDonation") //로그인한 회원정보를 가져오는 컨트롤러,공통 함수, 카드, 계좌이체에서 모두 사용
	@ResponseBody
	public Map<String, String> test(@AuthenticationPrincipal MemberDetails md) {
		Map<String, String> result = new HashMap<String, String>();
		result.put("member_id", md.getUsername());
		result.put("name", md.getmember().getName());
		return result;
	}
	
	@ResponseBody
	@SuppressWarnings("unchecked")
	@PostMapping("/cardDonation")
	public void cardDonation(@RequestBody String card,DonationVO donavo) { //후원할때 ajax에서 보낸 데이터 db에 저장, member 테이블에서 dntcnt 카운트, +1씩
		//@requestBody 는 http요청을 자바객체로 즉, http 요청의 body내용을 자바객체로 매핑
		//@responseBody 는 자바객체를 http 응답 몸체로 전송 즉, 자바객체를 http 요청의 body내용으로 매핑
		log.info("카드결제 호출");
			
		  List<Map<String,Object>> resultMap = new ArrayList<Map<String, Object>>();
		  resultMap = JSONArray.fromObject(card);
		  
		  //paid_at을 유닉스 타임 스탬프로 받아와서 db에 입력하기 위해 data타입으로 바꾸는 로직 
		  String paidAt = String.valueOf(resultMap.get(0).get("paid_at")); //paid_at은 int타입 아임포트 문서에 number라고 정의되어 있음
		  String changePaidAt =  ndservice.changeUNIXTimeStamp(paidAt);
		  log.info(changePaidAt); // unix time stamp -> data 변경 확인
		  
		  
		  ndservice.insertCardDona(resultMap);
		 
		  
		  
			/*
			 * System.out.println(resultMap.get(0));
			 * System.out.println(resultMap.get(0).get("merchant_uid"));
			 * System.out.println(card); for(Map<String, Object> map : resultMap) {
			 * System.out.println(map.get("merchant_uid")); //주문번호
			 * System.out.println(map.get("buyer_email"));//구매자 이메일
			 * System.out.println(map.get("amount")); //결제금액, db는 number 타입
			 * System.out.println(map.get("paid_at"));//결제시각
			 * System.out.println(map.get("pay_method"));//결제방법
			 * System.out.println(map.get("status"));//결제상태, 처리상태 처리
			 * System.out.println(map.get("pg_provider"));//pg사 }
			 */
		
	}
		
	@GetMapping("/thank")
	public ModelAndView thank(ModelAndView mav) { //감사페이지 이동
		log.info("감사페이지로 이동");
		mav.setViewName("donationImport/thank");
		return mav;
	}
	
	

}
