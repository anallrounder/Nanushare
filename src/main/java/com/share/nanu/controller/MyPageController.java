package com.share.nanu.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.page.Criteria;
import com.share.nanu.page.pageVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.MemberService;
import com.share.nanu.service.MyPageService;
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
	BCryptPasswordEncoder encoder;

	// 마이페이지
	@GetMapping("/my/mypage")
	public ModelAndView myPage(MemberVO mvo, ModelAndView mav, @AuthenticationPrincipal MemberDetails md) {
		System.out.println("마이페이지");

		// 헤더에 로그인한 사람 정보 가져오기
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			// log.info("로그인한 사람 이름 - "+ md.getmember().getName());
			mav.addObject("username", md.getmember().getName());
		}
		mav.setViewName("/my/mypage");
		return mav;
	}

	// 나의문의내역
	@GetMapping("/my/ask")
	public ModelAndView myAsk(MemberVO mvo, ModelAndView mav, Criteria cri, @AuthenticationPrincipal MemberDetails md) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		mav.setViewName("/my/ask");
		mav.addObject("list1", mgservice.myList1(cri));// 나의문의내역

		// 페이징
		int total = mgservice.getTotalCount1(cri);
		mav.addObject("pageMaker", new pageVO(cri, total));
		return mav;
	}

	// 나의인증내역
	@GetMapping("/my/content")
	public ModelAndView myCon(MemberVO mvo, ModelAndView mav, Criteria cri, @AuthenticationPrincipal MemberDetails md) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		mav.setViewName("/my/content");
		mav.addObject("list2", mgservice.myList2(cri));// 나의인증내역
		// 페이징
		int total = mgservice.getTotalCount2(cri);
		mav.addObject("pageMaker", new pageVO(cri, total));
		return mav;
	}

	// 나의나눔내역
	@GetMapping("/my/give")
	public ModelAndView myDona(MemberVO mvo, ModelAndView mav, Criteria cri,
			@AuthenticationPrincipal MemberDetails md) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		mav.setViewName("/my/give");
		mav.addObject("list3", mgservice.myList3(cri));// 나의나눔내역
		// 페이징
		int total = mgservice.getTotalCount3(cri);
		mav.addObject("pageMaker", new pageVO(cri, total));

		return mav;
	}

	// 나의댓글내역
	@GetMapping("/my/reply")
	public ModelAndView myReply(MemberVO mvo, ModelAndView mav, Criteria cri,
			@AuthenticationPrincipal MemberDetails md) {
		if (md != null) {
			mav.addObject("username", md.getmember().getName());
		}
		mav.setViewName("/my/reply");
		mav.addObject("list4", mgservice.myList4(cri));// 나의문의내역
		// 페이징
		int total = mgservice.getTotalCount4(cri);
		mav.addObject("pageMaker", new pageVO(cri, total));
		return mav;
	}

	// https://melonpeach.tistory.com/49
	// 프로필 관리로 가는 페이지(수정 전 비밀번호 확인 단계)
	@GetMapping("/my/myprofile")
	public ModelAndView myprofPw(ModelAndView mav) {
		log.info("프로필 페이지 비밀번호 확인 페이지 이동");
		mav.setViewName("/my/myprofile");
		return mav;
	}

	@PostMapping("/my/myprofile/check")
	public ResponseEntity<String> myprofPw(@AuthenticationPrincipal MemberDetails md, @RequestBody String pwConfirm) {

		ResponseEntity<String> entity = null;

		try {
			System.out.println(pwConfirm);
			log.info("로그인한 회원의 비밀번호와 패스워드 칸에 입력한 비밀번호 일치하는지 확인");
			// mgservice.checkpw(md.getUsername());
			// System.out.println(md.getUsername());
			String password = md.getPassword(); // md.getmember.getPassword()

			System.out.println(encoder.matches(pwConfirm, password));
			// bCryptPasswordEncoder.matches("pwConfirm", password);
			if (encoder.matches(pwConfirm, password) == true) { // 일치하면 true 리턴 불일치면 false
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} else {
				System.out.println("실패");
				System.out.println();
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;

	}

	@GetMapping("/my/myprofile/edit")
	public ModelAndView myprofEdit(ModelAndView mav) {
		log.info("수정 페이지로 이동");
		mav.setViewName("/my/edit");

		return mav;
	}

	// 수정
	@PutMapping("/my/myprofile/edit/check")
	public ResponseEntity<String> myprofEdit(@RequestBody MemberVO mvo) {
		// public ResponseEntity<String> myprofileedit(@AuthenticationPrincipal
		// MemberDetails md, @RequestBody MemberVO mvo) {
		ResponseEntity<String> entity = null;

		try {
			mgservice.memberModifyPOST(mvo);
			log.info("수정된 회원정보 : " + mvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			// session.invalidate(); 세션날리고 다시 로그인해주세요 창띄우기
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}

	@GetMapping("/my/drop")
	public ModelAndView myprofDel(ModelAndView mav) {
		log.info("탈퇴 페이지로 이동");
		mav.setViewName("/my/drop");
		return mav;
	}

	// 탈퇴
	@PostMapping("/my/drop/check")
	public ResponseEntity<String> myprofDel(@AuthenticationPrincipal MemberDetails md, @RequestBody MemberVO mvo) {
		ResponseEntity<String> entity = null;
		System.out.println("시험" + mvo);
		log.info("탈퇴체크페이지");
		try {
			mgservice.mememberDelete(mvo, md);
			log.info("탈퇴된 회원정보 : " + mvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			// 세션날리고 다시 로그인해주세요 창띄우기

		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}

	
	@GetMapping("/deleteCooki")
	public void deleteCooki(ModelAndView mav, HttpServletResponse response, HttpServletRequest request
			,@CookieValue(value = "Nanushare_cooki", required = false ) Cookie Nanushare,
			@CookieValue(value = "JSESSIONID", required = false) Cookie JSESSIONID) throws IOException {
		log.info("쿠키 삭제");
		String redirect_url = "/main";
		//HttpSession session = request.getSession();
		if(Nanushare != null && JSESSIONID !=null ) {
			System.out.println(Nanushare.getName());
			System.out.println(Nanushare.getValue());
			System.out.println(JSESSIONID.getName());
			System.out.println(JSESSIONID.getValue());
			
			JSESSIONID.setMaxAge(0);
			JSESSIONID.setSecure(true);
			JSESSIONID.setHttpOnly(true);
			JSESSIONID.setPath("/");
			response.addCookie(JSESSIONID);
			
			//session.invalidate();
			Nanushare.setMaxAge(0);
			Nanushare.setSecure(true);
			Nanushare.setHttpOnly(true);
			Nanushare.setPath("/");
			response.addCookie(Nanushare);
		}
		/*
		 * Cookie cooki = new Cookie("Nanushare_cooki", null);
		 * System.out.println(cooki); cooki.setMaxAge(0); response.addCookie(cooki);
		 * 
		 * System.out.println(cooki);
		 */

		/*
		 * Cookie[] myCooki = request.getCookies(); if(mav != null) { for (int i = 0; i
		 * < myCooki.length; i++) { System.out.println(i + "번째 쿠키 이름: " +
		 * myCooki[i].getName()); System.out.println(i + "번째 쿠키 값: " +
		 * myCooki[i].getValue());
		 * 
		 * if (myCooki[i].getName() == "Nanushare_cooki") { myCooki[i].setMaxAge(0);
		 * response.addCookie(myCooki[i]); System.out.println("Nanushare_cooki삭제");
		 * break; } else { System.out.println("Nanushare_cooki가 없습니다."); }
		 * 
		 * } }
		 */
		
		response.sendRedirect(redirect_url);
		//mav.setViewName("/mainMap/mainContent");
		//return "redirect:mainMap/mainContent";
	}

}