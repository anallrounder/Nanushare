package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.share.nanu.VO.Vmam;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.MainService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
//RestContoller는 디폴트로 json을 넘겨줄 때 사용하기 때문에 ModelAndView를 사용해야 하고 함수 리턴타입을 String으로 주고 return하게되면 .jsp파일로 이동하지 않고 문자열이 출력되게 된다. 따라서 String 리턴타입으로 페이지 이동을 시킬거라면 @Controller 사용할것
//@Controller는 @ResponseBody를 사용해 json형태의 데이터 반환, @RestController는 @ResponseBody포함
public class NanuMainController {
	
	@Autowired
	private MainService mainService;
	
	// 메인페이지
	@RequestMapping("/main")
	public ModelAndView nanumain(ModelAndView mov ,@AuthenticationPrincipal MemberDetails md) throws Exception {
		//@AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		/* model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); */
		if(md!=null) { //로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - "+ md.getmember().getName());
			mov.addObject("username",md.getmember().getName());
		}
		mov.setViewName("mainMap/mainview"); 

		
		mov.setViewName("mainMap/mainContent"); 
		/* mov.setViewName("test"); */
		mov.addObject("daymoney", mainService.getMoney()); // 당일 후원 금액 로그기록(통계)
		//mov.addObject("weekmoney", mainService.getWeekMoney()); 
		mov.addObject("mapvm", mainService.getvm()); // vm, vmam VO
		return mov;
	}
	
	//오프라인 기계 실시간 test
	@RequestMapping("/machine")
	public ModelAndView offlineVm (ModelAndView mov) throws Exception {
		mov.setViewName("mainMap/vm"); 
		mov.addObject("vmcat", mainService.getvmcat()); //vm 종류(카테고리)
		mov.addObject("vminven", mainService.getvminven());
		return mov;
	}
	
	// QR로 수량 빼기
	@GetMapping("/sendQR/{vm_num}/{iname}")  //객체를 전달받기 때문에 POST(?), json ->controller 일땐 post?
	public String sendQR (@PathVariable String vm_num, @PathVariable String iname) throws Exception {//@RequestParam String machine, @RequestParam String item
		
		mainService.itemOut(vm_num,iname);
		
		return "mainMap/itemoutSuccess";
	}
	
	
	

}
