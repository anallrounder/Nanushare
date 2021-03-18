package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.service.NanuService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class NanuController {

	@Autowired
	private NanuService nservice;

	@GetMapping("/mem")
	public ModelAndView name(ModelAndView mav, MemberVO mvo) {

		mav.setViewName("home");
		mav.addObject("list", nservice.memberList(mvo));
		return mav;
	}
	
	@GetMapping("/index")
	public String index() {
		return "charity/index";
	}
	
	@GetMapping("/login") //로그인 이동
	public ModelAndView login(ModelAndView mav) {
		mav.setViewName("/loginForm/Loginindex");
		return mav;
	}
	
	@GetMapping("/joinForm") //가입 이동
	public ModelAndView loginForm(ModelAndView mav) {
		mav.setViewName("/join");
		return mav;
	}

}
