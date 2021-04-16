package com.share.nanu.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	// 후원금 관리 - 통계
	@GetMapping("/stat")
	public ModelAndView adminDonationStat(ModelAndView mov, @AuthenticationPrincipal MemberDetails md)
			throws Exception {

		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}

		SimpleDateFormat yy = new SimpleDateFormat("yyyy");
		SimpleDateFormat mm = new SimpleDateFormat("MM"); /* 소문자 mm로 쓰면 달로 표기되는게 아니라 시간으로 읽혀서 month처리 할때는 MM를 사용해야함 */
		SimpleDateFormat dd = new SimpleDateFormat("dd");

		Date time = new Date(); // 날짜 계산을 위해 Date형식으로 형변환

		// Calendar cal = Calendar.getInstance();
		// cal.add(Calendar.YEAR, -1); //작년

		String year = yy.format(time);
		// String lastyear = y.format(cal.getTime());
		String month = mm.format(time);
		String day = dd.format(time);

		log.info("오늘날짜: " + year + "년 " + month + "월 " + day + "일");

		mov.addObject("year", year);
		mov.addObject("month", month);
		mov.addObject("day", day);

		mov.addObject("dailySale", adminPgService.getDailySales(year, month)); // 일별
		mov.addObject("monthSale", adminPgService.getMonthSales(year)); // 월별
		mov.addObject("yearSale", adminPgService.getYearSales(year)); // 년별

		log.info("년별통계 금액: " + adminPgService.getYearSales(year));
		mov.setViewName("admin/admin_stat");

		return mov;
	}

	// 회원관리-조회
	@GetMapping("/member")
	public ModelAndView memberControl(ModelAndView mov, MemberVO member, Criteria cri,
			@AuthenticationPrincipal MemberDetails md) {

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

	// 재고관리-본사 재고 조회
	@GetMapping("/headItem")
	public ModelAndView headItem(ModelAndView mov, MemberVO member, @AuthenticationPrincipal MemberDetails md) {

		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}

		log.info("headItem start");

		mov.setViewName("admin/admin_headItem");
		mov.addObject("item", adminPgService.getHeadItem()); // 본사 물품 조회(iteminven)
		mov.addObject("vm", adminPgService.getvm()); // vm 지점명 조회

		return mov;
	}

	// 재고관리-지점 재고 조회
	@GetMapping("/branchItem")
	public ModelAndView branchItem(ModelAndView mov, MemberVO member, @AuthenticationPrincipal MemberDetails md) {

		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}

		log.info("branchItem start");

		mov.setViewName("admin/admin_branchItem");
		mov.addObject("vvam", adminPgService.getBranchItem()); // 지점 물품 조회 (vm + vmam)

		return mov;
	}

	// 재고관리-본사 입고 업데이트 -> post으로 비꿔야 url이 좀 깔끔할것같은데 시간되면 방법 찾아보기
	@PostMapping("/itemupdate")
	public String itemHeadUp(@RequestParam("inputData") int[] iamount, @RequestParam("icat_num") int[] icat_num) {

		// jsp에서 값이 어떻게 나오는지 확인하기 위한 작업 -> 배열로 넘어옴 & db에서 값이 int였는데 String으로 계속 변수 타입을
		// 지정해서 처음에 안넘어간것 배열을 써주지않으면 하나의값만 불러옴
		for (int i = 0; i < iamount.length; i++) {
			log.info(String.valueOf(iamount[i]));
		}

		adminPgService.itemHeadUp(iamount, icat_num);
		log.info("입고 업데이트");

		return "redirect:/admin/headItem";

	}

	// 재고관리-본사 출고 업데이트 -> put으로 바꿔야 url이 좀 깔끔할것같은데 시간되면 방법 찾아보기
	@PostMapping("/itemOutupdate")
	public String itemHeadOut(AdminItemOutVO adoutvo) { // 받는 값을 하나의 command객체로 만들어서 담은 다음 호출함(join x)

		adminPgService.itemOut(adoutvo);
		log.info("출고 업데이트");

		return "redirect:/admin/headItem";

	}
	
	// test
	@GetMapping("/temp")
	@ResponseBody
	public Map<Integer, Integer> temp(@RequestParam(value = "month") Integer month) {
		log.info("month : ", month);
		return adminPgService.getDailySales("2021", String.valueOf(month));
	}

}