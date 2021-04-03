package com.share.nanu.controller;

import java.util.HashMap;
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
	
	@PostMapping("/cardDonation")
	public void cardDonation() {
		//@requestBody 는 http요청을 자바객체로 즉, http 요청의 body내용을 자바객체로 매핑
		//@responseBody 는 자바객체를 http 응답 몸체로 전송 즉, 자바객체를 http 요청의 body내용으로 매핑
		
	}
	
	
	@GetMapping("/thank")
	public void thank() { //감사페이지 이동
		
	}
	
	

}
