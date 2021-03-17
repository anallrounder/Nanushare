package com.share.nanu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.service.NanuService;


@Controller
public class NanuController {
	
	private NanuService nservice;
	
	@GetMapping("/mem")
	public ModelAndView name(ModelAndView mav,MemberVO mvo) {
		mav.setViewName("home");
		mav.addObject("list", nservice.memberList(mvo));
		return mav;
	}
	
	

}
