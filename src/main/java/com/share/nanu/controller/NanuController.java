package com.share.nanu.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.service.MemberService;
import com.share.nanu.service.NanuService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class NanuController {

	@Autowired
	private NanuService nservice;

	@Autowired
	private MemberService mservice;
	
	@GetMapping({"/",""})
	public ModelAndView home(ModelAndView mav) {
		mav.setViewName("/index");
		return mav;
	}

	@GetMapping("/login") // 로그인 페이지
	public ModelAndView login(ModelAndView mav) {
		log.info("로그인 폼으로 이동");
		mav.setViewName("/loginForm/Loginindex");
		return mav;
	}

	@GetMapping("/member/slogin") // 로그인성공
	public ModelAndView slogin(ModelAndView mav) {
		log.info("로그인 성공");
	;	mav.setViewName("/slogin");
		return mav;
	}
	

	@GetMapping("/member/logout") // 로그아웃
	public ModelAndView ologin(ModelAndView mav) {
		log.info("로그아웃");
		mav.setViewName("/");
		return mav;
	}

	@GetMapping("/joinForm") // 회원가입 이동
	public ModelAndView loginForm(ModelAndView mav) {
		log.info("회원가입 폼으로 이동");
		mav.setViewName("/join");
		return mav;
	}

	@PostMapping("/memberJoin") // 회원 가입처리
	public ResponseEntity<String> memberJoin(@RequestBody MemberVO mvo) {
		log.info("회원 가입 처리");
		ResponseEntity<String> entity = null;

		try {
			mservice.addMember(mvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}

}
