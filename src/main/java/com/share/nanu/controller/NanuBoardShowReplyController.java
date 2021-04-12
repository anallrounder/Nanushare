//혜선 인증게시판 컨트롤러 작성 03.22_화ㅣ
// https://www.tutorialrepublic.com/twitter-bootstrap-button-generator.php
package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
//@RequestMapping("/board/shows/*")
public class NanuBoardShowReplyController {

	@Autowired
	private NanuBoardShowYSService service;

	// 컨텐트뷰 + 댓글 보기
	
	@GetMapping("/board/shows/content_view/{b_index}") 
	public ModelAndView content_view(BoardVO boardVO, BoardreplyVO rvo, ModelAndView mav, @AuthenticationPrincipal MemberDetails md) throws Exception {
		log.info("controller -- content_view -- 호출");
		service.uphit(boardVO);
		
		mav.setViewName("board_show/yourSupportContent"); // 이동할 웹페이지 주소
		
		mav.addObject("content_view", service.getBoard(boardVO.getB_index())); //게시판 글 불러오기
		log.info("컨텐트 뷰 테스트 BordVO.getB_index()= " + boardVO.getB_index()); //확인
		
		mav.addObject("listComment", service.listComment(rvo)); //게시판글의 댓글 리스트 불러오기
		log.info("컨트롤러 댓글 리스트 테스트 service.listComment(rvo)= " + rvo); //확인
		
		// @AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		// model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); 
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			mav.addObject("username", md.getmember().getName());
		}
		
		return mav;
	}
	
	
	// 댓글 입력 insert
	// [Spring] ResponseEntity는 왜 쓰는 것이며 어떻게 쓰는걸까? https://a1010100z.tistory.com/106
	@PostMapping("board/shows/reply_insert") 
	public ResponseEntity<String> reply_insert(@RequestBody BoardreplyVO rvo, BoardreplyVO replyVO, BoardVO boardVO, Model model) {
		System.out.println(rvo);
		
		ResponseEntity<String> entity = null;
		log.info("reply_insert");
		try {
			service.insertReply(rvo); //댓글 입력
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
