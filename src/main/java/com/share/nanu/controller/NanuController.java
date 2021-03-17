package com.share.nanu.controller;

import org.apache.logging.slf4j.SLF4JLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.service.NanuService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
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

}
