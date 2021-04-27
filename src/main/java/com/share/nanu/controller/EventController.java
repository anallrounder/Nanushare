package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.PointVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.MyPageService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
public class EventController {
	
	@Autowired
	private MyPageService mgservice;

	// 출석체크(event default)
//	@RequestMapping("/event/check")
//	public ModelAndView attendance(ModelAndView mav) throws Exception {
//			
//		mav.setViewName("/eventView/attendcheck"); 
//		return mav;
//	}

	// 테스트 디폴트 뷰(test default)
	@RequestMapping("/event/test")
	public ModelAndView testdefault(ModelAndView mav,@AuthenticationPrincipal MemberDetails md) throws Exception {
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("테스트 디폴트 주소");
			mav.addObject("username", md.getmember().getName());
			mav.addObject("member_id", md.getUsername());
		}
		mav.setViewName("/eventView/testDefault");
		return mav;
	}
	
	@GetMapping("/my/event/test/animalFace")
	public ModelAndView animalFaceTest(ModelAndView mav, @AuthenticationPrincipal MemberDetails md) {
		log.info("동물상 테스트 뷰");
		mav.setViewName("/animalFace/animalFaceTest");
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			
			mav.addObject("username", md.getmember().getName());
			mav.addObject("member_id", md.getUsername());
		}
		
		
		return mav;
	}
	
	@PostMapping("/my/event/test/animalFacePoint")
	public ResponseEntity<String> animalFaceTestPoint(ModelAndView mav, PointVO pointVO, @AuthenticationPrincipal MemberDetails md) {
		ResponseEntity<String> entity = null;
		
		try {
			int count = mgservice.myAnimalFaceTestCount(pointVO, md.getUsername());
			log.info("count" + count);

			if (count >= 1) {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			} else {
				mgservice.getMyAnimalFacePoint(pointVO, md.getUsername());
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	

	// 게임 디폴트 뷰(test default)
	@RequestMapping("/event/game")
	public ModelAndView gamedefault(ModelAndView mav,@AuthenticationPrincipal MemberDetails md) throws Exception {
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			
			mav.addObject("username", md.getmember().getName());
			mav.addObject("member_id", md.getUsername());
		}
		mav.setViewName("/eventView/gameDefault");
		return mav;
	}

	// 동물상테스트 뷰
	@RequestMapping("/event/animal")
	public ModelAndView animaltest(ModelAndView mav) throws Exception {

		mav.setViewName("/eventView/animalTest");
		return mav;
	}

	// 기부성향 테스트 뷰
	@RequestMapping("/event/givu")
	public ModelAndView givutest(ModelAndView mav) throws Exception {

		mav.setViewName("/eventView/givuTest");
		return mav;
	}

	// 타로 테스트 뷰
	@RequestMapping("/event/tarot")
	public ModelAndView tarottest(ModelAndView mav) throws Exception {

		mav.setViewName("/eventView/tarotTest");
		return mav;
	}

	// 퍼즐 게임 뷰
	@RequestMapping("/event/puzzle")
	public ModelAndView puzzlegame(ModelAndView mav) throws Exception {

		mav.setViewName("/eventView/puzzleGame");
		return mav;
	}

	// 퍼즐 게임 뷰
	@RequestMapping("/event/puzzle/play")
	public ModelAndView puzzlegameplay(ModelAndView mav) throws Exception {

		mav.setViewName("/eventView/2048play");
		return mav;
	}

	// 테트리스 게임 뷰
	@RequestMapping("/event/tetris")
	public ModelAndView tetrisgame(ModelAndView mav) throws Exception {

		mav.setViewName("/eventView/tetrisGame");
		return mav;
	}

	// 테트리스 게임 플레이
	@RequestMapping("/event/tetris/play")
	public ModelAndView tetrisplay(ModelAndView mav) throws Exception {

		mav.setViewName("/eventView/tetrisplay");
		return mav;
	}

	// 로또 게임 뷰
	@RequestMapping("/event/lotto")
	public ModelAndView lottogame(ModelAndView mav) throws Exception {

		mav.setViewName("/eventView/lottoGame");
		return mav;
	}

	// 로또 게임 뷰
	@RequestMapping("/event/lotto/play")
	public ModelAndView lottoplay(ModelAndView mav) throws Exception {

		mav.setViewName("/eventView/lottoplay");
		return mav;
	}
}