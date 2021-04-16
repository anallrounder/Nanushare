package com.share.nanu.controller;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.MemberPointVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.PointVO;
import com.share.nanu.mypaging.Criteria;
import com.share.nanu.mypaging.pageVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.MemberService;
import com.share.nanu.service.MyPageService;
import com.share.nanu.service.NanuDonationService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class MyPageController {

	@Autowired
	private MyPageService mgservice;

	@Autowired
	private MemberService mservice;

	@Autowired
	private NanuDonationService ndservice;

	@Autowired
	BCryptPasswordEncoder encoder;

	// 마이페이지
	@GetMapping("/my/mypage")
	public ModelAndView myPage(MemberPointVO mpvo, MemberVO mvo, ModelAndView mav,
			@AuthenticationPrincipal MemberDetails md) {

		System.out.println("마이페이지");
//HttpSession session = request.getSession(true);

		// 헤더에 로그인한 사람 정보 가져오기
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			// log.info("로그인한 사람 이름 - "+ md.getmember().getName());
			mav.addObject("username", md.getmember().getName());
		}
		mav.addObject("memberInfo", ndservice.getMemberPoint(mpvo));
		// mav.addObject("sign", mgservice.mysign(md.getmember().getSignuppath()));//추가
		mav.setViewName("/my/mypage");
		return mav;
	}

	// 1.나의문의내역
	@GetMapping("/my/ask")
	public ModelAndView myAsk(MemberVO mvo, ModelAndView mav, Criteria cri, @AuthenticationPrincipal MemberDetails md) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}

		// log.info(mvo.getMember_id().toString());
		mav.setViewName("/my/ask");
		System.out.println("1.나의문의내역 +" + md.getUsername());
		mav.addObject("list1", mgservice.myList1(cri, md.getUsername()));// 나의문의내역

		// 페이징
		int total = mgservice.getTotalCount1(cri, md.getUsername());
		mav.addObject("pageMaker", new pageVO(cri, total));
		return mav;
	}

	// 2.나의인증내역
	@GetMapping("/my/content")
	public ModelAndView myCon(MemberVO mvo, ModelAndView mav, Criteria cri, @AuthenticationPrincipal MemberDetails md) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		mav.setViewName("/my/content");

		// mgservice.mycontent(md.getUsername());
		// mav.addObject("memberid", md.getUsername(mvo));

		System.out.println("2.인증내역 +" + md.getUsername());
		mav.addObject("list2", mgservice.myList2(cri, md.getUsername()));// 나의인증내역

		// 페이징
		int total = mgservice.getTotalCount2(cri, md.getUsername());
		mav.addObject("pageMaker", new pageVO(cri, total));

		return mav;
	}

	// 3.나의나눔내역
	@GetMapping("/my/give")
	public ModelAndView myDona(MemberVO mvo, ModelAndView mav, Criteria cri,
			@AuthenticationPrincipal MemberDetails md) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		mav.setViewName("/my/give");

		// mav.addObject("mycon", md.getmember().getMember_id());//id만 넘겨줌
		// mav.addObject("mycon", md.getUsername());

		mav.addObject("list3", mgservice.myList3(cri, md.getUsername()));// 나의나눔내역
		// 페이징
		int total = mgservice.getTotalCount3(cri, md.getUsername());
		mav.addObject("pageMaker", new pageVO(cri, total));

		return mav;
	}

	// 4.나의댓글내역
	@GetMapping("/my/reply")
	public ModelAndView myReply(MemberVO mvo, ModelAndView mav, Criteria cri,
			@AuthenticationPrincipal MemberDetails md) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		mav.setViewName("/my/reply");
		mav.addObject("list4", mgservice.myList4(cri, md.getUsername()));// 나의문의내역
		// 페이징
		int total = mgservice.getTotalCount4(cri, md.getUsername());
		mav.addObject("pageMaker", new pageVO(cri, total));
		return mav;
	}

	// 5.나의결제내역
	@GetMapping("/my/pay")
	public ModelAndView myPay(MemberVO mvo, ModelAndView mav, Criteria cri, @AuthenticationPrincipal MemberDetails md) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		mav.setViewName("/my/pay");
		mav.addObject("list5", mgservice.myList5(cri, md.getUsername()));// 나의문의내역
		// 페이징
		int total = mgservice.getTotalCount5(cri, md.getUsername());

		mav.addObject("pageMaker", new pageVO(cri, total));
		return mav;
	}

	// 프로필 관리로 가는 페이지(수정 전 비밀번호 확인 단계)
	@GetMapping("/my/myprofile")
	public ModelAndView myprofPw(ModelAndView mav, @AuthenticationPrincipal MemberDetails md) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}

		log.info("프로필 페이지 비밀번호 확인 페이지 이동");
		mav.setViewName("/my/myprofile");
		return mav;
	}

	@PostMapping("/my/myprofile/check")
	public ResponseEntity<String> myprofPw(@AuthenticationPrincipal MemberDetails md, @RequestBody String pwConfirm,
			ModelAndView mav) {

		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		ResponseEntity<String> entity = null;

		try {
			System.out.println(pwConfirm);
			log.info("로그인한 회원의 비밀번호와 패스워드 칸에 입력한 비밀번호 일치하는지 확인");
			// mgservice.checkpw(md.getUsername());
			// System.out.println(md.getUsername());
			String password = md.getPassword(); // md.getmember.getPassword()

			System.out.println(encoder.matches(pwConfirm, password));
			// bCryptPasswordEncoder.matches("pwConfirm", password);
			if (pwConfirm != null && encoder.matches(pwConfirm, password) == true) { // 일치하면 true 리턴 불일치면 false
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} else if (pwConfirm != null && encoder.matches(pwConfirm, password) == false) {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
				System.out.println("실패");

			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;

	}

	@GetMapping("/my/myprofile/edit")
	public ModelAndView myprofEdit(@AuthenticationPrincipal MemberDetails md, ModelAndView mav) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		log.info("수정 페이지로 이동");
		mav.setViewName("/my/edit");

		return mav;
	}

	// 수정
	@PutMapping("/my/myprofile/edit/check")
	public ResponseEntity<String> myprofEdit(@RequestBody MemberVO mvo, @AuthenticationPrincipal MemberDetails md,
			ModelAndView mav) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		ResponseEntity<String> entity = null;

		try {
			mgservice.memberModifyPOST(mvo);
			log.info("수정된 회원정보 : " + mvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			// session.invalidate();
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}

	@GetMapping("/my/drop")
	public ModelAndView myprofDel(ModelAndView mav, @AuthenticationPrincipal MemberDetails md) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		log.info("탈퇴 페이지로 이동");
		mav.setViewName("/my/drop");
		return mav;
	}

	// 탈퇴
	@PostMapping("/my/drop/check")
	public ResponseEntity<String> myprofDel(ModelAndView mav, @AuthenticationPrincipal MemberDetails md,
			@RequestBody MemberVO mvo) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}

		ResponseEntity<String> entity = null;
		System.out.println("시험" + mvo);
		log.info("탈퇴체크페이지");
		try {
			mgservice.memberDelete(mvo, md);
			log.info("탈퇴된 회원정보 : " + mvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}

	@GetMapping("/deleteCooki")
	public void deleteCooki(@AuthenticationPrincipal MemberDetails md, ModelAndView mav, HttpServletResponse response,
			HttpServletRequest request, @CookieValue(value = "Nanushare_cooki", required = false) Cookie Nanushare,
			@CookieValue(value = "JSESSIONID", required = false) Cookie JSESSIONID) throws IOException {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}

		log.info("쿠키 삭제");
		// remember-me 쿠키인 Nanushare_cooki, 톰캣 쿠키인 JSESSIONID을제거
		// 새로고침이 필요하기 때문에 리다이렉트로 전달

		String redirect_url = "/main"; // 리다이렉트로 메인으로 이동할 주소

		if (Nanushare != null && JSESSIONID != null) { // 널체크
			System.out.println(Nanushare.getName());
			System.out.println(Nanushare.getValue());
			System.out.println(JSESSIONID.getName());
			System.out.println(JSESSIONID.getValue());

			JSESSIONID.setMaxAge(0);
			JSESSIONID.setSecure(true);
			JSESSIONID.setHttpOnly(true);
			JSESSIONID.setPath("/");
			response.addCookie(JSESSIONID);

			Nanushare.setMaxAge(0);
			Nanushare.setSecure(true);
			Nanushare.setHttpOnly(true);
			Nanushare.setPath("/");
			response.addCookie(Nanushare);
		}

		response.sendRedirect(redirect_url); // restcontroller는 response를 사용하여야 한다.

	}

	// 출석체크(event default)
	@GetMapping("/event/check")
	public ModelAndView attendance(ModelAndView mav) throws Exception {
		System.out.println("룰렛출첵페이지");
		mav.setViewName("/eventView/attendcheck");
		return mav;
	}

	// 이벤트 포인트 부여
	@PutMapping("/event/check/getpoint")
	public ResponseEntity<String> event(@RequestBody PointVO pointVO, @AuthenticationPrincipal MemberDetails md,
			ModelAndView mav) {

		System.out.println("이벤트룰렛 도나요");
		ResponseEntity<String> entity = null;
		try {
			int count = mgservice.mycount(pointVO, md.getUsername());
			log.info("count" + count);

			if (count >= 1) {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			} else {
				mgservice.getMypoint(pointVO, md.getUsername());
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

//	@PostMapping("/event/check/mypoint")
//	public ResponseEntity<List<Date>> mypoint(@RequestBody PointVO pointVO, @AuthenticationPrincipal MemberDetails md,
//			Model model) {
//
//		// final List<Date> list = mgse
//		List<Date> list = mgservice.getMypointList(pointVO, md.getUsername());
//		model.addAttribute("cal", pointVO);
//		return new ResponseEntity<List<Date>>(list, HttpStatus.OK);
//	}

	@GetMapping("/event/check3")
	public ModelAndView attendance1(ModelAndView mov) {
		System.out.println("그냥출첵페이지");
		
	
		mov.setViewName("/eventView/attendcheck3");
		return mov;
	}

	// 출첵 포인트 부여
	@PostMapping("/event/check3/getpoint")
	public ResponseEntity<String> event2(@RequestBody PointVO pointVO, @AuthenticationPrincipal MemberDetails md,
			ModelAndView mav) {

		System.out.println("이벤트출첵되나여");
		ResponseEntity<String> entity = null;
		try {
			int count = mgservice.mycount2(pointVO, md.getUsername());
			log.info("count" + count);
			log.info("id  " +  md.getUsername());

			if (count >= 1) {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			} else {
				mgservice.getMypoint2(pointVO, md.getUsername());
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}