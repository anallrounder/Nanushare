package com.share.nanu.controller;

import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class AccountController {

	@Autowired
	private MemberService mservice;

	@GetMapping("/user")
	public @ResponseBody String user(@AuthenticationPrincipal MemberDetails memberDetails) {
		System.out.println("Principal : " + memberDetails);
		System.out.println("OAuth2 : " + memberDetails.getmember().getSignuppath());
		// iterator 순차 출력 해보기
		Iterator<? extends GrantedAuthority> iter = memberDetails.getAuthorities().iterator();
		while (iter.hasNext()) {
			GrantedAuthority auth = iter.next();
			System.out.println(auth.getAuthority());
		}

		return "유저 페이지입니다.";
	}

	@GetMapping({ "/", "" }) // 로그인 페이지
	public ModelAndView home(ModelAndView mav) {
		log.info("로그인 폼으로 이동");
		mav.setViewName("/loginForm/Loginindex");
		return mav;
	}

	@GetMapping("/member/slogin") // 로그인성공
	public ModelAndView slogin(ModelAndView mav) {
		log.info("로그인 성공");
		;
		mav.setViewName("/slogin");
		return mav;
	}

	@GetMapping("/member/logout") // 로그아웃
	public ModelAndView ologin(ModelAndView mav) {
		log.info("로그아웃");
		mav.setViewName("/loginForm/Loginindex");
		return mav;
	}

	@GetMapping("/joinForm") // 회원가입 이동
	public ModelAndView loginForm(ModelAndView mav) {
		log.info("회원가입 폼으로 이동");
		mav.setViewName("/join");
		return mav;
	}

	@PostMapping("/memberJoin") // 회원 가입처리
	public ResponseEntity<String> memberJoin(@RequestBody MemberVO mvo) {
		log.info("회원 가입 처리");
		ResponseEntity<String> entity = null;

		try {
			mservice.addMember(mvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}

}