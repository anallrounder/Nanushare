package com.share.nanu.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.page.Criteria;
import com.share.nanu.service.AdminPageService;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/admin/*")
public class AdminPageController {

	@Autowired
	private AdminPageService adminPgService;
	
	@GetMapping("/donation")
	public ModelAndView adminDM(ModelAndView mov, MemberVO member, Criteria cri) {
		
		mov.setViewName("admin/admin_main");
		mov.addObject("memberControl", adminPgService.getMember());
		
		return mov;
	}
	
	@GetMapping("/member_view")
	public ModelAndView member_view(ModelAndView mov, MemberVO member, Criteria cri) {
		
		mov.setViewName("admin/member_view");
		mov.addObject("memberView", adminPgService.getMemberView(member.getMember_id()));
		
		return mov;
	}
}