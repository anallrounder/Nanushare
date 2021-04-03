package com.share.nanu.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.page.Criteria;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.AdminPageService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/admin/*")
public class AdminPageController {

	@Autowired
	private AdminPageService adminPgService;
	
	// 관리자 페이지 메인 디폴트(후원금관리-통계)
	@GetMapping("/donation")
	public ModelAndView adminDM(ModelAndView mov, MemberVO member, Criteria cri,
			@AuthenticationPrincipal MemberDetails md) throws Exception {

		// @AuthenticationPrincipal MemberDetails md 유저정보 가져오기
	
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			
			mov.addObject("username", md.getmember().getName());
		}
		
		mov.setViewName("admin/admin_main");
		mov.addObject("memberControl", adminPgService.getMember());
		mov.addObject("item", adminPgService.getHeadItem()); //본사 물품 조회(iteminven)
		mov.addObject("vm", adminPgService.getvm()); // vm 지점명 조회
		mov.addObject("vvam", adminPgService.getBranchItem()); //지점 물품 조회 (vm + vmam)
		
		return mov;
	}
	
	//dateppicker
		@GetMapping("/date")
		public ModelAndView date(ModelAndView mov, MemberVO member, Criteria cri) {
			
			mov.setViewName("admin/datepicker");
			
			return mov;
		}
	
	//회원관리, 재고관리
	@GetMapping("/member_view")
	public ModelAndView member_view(ModelAndView mov, MemberVO member, Criteria cri) {
		
		mov.setViewName("admin/member_view");
		mov.addObject("memberView", adminPgService.getMemberView(member.getMember_id()));
		
		
		return mov;
	}
	
}