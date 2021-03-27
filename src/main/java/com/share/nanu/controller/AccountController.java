package com.share.nanu.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.MemberVO;
import com.share.nanu.service.MemberService;
import com.share.nanu.service.NanuService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
public class AccountController {

	@Autowired
	private MemberService mservice;

	private NanuService nservice;

	@GetMapping("/signUpForm") // 가입페이지 이동
	public ModelAndView jointest(ModelAndView mav) {
		log.info("회원가입 폼으로 이동");
		mav.setViewName("/signUpForm/signUpForm");
		return mav;
	}

	@GetMapping({ "/", "" }) // 로그인 페이지
	public ModelAndView home(ModelAndView mav) {
		log.info("로그인 폼으로 이동");
		mav.setViewName("/loginForm/Loginindex");
		return mav;
	}

	@GetMapping("/member/logout") // 로그아웃
	public ModelAndView ologin(ModelAndView mav) {
		log.info("로그아웃");
		mav.setViewName("/loginForm/Loginindex");
		return mav;
	}

	@PostMapping("/memberJoin") // 회원 가입처리
	public ResponseEntity<String> memberJoin(@RequestBody MemberVO mvo) {
		// get은 body가 존재하지 않기때문에 requestBody는 post만 사용가능
		// @RequestBody는 POST방식으로 Json의 형태로 넘겨온 데이터를 객체로 바인딩하기 위해 사용할 수 있다.
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

	@GetMapping("/IdCheck")
	public void IdCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		log.info("중복 이메일 체크");
		response.setContentType("application/json"); // 응답을 줄때 타입은 json형태로 응답
		String memberId = request.getParameter("member_id"); // 웹페이지에서 받은 member_id 를 memberId 변수에 저장
		boolean idcheck = nservice.idCheck(memberId); //웹에서 받은 아이디가 존재하는지 db에서 검사
		log.info("member_id 존재 여부 : " + idcheck); //true면 중복 되는 member_id가 없다. false면 이미 member_id가 존재
		response.getWriter().append(idcheck ? "true" : "false"); 
		//jquery validation plugin 에서 remote 는 반드시 true 또는 false를 넘겨줘야 한다.

	}

}