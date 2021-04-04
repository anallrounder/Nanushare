package com.share.nanu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.security.MemberDetails;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.minidev.json.JSONArray;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/my/**")
public class DonationImportController {
	
	
	@GetMapping("/moneyDonationForm") //후원금 기부페이지 이동
	public ModelAndView moneyForm(ModelAndView mav) {		
		log.info("후원금 기부 페이지 이동");
		mav.setViewName("donationImport/moneyDonationForm");
		return mav;
	}
	
	@PostMapping("/commonDonation") //로그인한 회원정보를 가져오는 컨트롤러
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
	public void cardDonation(@RequestBody String card) { //후원할때 ajax에서 보낸 데이터 db에 저장, member 테이블에서 dntcnt 카운트, +1씩
		//@requestBody 는 http요청을 자바객체로 즉, http 요청의 body내용을 자바객체로 매핑
		//@responseBody 는 자바객체를 http 응답 몸체로 전송 즉, 자바객체를 http 요청의 body내용으로 매핑
		
		List<Map<String,Object>> resultMap = new ArrayList<Map<String, Object>>();
		resultMap = net.sf.json.JSONArray.fromObject(card);
		System.out.println(resultMap.get(0));
		System.out.println(resultMap.get(0).get("merchant_uid"));
	
		
		
		System.out.println(card);
		for(Map<String, Object> map : resultMap) {
			System.out.println(map.get("merchant_uid")); //주문번호
			System.out.println(map.get("buyer_email"));//구매자 이메일
			System.out.println(map.get("amount")); //결제금액
			System.out.println(map.get("paid_at"));//결제시각
			System.out.println(map.get("pay_method"));//결제방법
			System.out.println(map.get("status"));//결제상태
			System.out.println(map.get("pg_provider"));//pg사
		}
		
	}
		
	@GetMapping("/thank")
	public ModelAndView thank(ModelAndView mav) { //감사페이지 이동
		mav.setViewName("donationImport/thank");
		return mav;
	}
	
	

}
