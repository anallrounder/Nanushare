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

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class AccountController {

	@Autowired
	private MemberService mservice;

	@GetMapping("/signUpForm") // 가입페이지 이동
	public ModelAndView jointest(ModelAndView mav) {
		log.info("회원가입 폼으로 이동");
		mav.setViewName("/signUpForm/signUpForm");
		return mav;
	}

	@GetMapping({ "/", "" }) // 로그인 페이지
	public ModelAndView home(ModelAndView mav) {
		log.info("로그인 폼으로 이동");
		mav.setViewName("/loginForm/Loginindex");
		return mav;
	}

	@GetMapping("/member/logout") // 로그아웃
	public ModelAndView ologin(ModelAndView mav) {
		log.info("로그아웃");
		mav.setViewName("/loginForm/Loginindex");
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