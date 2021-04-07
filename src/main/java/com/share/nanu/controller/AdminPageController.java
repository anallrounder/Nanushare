package com.share.nanu.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.AdminItemOutVO;
import com.share.nanu.VO.ItemInvenVmamVO;
import com.share.nanu.VO.IteminvenVO2;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.page.Criteria;
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
		mov.addObject("memberControl", adminPgService.getMember());
		mov.addObject("item", adminPgService.getHeadItem()); //본사 물품 조회(iteminven)
		mov.addObject("vm", adminPgService.getvm()); // vm 지점명 조회
		mov.addObject("vvam", adminPgService.getBranchItem()); //지점 물품 조회 (vm + vmam)
		
		return mov;
	}

	//회원관리
	@GetMapping("/member_view")
	public ModelAndView member_view(ModelAndView mov, MemberVO member, Criteria cri) {
		
		mov.setViewName("admin/member_view");
		mov.addObject("memberView", adminPgService.getMemberView(member.getMember_id()));
		
		
		return mov;
	}
	
	//재고관리 조회
	@GetMapping("/item") 
	public ModelAndView item (ModelAndView mov, MemberVO member) {
		log.info("item start");
		
		mov.setViewName("admin/admin_item");
		mov.addObject("item", adminPgService.getHeadItem()); //본사 물품 조회(iteminven)
		mov.addObject("vm", adminPgService.getvm()); // vm 지점명 조회
		mov.addObject("vvam", adminPgService.getBranchItem()); //지점 물품 조회 (vm + vmam)
	  
		return mov;
	}
	 
	//본사 입고 업데이트 -> post으로 비꿔야 url이 좀 깔끔할것같은데 시간되면 방법 찾아보기
	@GetMapping("/itemupdate") 
	public String itemHeadUp (@RequestParam("inputData") int[] iamount, @RequestParam("icat_num") int[] icat_num) {
		
		// jsp에서 값이 어떻게 나오는지 확인하기 위한 작업 -> 배열로 넘어옴 & db에서 값이 int였는데 String으로 계속 변수 타입을 지정해서 처음에 안넘어간것 배열을 써주지않으면 하나의값만 불러옴
		for(int i = 0; i < iamount.length; i++ ) {
			log.info(String.valueOf(iamount[i]));
		}
		
		adminPgService.itemHeadUp(iamount, icat_num);
		log.info("입고 업데이트");
		
	  return "redirect:/admin/donation"; 
	
	}
	
	//본사 출고 업데이트 -> put으로 바꿔야 url이 좀 깔끔할것같은데 시간되면 방법 찾아보기
	@GetMapping("/itemOutupdate")
	public String itemHeadOut (AdminItemOutVO adoutvo) { // 받는 값을 하나의 command객체로 만들어서 담은 다음 호출함
		
		for(int i = 0; i < adoutvo.getOutputData().length; i++) {
			log.info(String.valueOf(adoutvo.getIcat_num()[i])); // 본사 재고에서 수량 빼기 update
			log.info(String.valueOf(adoutvo.getOutputData()[i]));
			//adminMapper.itemVmam(adoutvo.getVm_num()[i], adoutvo.getOutputData()[i], adoutvo.getIname()[i]); // vmam 자판기에 수량 업데이트
			log.info("-------------자판기번호------------");
			log.info(String.valueOf(adoutvo.getVm_num()[i]));
			log.info("-------------지점명------------");
			log.info(String.valueOf(adoutvo.getBranch()[i]));
			log.info("-------------물품명------------");
			log.info(String.valueOf(adoutvo.getIname()[i]));
			log.info("-------------날짜------------");
			log.info(String.valueOf(adoutvo.getOutDate()[i]));
		
		}
		
		adminPgService.itemOut(adoutvo);
		log.info("출고 업데이트");
		
		return "redirect:/admin/donation"; 
		
	}
	 
	
}