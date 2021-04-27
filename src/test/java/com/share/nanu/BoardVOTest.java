package com.share.nanu;

import static org.junit.Assert.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.service.BoardShowsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class BoardVOTest {

	@Autowired
	private BoardShowsService bservice;
	
	@Transactional
	@Test
	public void test() {
		BoardVO bvo = new BoardVO();

		
		//bvo.setB_index(333);
		bvo.setBcat_num('2');
		bvo.setBcontent("테스트");
		//bvo.setBdate(null);
		//bvo.setBhit(4);
		bvo.setBtitle("테스트");
		bvo.setMember_id("a@naver.com");
		
		bservice.writeBoard(bvo);
	}
	
	@Test
	void contextLoads() {
		assertNotNull(bservice);
		log.info("vo test");
	}

}
