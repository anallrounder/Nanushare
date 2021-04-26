package com.share.nanu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class EventController {

	// 출석체크(event default)
//	@RequestMapping("/event/check")
//	public ModelAndView attendance(ModelAndView mav) throws Exception {
//			
//		mav.setViewName("/eventView/attendcheck"); 
//		return mav;
//	}

	// 테스트 디폴트 뷰(test default)
	@RequestMapping("/event/test")
	public ModelAndView testdefault(ModelAndView mav) throws Exception {

		mav.setViewName("/eventView/testDefault");
		return mav;
	}
	
	@GetMapping("/my/event/test/animalFaceTest")
	public ModelAndView animalFaceTest(ModelAndView mav) {
		mav.setViewName("/animalFace/animalFaceTest");
		return mav;
	}
	

	// 게임 디폴트 뷰(test default)
	@RequestMapping("/event/game")
	public ModelAndView gamedefault(ModelAndView mav) throws Exception {

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