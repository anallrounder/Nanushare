package com.share.nanu.service;

import java.sql.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.mapper.NanuMapper;
import com.share.nanu.provider.NaverUserInfo;
import com.share.nanu.provider.OAuth2UserInfo;
import com.share.nanu.security.MemberDetails;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {
	//DefaultOAuth2UserService는 OAuth2UserService의 구현체

	@Autowired
	private NanuMapper nmapper;

	@Override // userRequest는 code를 받아서 accessToken을 응답받은 객체
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		// 후처리 함수 소셜로 부터 받은 userRequest 데이터 후처리
		log.info("login oauth2service");

		OAuth2User oauth2User = super.loadUser(userRequest); // 회원 프로필 조회
		// 소셜 로그인 버튼 클릭->소셜 로그인창->로그인완료->code리턴(oauth2-client)->accessToken
		// userRequest 정보
		// userRequest 정보 -> 회원프로필 조회(loaduser 함수)-> 소셜로부터 회원 프로필을 받아준다.

		log.info("userRequest clientRegistration" + userRequest.getClientRegistration());// code를 통해 구성한 정보
		log.info("getAccessToken" + userRequest.getAccessToken());
		log.info("oauth2User" + oauth2User);// 토큰을 통해 응답 받은 회원 정보

		OAuth2UserInfo userInfo = null;

		if (userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
			// getRegistrationId로 어떤 oauth로 로그인했는지 확인 가능
			log.info("naver 요청");
			userInfo = new NaverUserInfo((Map)oauth2User.getAttributes().get("response"));
		}

		MemberVO mvo = nmapper.getMember(userInfo.getProviderId()); // 이미 가입이 되어있는지 조회
		if (mvo == null) {// 가입되어 있지 않다면 가입진행
			mvo = new MemberVO();
			mvo.setMember_id(userInfo.getProviderId());
			// 소셜은 로그인창에 아이디와 비밀번호를 입력하여 로그인하지 않기때문에 아이디 컬럼에 고유식별자 삽입
			mvo.setPw(userInfo.getProvider() + "_" + userInfo.getProviderId()); // 비밀번호를 임의로 provider+providerId 로 생성
			mvo.setSignuppath(userInfo.getProvider());
			mvo.setName(userInfo.getName());
			mvo.setPhone(userInfo.getMobile());
			mvo.setGender(userInfo.getGender());
			mvo.setBirth(Date.valueOf(userInfo.getBirthyear() + "-" + userInfo.getBirthday())); // string 을 오라클의 Date로
																								// 변환, yyyy-mm-dd형식으로
																								// 포맷팅
			nmapper.memberJoin(mvo);
			nmapper.insertAuth(mvo);
			mvo = nmapper.getMember(userInfo.getProviderId());

		}

		return new MemberDetails(mvo, oauth2User.getAttributes());

	}

}
