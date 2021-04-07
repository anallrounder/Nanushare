package com.share.nanu.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

	@Autowired
	private JavaMailSender javaMailSender;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	private NanuService nservice;

	@GetMapping("/signUpForm") // 가입페이지 이동
	public ModelAndView jointest(ModelAndView mav) {
		log.info("회원가입 폼으로 이동");
		mav.setViewName("/signUpForm/signUpForm");
		return mav;
	}

	@GetMapping("/loginPage") // 로그인 페이지
	public ModelAndView home(ModelAndView mav, HttpServletRequest request) {
		log.info("로그인 폼으로 이동");
		//인증하기전 이전 주소를 기억 하는 로직
		//String referrer = request.getHeader("Referer");//이전 페이지 주소
		//request.getSession().setAttribute("prevPage", referrer);//세션에 이전페이지 주소를 prevPage에 저장
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

	@GetMapping("/IdCheck") // 이메일 중복 체크 validation remote
	public void IdCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		log.info("중복 이메일 체크");
		response.setContentType("application/json"); // 응답을 줄때 타입은 json형태로 응답
		String memberId = request.getParameter("member_id"); // 웹페이지에서 받은 member_id 를 memberId 변수에 저장
		boolean idcheck = nservice.idCheck(memberId); // 웹에서 받은 아이디가 존재하는지 db에서 검사
		log.info("member_id 존재 여부 : " + idcheck); // true면 중복 되는 member_id가 없다. false면 이미 member_id가 존재
		//response.getWriter().append("true");
		response.getWriter().append(idcheck ? "true" : "false");
		// jquery validation plugin 에서 remote 는 반드시 true 또는 false를 넘겨줘야 한다.

	}

	@PostMapping("/sendMail") // 이메일 인증
	public Map<String, Object> SendMail(String mail, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Random random = new Random();
		String key = "";

		SimpleMailMessage message = new SimpleMailMessage();
		// SimpleMailMessage
		// setTo() 받는사람 주소
		// setFrom() 보내는사람 주소, 해당 함수를 호출하지 않는다면 application.properties에 작성한 username으로
		// 세팅
		// setSubject() 제목
		// setText() 메시지 내용
		// 나머지 기능은 문서 참조
		// https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/mail/SimpleMailMessage.html
		// mailSender.send 실제 메일 발송 부분
		message.setTo(mail); // 스크립트에서 보낸 메일

		for (int i = 0; i < 3; i++) {
			int index = random.nextInt(25) + 65; // A~Z 까지 랜덤 알파벳 생성
			key += (char) index;
		}
		int numIndex = random.nextInt(8999) + 1000; // 4자리 정수 생성
		key += numIndex;
		message.setSubject("Nanushare 인증번호 전송"); // 보낼 메일 제목
		message.setText("인증 번호  " + key); // 보낼 메일 내용
		javaMailSender.send(message);
		map.put("key", key);
		return map;

	}

	@GetMapping("/forgotPW") // 비밀번호 찾기 폼으로 이동
	public ModelAndView forgotPassword(ModelAndView mav) {
		log.info("비밀번호 찾기");
		mav.setViewName("/forgotPW");
		return mav;
	}

	@GetMapping("/forgotEmail") // 이메일 찾기 폼으로 이동
	public ModelAndView forgotEmail(ModelAndView mav) {
		log.info("이메일 찾기 폼으로 이동");
		mav.setViewName("/forgotEmail");
		return mav;
	}

	@PostMapping("/sendFindEmail") // 아이디 찾기, 이메일로 가입 이메일 전송
	public Map<String, Object> findEmail(String mail, HttpSession session, MemberVO mvo) {
		log.info("이메일 찾기");
		Map<String, Object> map = new HashMap<String, Object>();
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mail); // 스크립트에서 보낸 메일
		log.info(mail);
		
		 nservice.findEmail(mail);
		
		log.info("findEmail - " + nservice.findEmail(mail).getMember_id());			
		message.setSubject("Nanushare 이메일찾기"); // 보낼 메일 제목
		message.setText("가입 이메일 : " +nservice.findEmail(mail).getMember_id()); // 보낼 메일 내용
		javaMailSender.send(message);
		map.put("findEmail", nservice.findEmail(mail).getMember_id());

		return map;
	}

	@PostMapping("/changePw") // 비밀번호 변경처리
	public ResponseEntity<String> changePw(@RequestBody MemberVO mvo) {
		log.info("비밀번호 변경 처리");
		ResponseEntity<String> entity = null;

		try {
			String password = mvo.getPw();
			String encode = bCryptPasswordEncoder.encode(password);
			mvo.setPw(encode);

			nservice.changePw(mvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}

}