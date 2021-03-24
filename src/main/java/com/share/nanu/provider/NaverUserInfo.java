package com.share.nanu.provider;

import java.util.Map;

public class NaverUserInfo implements OAuth2UserInfo {

	private Map<String, Object> attributes; //oauth2 유저의 getAttributes

	public NaverUserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	// 네이버 프로필 가져오기
	
	@Override
	public String getProviderId() { //소셜의 고유 식별 정보
		
		return (String) attributes.get("id");
	}

	@Override
	public String getProvider() { // 가입경로 ex) google, naber, kakao 등등

		return "naver";
	}

	@Override
	public String getEmail() { // 이메일

		return (String) attributes.get("email");
	}

	@Override
	public String getName() {// 이름

		return (String) attributes.get("name");
	}

	@Override
	public String getGender() {// 성별

		return (String) attributes.get("gender");
	}

	@Override
	public String getBirthday() {// 생일 -> 월/일

		return (String) attributes.get("birthday");
	}

	@Override
	public String getBirthyear() { // 생일 -> 년도

		return (String) attributes.get("birthyear");

	}

	@Override
	public String getMobile() { // 핸드폰 번호

		return (String) attributes.get("mobile");
	}

	

}
