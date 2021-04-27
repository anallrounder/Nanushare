package com.share.nanu;

import static org.junit.Assert.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.service.NanuService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class NanuServiceTest {

	@Autowired
	private NanuService nservice;

	@Transactional
	@Test
	public void test() {
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

	}

	@Test
	void contextLoads() {
		assertNotNull(nservice);
		log.info("vo test");

	}

}
