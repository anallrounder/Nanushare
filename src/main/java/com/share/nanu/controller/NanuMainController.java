package com.share.nanu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.AdminPageService;
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
		if(md != null) { //로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			 
			log.info("로그인한 사람 이름 - "+ md.getmember().getName());
			mov.addObject("username",md.getmember().getName());
		}
		

		SimpleDateFormat yy = new SimpleDateFormat("yyyy");
		SimpleDateFormat mm = new SimpleDateFormat("MM"); /* 소문자 mm로 쓰면 달로 표기되는게 아니라 시간으로 읽혀서 month처리 할때는 MM를 사용해야함 */
		SimpleDateFormat dd = new SimpleDateFormat("dd");

		Date time = new Date(); // 날짜 계산을 위해 Date형식으로 형변환

		String year = yy.format(time);
		String month = mm.format(time);
		String day = dd.format(time);

		log.info("오늘날짜: " + year + "년 " + month + "월 " + day + "일");

		mov.addObject("year", year);
		mov.addObject("month", month);
		mov.addObject("day", day);

		mov.addObject("dailySale", mainService.getDailySales(year, month, day)); // 일별
		mov.addObject("monthSale", mainService.getMonthSales(year, month)); // 월별
		mov.addObject("yearSale", mainService.getYearSales(year)); // 년별
		
		System.out.println("뭔데에에에에에" + mainService.getDailySales(year, month, day));

		mov.setViewName("mainMap/mainContent"); 
		mov.addObject("mapvm", mainService.getvm()); // vm, vmam VO
		return mov;
	}
	
	//지도윈포윈도우 처음으로 call하는 함수
	@RequestMapping("/vm/info")
	@ResponseBody
	public Map<String, Object> vmInfos() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", mainService.getvm());
		return map; 
	}
	
	//실시간으로 DB 현황 call하는 함수
	@RequestMapping("/vm/item/info")
	@ResponseBody
	public Map<String, Object> vmItemInfos(@RequestParam("vmNum") String vmNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("iteminfo", mainService.getVmItem(vmNum));
		return map; 
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
	public String sendQR (@PathVariable String vm_num, @PathVariable String iname, Model model) throws Exception {//@RequestParam String machine, @RequestParam String item
		
		//수량 체크
		int remainAmount = mainService.vmCount(vm_num, iname);
		
		if (remainAmount < 2) {
			model.addAttribute("message", "잔여 수량이 부족합니다.");
			model.addAttribute("success", false);
		} else {
			//수량 2개씩 빼는 함수
			mainService.itemOut(vm_num,iname);
			model.addAttribute("message", "물품이 나왔습니다.");
			// insert 쿼리 필요 어떤회원이 가져갔는지 추가
			model.addAttribute("success", true);
		}

		return "mainMap/itemoutResult";
	}
	
	
	

}
