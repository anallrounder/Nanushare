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

	@Autowired
	private NanuMapper nmapper;

	@Override // userRequest는 code를 받아서 accessToken을 응답받은 객체
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		log.info("login oauth2service");

		OAuth2User oauth2User = super.loadUser(userRequest); // 회원 프로필 조회
		log.info("userRequest clientRegistration" + userRequest.getClientRegistration());// code를 통해 구성한 정보
		log.info("oauth2User" + oauth2User);// 토큰을 통해 응답 받은 회원 정보

		return ProcessOAuth2User(userRequest, oauth2User);

	}

	private OAuth2User ProcessOAuth2User(OAuth2UserRequest userRequest, OAuth2User oauth2User) {
		OAuth2UserInfo userInfo = null;

		if (userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
			log.info("naver 요청");
			userInfo = new NaverUserInfo((Map) oauth2User.getAttributes().get("response"));
		}

		MemberVO mvo = nmapper.getMember(userInfo.getEmail());
		if (mvo == null) {
			mvo = new MemberVO();
			mvo.setMember_id(userInfo.getEmail());
			mvo.setPw(null);
			mvo.setSignuppath(userInfo.getProvider());
			mvo.setName(userInfo.getName());
			mvo.setPhone(userInfo.getMobile());
			mvo.setGender(userInfo.getGender());
			mvo.setBirth(Date.valueOf(userInfo.getBirthyear() + "-" + userInfo.getBirthday())); // string 을 오라클의 Date로
																								// 변환, yyyy-mm-dd형식으로
																								// 포맷팅
			nmapper.memberJoin(mvo);
			nmapper.insertAuth(mvo);
			mvo = nmapper.getMember(userInfo.getEmail());

		}

		return new MemberDetails(mvo, oauth2User.getAttributes());
	}

}
