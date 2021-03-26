package com.share.nanu.provider;

import java.util.Map;

public class KakaoUserInfo implements OAuth2UserInfo {

	private Map<String, Object> attributes; // oauth2 유저의 getAttributes

	public KakaoUserInfo(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	// 네이버 프로필 가져오기
	@Override
	public String getProviderId() { // 소셜의 고유 식별 정보

		return Integer.toString((int) attributes.get("id"));
	}

	@Override
	public String getProvider() { // 가입경로 ex) google, naver, kakao 등등

		return "kakao";
	}

	@Override
	public String getEmail() { // 이메일

		return (String) ((Map) attributes.get("kakao_account")).get("email");
	}

	@Override
	public String getName() {// 이름

		return (String) ((Map) ((Map) attributes.get("kakao_account")).get("profile")).get("nickname");
	}

	@Override
	public String getGender() {// 성별

		return (String) ((Map) attributes.get("kakao_account")).get("gender");
	}

	@Override
	public String getBirthday() {// 생일 -> 월/일, 카카오는 ddmm 형식으로 리턴해준다. 따라서 dd-mm형태로 포맷팅 해주어야만 db에 데이터 저장이 가능하다.
		String birthday = (String) ((Map) attributes.get("kakao_account")).get("birthday");
		//String 타입변수에 카카오에서 받아온 데이터 저장 리턴타입이 스트링
		
		birthday = birthday.substring(0, 2) + "-" + birthday.substring(3, 4);

		return birthday;
	}

	@Override
	public String getBirthyear() { // 생일 -> 년도 , 카카오는 사업자 등록을 해야만 출생년도를 받을 수 있다.

		return "0000";

	}

	@Override
	public String getMobile() { // 핸드폰 번호 , 카카오는 사업자 등록을 해야만 핸드폰 번호를 받을 수 있다.

		return "010-0000-0000";
	}

}
