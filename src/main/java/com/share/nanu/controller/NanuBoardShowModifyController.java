//혜선 인증게시판 컨트롤러 작성 03.22_화ㅣ
// https://www.tutorialrepublic.com/twitter-bootstrap-button-generator.php
package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.NanuBoardShowYSService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
//https://kyuhyuk.kr/article/spring-boot/2020/07/21/Spring-Boot-JPA-MySQL-Board-Post-Update-Delete

@Slf4j
@AllArgsConstructor
@RestController
public class NanuBoardShowModifyController {

	@Autowired
	private NanuBoardShowYSService service;
	
	@PutMapping("/board/shows/modify/{b_index}")
	public ResponseEntity<String> bsModify(@RequestBody BoardVO boardVO) throws Exception {
		log.info("인증게시판 컨트롤러  -- modify() -- 호출");
		
		ResponseEntity<String> entity = null;
		
		try {
			service.modifyBoard(boardVO); //수정 업데이트
			
	        entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	        
	      }catch(Exception e){
	         e.printStackTrace();
	         entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	      }
		
		return entity;  
	}
	
}
