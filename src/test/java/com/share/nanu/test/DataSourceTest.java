package com.share.nanu.test;

import static org.junit.Assert.assertNull;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import org.springframework.transaction.annotation.Transactional;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.service.NanuService;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class DataSourceTest {

	@Autowired
	private NanuService nservice;

	@Transactional
	@Test
	public void test() {
		log.info("테스트 시작");
		
		MemberVO mvo = new MemberVO();
		mvo.setMember_id("as@naver.com");
		mvo.setPw("qw12!");
		mvo.setName("테스트");
		mvo.setSignuppath("home");
		mvo.setAuthname("회원");
		mvo.setBklist("N");
		mvo.setEnable('1');
		mvo.setSubemail("as2@naver.com");

		nservice.memberJoin(mvo); 
		//assertNull(mvo);

	}

}
