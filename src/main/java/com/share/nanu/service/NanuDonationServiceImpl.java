// 혜선_ 물품 기부 서비스 Impl 작성중 03.18

package com.share.nanu.service;



import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.share.nanu.VO.DonationVO;
import com.share.nanu.VO.ItemdonationVO;
import com.share.nanu.VO.MemberPointVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.PointVO;
import com.share.nanu.mapper.NanuDonationMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;





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
		return ndmapper.readMember();
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

	// UNIXTimeStamp를 data타입으로 변경
	@Override
	public String changeUNIXTimeStamp(String paidAt) {

		long beforPaidAT = Long.parseLong(paidAt);
		Date date = new Date(beforPaidAT * 1000L);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // HH:mm:ss
		// sdf.setTimeZone(TimeZone.getTimeZone("GMT-4"));
		String afterPaidAt = sdf.format(date); // 스트링
		// Date afterPaidAtSql = Date.valueOf(afterPaidAt); //sql 데이터 타입
		return afterPaidAt;
		// return afterPaidAtSql;
	}

	// donation 테이블에 ajax에서 받아온 데이터 insert
	@Override
	public void insertCardDona(DonationVO donavo) {
		ndmapper.insertCardDona(donavo);
	}

	@Override
	public void updateDntcnt(String member_id) { // 후원금 기부 횟수 +1
		ndmapper.updateDntcnt(member_id);
	}

	// donation 테이블에서 주문번호가 존재하는지 조회
	@Override
	public void getDonation(String merchantUid) {
		ndmapper.getDonation(merchantUid);
	}

	
	//아임포트 엑세스 토큰 
	@Override
	public JsonNode getImportToken(String impId, String impSecret, String impToken) {
		log.info("엑세스토큰 요청 서비스");
		log.info("아임포트 아이디 : "+impId);
		log.info("아임포트 시크릿 : " + impSecret);
		log.info("아임포트 엑세스토큰 요청 url : "+ impToken);
		
		//httpclient 로 request 보내기
		//다른 서버로 request를 보내 response 받기
		//즉, 아임포트로 엑세스토큰 request를 보내서 response로 엑세스토큰 받기
		
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("imp_key", impId)); //주의! 반드시 아임포트에서 지정한 변수명으로 지정해야한다! imp_key 로 선언하지 않을시 에러
		postParams.add(new BasicNameValuePair("imp_secret", impSecret));
		log.info("postParams : "+ postParams);
		
		final HttpClient client = HttpClientBuilder.create().build();
		
		final HttpPost post = new HttpPost(impToken);
		post.setHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		JsonNode returnNode = null;
		
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			log.info("returnNode : " + returnNode);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return returnNode;
		
	}
	
	//아임포트 취소 요청
	@Override
	public JsonNode cancelPayment(String merchantUid, String cancelRequestAmount, String reason, 
			String impCancelurl, String accessToken) {
		log.info("결제 취소 서비스");
		log.info("결제 번호 : " + merchantUid );
		log.info("결제 취소 금액 : " + cancelRequestAmount );
		log.info("결제 취소 이유 : " + reason );
		
		
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("merchant_uid", merchantUid));
		//postParams.add(new BasicNameValuePair("cancel_request_amount", cancelRequestAmount));
		postParams.add(new BasicNameValuePair("reason", reason));
		
		final HttpClient client = HttpClientBuilder.create().build();
		
		final HttpPost post = new HttpPost(impCancelurl);
		post.setHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		post.addHeader("Authorization", accessToken);
		
		JsonNode returnNode = null;
		
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return returnNode;
	}

	//아임포트 취소후 처리상태 업데이트
	@Override
	public void updateState(String merchantUid) {
		ndmapper.updateState(merchantUid);
	}
	

}
