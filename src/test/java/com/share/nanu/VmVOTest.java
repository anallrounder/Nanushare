package com.share.nanu;

import static org.junit.Assert.assertNotNull;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.share.nanu.VO.VmVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class VmVOTest {
	
	
	// 주입
	private String vm_num = "s111";
	private String lat = "37.5700928"; 
	private String lng = "126.9835591"; 
	private String branch ="종각역점";
	
	VmVO vmVO = new VmVO(vm_num, lat, lng, branch);
	
	
	@Test
	void contextLoads() {
		assertNotNull(vmVO);
		log.info("vo test");
		
	}

}
