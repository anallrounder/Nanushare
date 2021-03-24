package com.share.nanu.provider;

public interface OAuth2UserInfo {

	// 소셜에서 가져올 정보
	String getProviderId(); //소셜의 고유 식별자, 아이디x
	
	String getProvider(); // 소셜 이름 ex) naver,kakao 등

	String getEmail();// 이메일

	String getName();// 이름

	String getGender();// 성별

	String getBirthday();// 생일

	String getMobile();// 핸드폰 번호

	String getBirthyear();// 출생연도

}
