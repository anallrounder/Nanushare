package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.service.NanuService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class MenuController {

	@Autowired
	private NanuService nservice;

	@GetMapping("/menu/about")
	public ModelAndView about(ModelAndView mav) {

		mav.setViewName("/menu/menu_about");
		// mav.addObject("list", nservice.memberList(mvo));
		return mav;
	}

	@GetMapping("/menu/way")
	public ModelAndView way(ModelAndView mav) {

		mav.setViewName("/menu/menu_way");
		// mav.addObject("list", nservice.memberList(mvo));
		return mav;
	}
}
