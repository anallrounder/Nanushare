package com.share.nanu;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class NanuOracleConTest {
	
	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@220.72.76.172:1521:xe";
	private static final String user = "NANUSHARE";
	private static final String pw = "NANUSHARE";
	
	@Test
	void contextLoads() throws ClassNotFoundException {
		
		Class.forName(driver);
		
		try(Connection con = DriverManager.getConnection(url, user, pw)){
			log.info("DB 연결 SUCCESS");
		} catch(Exception e) {
			fail(e.getMessage());
		}
	}

}
