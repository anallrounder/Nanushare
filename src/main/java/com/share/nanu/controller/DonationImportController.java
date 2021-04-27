package com.share.nanu.controller;


import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.share.nanu.VO.DonationVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.DonationService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/my/**")
public class DonationImportController {	
	
	//아임포트 아이디
	private final static String IMP_ID = "4277055072256012"; 
	//아임포트 시크릿 
	private final static String IMP_SECRET = "33wvwXxYcfLhMimvBD5fDeteJBRCiPjlSQQpOoo1D9iqsEW3i1iVfL9Zn1BFRV1JMS9AgxBUHUk9ygdQ";
	//아임포트 토큰 요청 url
	private final static String IMP_TOKEN = "https://api.iamport.kr/users/getToken";
	//아임포트 결제 취소 요청 url
	private final static String IMP_CANCELURL = "https://api.iamport.kr/payments/cancel";
		
	
	
	@Autowired
	private DonationService ndservice;
	
	@GetMapping("/moneyDonationForm") //후원금 기부페이지 이동
	public ModelAndView moneyForm(ModelAndView mav, @AuthenticationPrincipal MemberDetails md) {		
		log.info("후원금 기부 페이지 이동");
		mav.setViewName("donationImport/moneyDonationForm");
		
		// @AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		/* model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); */
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			mav.addObject("username", md.getmember().getName());
		}
		return mav;
	}
	
	@PostMapping("/commonDonation") //로그인한 회원정보를 가져오는 컨트롤러,공통 함수, 카드, 계좌이체에서 모두 사용
	@ResponseBody
	public Map<String, String> common(@AuthenticationPrincipal MemberDetails md) {
		Map<String, String> result = new HashMap<String, String>();
		result.put("member_id", md.getUsername());
		result.put("name", md.getmember().getName());
		return result;
	}
	
	@ResponseBody
	@SuppressWarnings("unchecked")
	@PostMapping("/cardDonation")
	public void cardDonation(@RequestBody String card,DonationVO donavo) throws ParseException { 
		//후원할때 ajax에서 보낸 데이터 db에 저장, member 테이블에서 dntcnt 카운트, +1씩
		//@requestBody 는 http요청을 자바객체로 즉, http 요청의 body내용을 자바객체로 매핑
		//@responseBody 는 자바객체를 http 응답 몸체로 전송 즉, 자바객체를 http 요청의 body내용으로 매핑
		log.info("카드결제 호출");
			
		  List<Map<String,Object>> resultMap = new ArrayList<Map<String, Object>>();
		  resultMap = JSONArray.fromObject(card);
		  
		  //paid_at을 유닉스 타임 스탬프로 받아와서 db에 입력하기 위해 data타입으로 바꾸는 로직 
		  String paidAt = String.valueOf(resultMap.get(0).get("paid_at")); //paid_at은 int타입 아임포트 문서에 number라고 정의되어 있음
		  String payMethod = String.valueOf(resultMap.get(0).get("pay_method"));
		  String changePaidAt =  ndservice.changeUNIXTimeStamp(paidAt);
		  
		  System.out.println(changePaidAt);
		  System.out.println(payMethod);
		  
		  if(payMethod != null) {
			  if(payMethod.equals("point")) {
				  payMethod = "pay";
			  }
		  }
		  
		 
		  //Date dateChangePaidAt = new Date(Long.parseLong(changePaidAt));		  
		  //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  //Date dateChangePaidAt = (Date) sdf.parse(changePaidAt);
		  //changePaidAt = sdf.format(changePaidAt);
		  //Timestamp dateChangePaidAt = Timestamp.valueOf(changePaidAt);
		  
		  Date dateChangePaidAt = Date.valueOf(changePaidAt); //문자열로 반환된 날짜를 sql date 형식으로 지정
		  
		  System.out.println(changePaidAt);
		  
		  String amount = String.valueOf(resultMap.get(0).get("amount"));//int 타입을 String으로 캐스팅	
		  
		  
		  donavo.setDnt_paynum( (String)(resultMap.get(0).get("merchant_uid")) );
		  donavo.setMember_id( (String)(resultMap.get(0).get("buyer_email")) );
		  donavo.setDntprice( amount );
		  donavo.setDntdate( dateChangePaidAt );
		  donavo.setPg( (String)(resultMap.get(0).get("pg_provider")) );
		  donavo.setPaymethod( payMethod );
		  donavo.setDntstat( (String)(resultMap.get(0).get("status")) );
		  
		  ndservice.insertCardDona(donavo); //받아온 데이터 저장
		  if((String)(resultMap.get(0).get("status")) == "paid") { //결제 상태가 paid(결제완료)면 카운트
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
	
	
	//@CrossOrigin(origins = "http://localhost:8282, withCredentials = 'true' ", maxAge = 3600)
	@PostMapping("/my/payments/cancel")
	public ResponseEntity<String> refund(@RequestBody Map<String, String> impData, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		log.info("클라이언트가 가맹점 서버로 결제취소 요청");
		
		ResponseEntity<String> entity = null;
		try {
			String merchantUid = impData.get("merchant_uid");// 주문번호
			String cancelRequestAmount = request.getParameter("cancel_request_amount"); //결제 취소 금액
			String reason = impData.get("reason"); //결제 취소 이유
			
			//결제 취소할때 결제 금액은 필요없음, 결제 번호와 결제 취소 이유만 필요
			log.info("결제 번호 : " + merchantUid );
			log.info("결제 취소 금액 : " + cancelRequestAmount );
			log.info("결제 취소 이유 : " + reason );
			
			
			JsonNode getToken = ndservice.getImportToken(IMP_ID,IMP_SECRET,IMP_TOKEN);
			log.info("토큰 가져오기 : "+ getToken);
			
			String accessToken = getToken.get("response").get("access_token").asText();
			log.info("엑세스 토큰 : " +accessToken);
			
			JsonNode result = ndservice.cancelPayment(merchantUid,cancelRequestAmount,reason,IMP_CANCELURL,accessToken);
			log.info("취소 처리 결과 : "+ result);
			ndservice.updateState(merchantUid);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO: handle exception
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		
		return entity;
	}
	
					
	@GetMapping("/my/donation/thank")
	public ModelAndView thank(ModelAndView mav, @AuthenticationPrincipal MemberDetails md) { //감사페이지 이동
		log.info("감사페이지로 이동");
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			mav.addObject("username", md.getmember().getName());
		}
		mav.setViewName("donation/thanks");
		return mav;
	}
		
}
