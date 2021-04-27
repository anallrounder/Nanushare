package com.share.nanu.test;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

@AutoConfigureMockMvc
@SpringBootTest
public class mockControllerTest {
	
	@Autowired
	private MockMvc mockMvc;
	
	
	/*
	 * @Test public void signUpFormTest() throws Exception {
	 * 
	 * mockMvc.perform(MockMvcRequestBuilders.get("/loginPage").accept(MediaType.
	 * TEXT_HTML)) .andExpect(MockMvcResultMatchers.status().isOk())
	 * .andDo(MockMvcResultHandlers.print()); }
	 */

}
