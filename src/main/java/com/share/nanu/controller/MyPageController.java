package com.share.nanu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
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
	BCryptPasswordEncoder bCryptPasswordEncoder;

	// 마이페이지
	@GetMapping("/my/mypage")
	public ModelAndView mypage(MemberVO mvo, ModelAndView mav, @AuthenticationPrincipal MemberDetails md) {
		// 헤더에 로그인한 사람 정보 가져오기
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			// log.info("로그인한 사람 이름 - "+ md.getmember().getName());
			mav.addObject("username", md.getmember().getName());
		}
		mav.setViewName("/my/mypage");
		return mav;
	}

	// 나의문의내역
	@GetMapping("/my/mypage/_1")
	public ModelAndView ask(MemberVO mvo, ModelAndView mav, Criteria cri) {
		mav.setViewName("/my/mypage_1");
		mav.addObject("list1", mgservice.myList1(cri));// 나의문의내역

		// 페이징
		int total = mgservice.getTotalCount1(cri);
		mav.addObject("pageMaker", new pageVO(cri, total));

		return mav;
	}

	// 나의인증내역
	@GetMapping("/my/mypage/_2")
	public ModelAndView content(MemberVO mvo, ModelAndView mav, Criteria cri) {
		mav.setViewName("/my/mypage_2");
		mav.addObject("list2", mgservice.myList2(cri));// 나의인증내역
		// 페이징
		int total = mgservice.getTotalCount2(cri);
		mav.addObject("pageMaker", new pageVO(cri, total));

		return mav;
	}

	// 나의나눔내역
	@GetMapping("/my/mypage/_3")
	public ModelAndView dona(MemberVO mvo, ModelAndView mav, Criteria cri) {
		mav.setViewName("/my/mypage_3");

		mav.addObject("list3", mgservice.myList3(cri));// 나의나눔내역
		// 페이징
		int total = mgservice.getTotalCount3(cri);
		mav.addObject("pageMaker", new pageVO(cri, total));

		return mav;
	}

	// 나의댓글내역
	@GetMapping("/my/mypage/_4")
	public ModelAndView reply(MemberVO mvo, ModelAndView mav, Criteria cri) {
		mav.setViewName("/my/mypage_4");

		mav.addObject("list1", mgservice.myList4(cri));// 나의문의내역
		// 페이징
		int total = mgservice.getTotalCount4(cri);

		mav.addObject("pageMaker", new pageVO(cri, total));

		return mav;
	}

	// https://melonpeach.tistory.com/49
	// 프로필 관리로 가는 페이지(수정 전 비밀번호 확인 단계)
	@GetMapping("/my/myprofile")
	public ModelAndView myprofile(ModelAndView mav) {
		log.info("프로필 페이지 비밀번호 확인 페이지 이동");
		mav.setViewName("/my/myprofile");

		return mav;
	}

	@PostMapping("/my/myprofile/check")
	public ResponseEntity<String> myprofile2(@AuthenticationPrincipal MemberDetails md, @RequestBody String pwConfirm) {

		ResponseEntity<String> entity = null;

		try {

			System.out.println(pwConfirm);

			log.info("로그인한 회원의 비밀번호와 패스워드 칸에 입력한 비밀번호 일치하는지 확인");
			// mgservice.checkpw(md.getUsername());
			// System.out.println(md.getUsername());			
			String password = md.getPassword(); // md.getmember.getPassword()
			
			System.out.println(bCryptPasswordEncoder.matches(pwConfirm, password));
			// bCryptPasswordEncoder.matches("pwConfirm", password);
			if (bCryptPasswordEncoder.matches(pwConfirm, password) == true) {
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
	public ModelAndView myprofile2(ModelAndView mav) {
		log.info("피로필 수정 페이지로 이동");
		mav.setViewName("/my/edit");

		return mav;
	}

	// 수정페이지
	@PutMapping("/my/myprofile/edit")
	public String myprofileedit(@AuthenticationPrincipal MemberDetails md, Model model) {

		model.addAttribute("member_id");
		// model.addAttribute("member_id",
		// mgservice.memberModifyPOST(md.getUsername()));

		return "/my/mypage";
	}

	// 탈퇴페이지
	@DeleteMapping("/my/drop")
	public String deletePOST(@RequestBody MemberVO memberVO, HttpSession session) {

		if (memberVO.getMember_id() != null && memberVO.getMember_id() != "") {
			mgservice.memberDelete(memberVO);
			session.invalidate();

		}
		return "/my/drop";
	}
}