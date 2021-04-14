package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.paging.Criteria;
import com.share.nanu.paging.PageVOtest;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.AdminPageService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
@RequestMapping("/admin/*")
public class AdminMemberController {

	@Autowired
	private AdminPageService adminPgService;
	
	
	// 회원관리(회원한명당 조회)
	@GetMapping("/member_view")
	public ModelAndView member_view(ModelAndView mov, MemberVO member, @AuthenticationPrincipal MemberDetails md) throws Exception {
			
		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}
			
		mov.setViewName("admin/member/memberView");
		mov.addObject("memberView", adminPgService.getMemberView(member.getMember_id()));
			
		log.info(member.getMember_id());
			
		return mov;
	}
	
	// 회원관리(블랙리스트 변경)
	@PostMapping("/member_bk")
	public String member_bk(MemberVO member) throws Exception {
		
		log.info(member.getMember_id().toString());
		
		adminPgService.upBkCheck(member.getBklist(), member.getMember_id());
		log.info("블랙리스트 업데이트");
			
		return "redirect:/admin/member";
	}
	
	// 회원관리(물품기부내역)
	@GetMapping("/member/itemdona")
	public ModelAndView memberItemDona(ModelAndView mov, MemberVO member, @AuthenticationPrincipal MemberDetails md, Criteria cri) throws Exception {
				
		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}
		
		log.info("물품기부내역 시작");
		log.info(member.getMember_id());
				
		mov.setViewName("admin/member/memberItem");
		mov.addObject("itemDona", adminPgService.getMemberItem(member.getMember_id(), cri));
			
		// 페이징
		int total = adminPgService.getItemCount(member.getMember_id(), cri);
		mov.addObject("pageMaker", new PageVOtest(cri, total, member.getMember_id()));
			
		return mov;
	}
	
	// 회원관리(돈기부여내역)
	@GetMapping("/member/moneydona")
	public ModelAndView memberMoneyDona(ModelAndView mov, MemberVO member, @AuthenticationPrincipal MemberDetails md, Criteria cri) throws Exception {
					
		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}
			
		log.info("돈기부여 내역 시작");
		log.info(member.getMember_id());
					
		mov.setViewName("admin/member/memberMoney");
		mov.addObject("moneyDona", adminPgService.getMemberMoney(member.getMember_id(), cri));
				
		// 페이징
		int total = adminPgService.getMoneyCount(member.getMember_id(), cri);
		mov.addObject("pageMaker", new PageVOtest(cri, total, member.getMember_id()));
				
		return mov;
	}
	
	// 회원관리(포인트내역)
	@GetMapping("/member/point")
	public ModelAndView memberPoint(ModelAndView mov, MemberVO member, @AuthenticationPrincipal MemberDetails md, Criteria cri) throws Exception {
						
		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}
				
		log.info("포인트 내역 시작");
		log.info(member.getMember_id());
						
		mov.setViewName("admin/member/memberPoint");
		mov.addObject("point", adminPgService.getMemberPoint(member.getMember_id(), cri));
					
		// 페이징
		int total = adminPgService.getPointCount(member.getMember_id(), cri);
		mov.addObject("pageMaker", new PageVOtest(cri, total, member.getMember_id()));
					
		return mov;
	}
	// 회원관리(문의내역)
	@GetMapping("/member/qna")
	public ModelAndView memberQnA(ModelAndView mov, MemberVO member, @AuthenticationPrincipal MemberDetails md, Criteria cri) throws Exception {
							
		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}
					
		log.info("문의 내역 시작");
		log.info(member.getMember_id());
							
		mov.setViewName("admin/member/memberQnA");
		mov.addObject("qna", adminPgService.getMemberQnA(member.getMember_id(), cri));
						
		// 페이징
		int total = adminPgService.getQnACount(member.getMember_id(), cri);
		mov.addObject("pageMaker", new PageVOtest(cri, total, member.getMember_id()));
						
		return mov;
	}

	
	
}