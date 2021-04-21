package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.security.MemberDetails;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class MenuController {

	@GetMapping("/menu/about")
	public ModelAndView about(ModelAndView mav,@AuthenticationPrincipal MemberDetails md) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		mav.setViewName("/menu/menu_about");
		
		return mav;
	}

	@GetMapping("/menu/way")
	public ModelAndView way(ModelAndView mav,@AuthenticationPrincipal MemberDetails md) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		mav.setViewName("/menu/menu_way");
		
		return mav;
	}
}
