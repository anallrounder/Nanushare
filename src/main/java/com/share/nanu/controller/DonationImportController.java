package com.share.nanu.controller;

import java.sql.Date;
import java.text.ParseException;
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
	public void cardDonation(@RequestBody String card,DonationVO donavo) throws ParseException { //후원할때 ajax에서 보낸 데이터 db에 저장, member 테이블에서 dntcnt 카운트, +1씩
		//@requestBody 는 http요청을 자바객체로 즉, http 요청의 body내용을 자바객체로 매핑
		//@responseBody 는 자바객체를 http 응답 몸체로 전송 즉, 자바객체를 http 요청의 body내용으로 매핑
		log.info("카드결제 호출");
			
		  List<Map<String,Object>> resultMap = new ArrayList<Map<String, Object>>();
		  resultMap = JSONArray.fromObject(card);
		  
		  //paid_at을 유닉스 타임 스탬프로 받아와서 db에 입력하기 위해 data타입으로 바꾸는 로직 
		  String paidAt = String.valueOf(resultMap.get(0).get("paid_at")); //paid_at은 int타입 아임포트 문서에 number라고 정의되어 있음
		  String changePaidAt =  ndservice.changeUNIXTimeStamp(paidAt);
		  System.out.println(changePaidAt);
			
		  Date dateChangePaidAt = Date.valueOf(changePaidAt); //문자열로 반환된 날짜를 sql date 형식으로 지정
		  String amount = String.valueOf(resultMap.get(0).get("amount"));//int 타입을 String으로 캐스팅	
		  
		  
		  donavo.setDnt_paynum( (String)(resultMap.get(0).get("merchant_uid")) );
		  donavo.setMember_id( (String)(resultMap.get(0).get("buyer_email")) );
		  donavo.setDntprice( amount );
		  donavo.setDntdate( dateChangePaidAt );
		  donavo.setPg( (String)(resultMap.get(0).get("pg_provider")) );
		  donavo.setPaymethod( (String)(resultMap.get(0).get("pay_method")) );
		  donavo.setDntstat( (String)(resultMap.get(0).get("status")) );
		  
		  ndservice.insertCardDona(donavo);
		  if((String)(resultMap.get(0).get("status")) == "paid") {
			  ndservice.updateDntcnt(donavo.getMember_id());
		  }
		  
		  
		
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@PostMapping("/transDonation")
	public void transDonation(@RequestBody String trans,DonationVO donavo) {
		log.info("실시간 계좌이체 호출");
		
		List<Map<String,Object>> resultMap = new ArrayList<Map<String, Object>>();
		  resultMap = JSONArray.fromObject(trans);
		  
		//paid_at을 유닉스 타임 스탬프로 받아와서 db에 입력하기 위해 data타입으로 바꾸는 로직 
		  String paidAt = String.valueOf(resultMap.get(0).get("paid_at")); //paid_at은 int타입 아임포트 문서에 number라고 정의되어 있음
		  String changePaidAt =  ndservice.changeUNIXTimeStamp(paidAt);
		  System.out.println(changePaidAt);
			
		  Date dateChangePaidAt = Date.valueOf(changePaidAt); //문자열로 반환된 날짜를 sql date 형식으로 지정
		  String amount = String.valueOf(resultMap.get(0).get("amount"));//int 타입을 String으로 캐스팅	
		  
		  
		  donavo.setDnt_paynum( (String)(resultMap.get(0).get("merchant_uid")) );
		  donavo.setMember_id( (String)(resultMap.get(0).get("buyer_email")) );
		  donavo.setDntprice( amount );
		  donavo.setDntdate( dateChangePaidAt );
		  donavo.setPg( (String)(resultMap.get(0).get("pg_provider")) );
		  donavo.setPaymethod( (String)(resultMap.get(0).get("pay_method")) );
		  donavo.setDntstat( (String)(resultMap.get(0).get("status")) );
		  
		  ndservice.insertCardDona(donavo);
		  if((String)(resultMap.get(0).get("status")) == "paid") {
			  ndservice.updateDntcnt(donavo.getMember_id());
		  }
		 
		
	}
		
	@GetMapping("/thank")
	public ModelAndView thank(ModelAndView mav) { //감사페이지 이동
		log.info("감사페이지로 이동");
		mav.setViewName("donationImport/thank");
		return mav;
	}
	
	

}
