package com.share.nanu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.share.nanu.VO.Board_ListVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.page.Criteria;
import com.share.nanu.page.pageVO;
import com.share.nanu.service.MyPageService;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class MyPageController {

	@Autowired
	private MyPageService mgservice;
//https://onebyone1.tistory.com/61
	// 마이페이지
	@GetMapping("/my/mypage")
	public ModelAndView mypage( HttpServletRequest req, HttpSession session, RedirectAttributes rttr,MemberVO mvo, ModelAndView mav, Criteria cri,IteminvenVO inven, Board_ListVO board) {
		mav.setViewName("/my/mypage");

		String member_id = (String) session.getAttribute("member_id");

		//MemberVO mvo = mgservice.readMember(mem);

		mav.addObject("list1", mgservice.myList1(cri));
		
		mav.addObject("list2", mgservice.myList2(cri));
		
		mav.addObject("list3", mgservice.myList3());
		
		mav.addObject("list4", mgservice.myList4());
		
		//페이징
		int total = mgservice.getTotalCount1(cri);
		total = mgservice.getTotalCount2(cri);
//		total = mgservice.getTotalCount3(cri);
//		total = mgservice.getTotalCount4(cri);
		
		mav.addObject("pageMaker", new pageVO(cri, total));

		
		return mav;
	}

	// 프로필 관리로 가는 페이지(수정 전 비밀번호 확인 단계)
	@GetMapping("/my/myprofile")
	public ModelAndView myprofile1(ModelAndView mav, MemberVO mvo) {

		mav.setViewName("/my/myprofile");
		// mav.addObject("profile", mgservice.myProfile(mvo));
		return mav;
	}

	// 비밀번호 확인 처리
	@PostMapping("/my/myprofile")
	public String myprofile2(String pw, HttpSession session) {

		String result = null;
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		MemberVO membervo = (MemberVO) session.getAttribute(pw);

		if (encoder.matches(pw, membervo.getPw())) {
			result = "pwcontfirmOK";
		} else {
			result = "pwConfirmNO";
		}

		return result;
	}

	// 수정하러 프로필 관리로 가는 페이지
	@GetMapping("/my/myprofile/edit")
	public String memberModifyGET(HttpServletRequest req, Model model, MemberVO memberVO) {
		// 로그인이 된 후에 사용가능
		HttpSession session = req.getSession();

//		// 세션 객체안에 있는 id정보 저장
//		MemberVO member_id = (MemberVO) session.getAttribute("member_id");
//
//		// 서비스안의 회원정보보기 메서드 호출
//		MemberVO modifyMember = mgservice.membermodifyGET(member_id.getMember_id());

		// 정보저장 후 페이지 이동
//		model.addAttribute("modifyName", modifyMember.getName());
//		model.addAttribute("modifyId", modifyMember.getMember_id());
//		model.addAttribute("modifyPhone", modifyMember.getPhone());
//		model.addAttribute("modifyPw", modifyMember.getPw());

//		model.addAttribute("modifyName", "aaa");
//		model.addAttribute("modifyId", "탈퇴할aaa@naver.com");
//		model.addAttribute("modifyPhone", "01012341234");
		System.out.println("출력이되나1");
		return "/my/edit";
	}

	// 수정 업데이트하고 다시 프로필 페이지로 돌아가는 페이지
	@PostMapping("/my/myprofile/edit")
	public String memberModifyPOST(@RequestBody MemberVO memberVO) {
		System.out.println("출력이되나2-1");
		mgservice.memberModifyPOST(memberVO);
		System.out.println("출력이되나2-2");
		return "/my/mypage";
	}

	// 탈퇴페이지
//	@PostMapping("/my/drop")
//	public ModelAndView myprofiledrop(ModelAndView mav, MemberVO membervo) {
//
//		if (membervo.getMember_id() != null && membervo.getMember_id() != "") {
//			mgservice.memberDelete(membervo);
//			mav.setViewName("/my/drop");
//		}
//		return mav;
//		//return "redirect:home";
//	}

	@GetMapping("/my/drop")
	public void deleteGET(HttpSession session) {

		// 세션제어
		String member_id = (String) session.getAttribute("member_id");
//		if(id == null) {
//			return "redirect:/home";
//		}

	}

	@PostMapping("/my/drop")
	public void deletePOST(@RequestBody MemberVO memberVO, HttpSession session) {

		// 서비스객체에서 동착
		mgservice.memberDelete(memberVO);

		// 세션초기화
		session.invalidate();
	}
}
