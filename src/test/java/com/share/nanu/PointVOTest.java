package com.share.nanu;

import static org.junit.Assert.assertNotNull;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import com.share.nanu.VO.PointVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class PointVOTest {
	
	
	// 주입
	private int pnt_num = 1000;
	private String member_id = "abcd@naver.com"; 
	private int prtpnt = 5; 
	private int dntpnt = 6;
	private int totalpnt = 100; 
	private int nowpnt = 50;
	private int ecat_num = 3; 
	
	PointVO pointVO = new PointVO(pnt_num, member_id, null, prtpnt, dntpnt, totalpnt,
			 nowpnt, ecat_num, dntpnt);
	
	
	@Test
	void contextLoads() {
		assertNotNull(pointVO);
		log.info("vo test");
		
	}

}
