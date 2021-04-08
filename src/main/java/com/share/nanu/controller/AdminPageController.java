package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.AdminItemOutVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.paging.Criteria;
import com.share.nanu.paging.PageVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.AdminPageService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
@RequestMapping("/admin/*")
public class AdminPageController {

	@Autowired
	private AdminPageService adminPgService;
	
	// 관리자 페이지 메인 디폴트(후원금관리-통계)
	@GetMapping("/donation")
	public ModelAndView adminDM (ModelAndView mov, MemberVO member, Criteria cri, @AuthenticationPrincipal MemberDetails md) throws Exception {

		// @AuthenticationPrincipal MemberDetails md 유저정보 가져오기
	
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			mov.addObject("username", md.getmember().getName());
		}
		
		mov.setViewName("admin/admin_main");
		//mov.addObject("memberControl", adminPgService.getMember());
		mov.addObject("item", adminPgService.getHeadItem()); //본사 물품 조회(iteminven)
		mov.addObject("vm", adminPgService.getvm()); // vm 지점명 조회
		mov.addObject("vvam", adminPgService.getBranchItem()); //지점 물품 조회 (vm + vmam)
		
		return mov;
	}
	
	// 회원관리-조회
	@GetMapping("/member")
	public ModelAndView memberControl(ModelAndView mov, MemberVO member, Criteria cri, @AuthenticationPrincipal MemberDetails md) {
		
		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}
		
		mov.setViewName("admin/admin_member");
		mov.addObject("memberControl", adminPgService.getMember(cri)); 

		// 페이징
		int total = adminPgService.getTotalCount(cri);
		mov.addObject("pageMaker", new PageVO(cri, total));
		
		return mov;
	}

	// 회원관리(회원한명당 조회)
	@GetMapping("/member_view")
	public ModelAndView member_view(ModelAndView mov, MemberVO member, @AuthenticationPrincipal MemberDetails md) throws Exception {
		
		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}
		
		mov.setViewName("admin/admin_memberView");
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
	
	
	// 재고관리-본사 재고 조회
	@GetMapping("/headItem") 
	public ModelAndView headItem (ModelAndView mov, MemberVO member, @AuthenticationPrincipal MemberDetails md) {

		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}
		
		log.info("headItem start");
		
		mov.setViewName("admin/admin_headItem");
		mov.addObject("item", adminPgService.getHeadItem()); //본사 물품 조회(iteminven)
		mov.addObject("vm", adminPgService.getvm()); // vm 지점명 조회
	  
		return mov;
	}
	
	// 재고관리-지점 재고 조회
	@GetMapping("/branchItem") 
	public ModelAndView branchItem (ModelAndView mov, MemberVO member, @AuthenticationPrincipal MemberDetails md) {
		
		if (md != null) { 
			mov.addObject("username", md.getmember().getName());
		}
		
		log.info("branchItem start");
			
		mov.setViewName("admin/admin_branchItem");
		mov.addObject("vvam", adminPgService.getBranchItem()); //지점 물품 조회 (vm + vmam)
		  
		return mov;
	}
	 
	// 재고관리-본사 입고 업데이트 -> post으로 비꿔야 url이 좀 깔끔할것같은데 시간되면 방법 찾아보기
	@PostMapping("/itemupdate") 
	public String itemHeadUp (@RequestParam("inputData") int[] iamount, @RequestParam("icat_num") int[] icat_num) {
		
		// jsp에서 값이 어떻게 나오는지 확인하기 위한 작업 -> 배열로 넘어옴 & db에서 값이 int였는데 String으로 계속 변수 타입을 지정해서 처음에 안넘어간것 배열을 써주지않으면 하나의값만 불러옴
		for(int i = 0; i < iamount.length; i++ ) {
			log.info(String.valueOf(iamount[i]));
		}
		
		adminPgService.itemHeadUp(iamount, icat_num);
		log.info("입고 업데이트");
		
	  return "redirect:/admin/headItem"; 
	
	}
	
	//재고관리-본사 출고 업데이트 -> put으로 바꿔야 url이 좀 깔끔할것같은데 시간되면 방법 찾아보기
	@PostMapping("/itemOutupdate")
	public String itemHeadOut (AdminItemOutVO adoutvo) { // 받는 값을 하나의 command객체로 만들어서 담은 다음 호출함(join x)
		
		adminPgService.itemOut(adoutvo);
		log.info("출고 업데이트");
		
		return "redirect:/admin/headItem"; 
		
	}
	 
	
}