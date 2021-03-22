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

	
	@GetMapping("/index") //메인페이지
	public String index() {
		return "charity/index";
	}
	
	@GetMapping("/login") //로그인 페이지
	public ModelAndView login(ModelAndView mav) {
		mav.setViewName("/loginForm/Loginindex");
		return mav;
	}
	
	@GetMapping("/member/slogin")//로그인성공
	public ModelAndView slogin(ModelAndView mav) {
		mav.setViewName("/slogin");
		return mav;
	}
	
	@GetMapping("/member/logout")//로그아웃
	public ModelAndView ologin(ModelAndView mav) {
		mav.setViewName("/logout");
		return mav;
	}
	
	@GetMapping("/denied")//접근거부
	public ModelAndView denied(ModelAndView mav) {
		mav.setViewName("/denied");
		return mav;
	}
	
	
	@GetMapping("/joinForm") //회원가입 이동
	public ModelAndView loginForm(ModelAndView mav) {
		mav.setViewName("/join");
		return mav;
	}
	
	@PostMapping("/memberJoin")//가입처리
	public ResponseEntity<String> memberJoin(@RequestBody MemberVO mvo) {
		ResponseEntity<String> entity = null;
		
		try {
			mservice.addMember(mvo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	
	
		

}
