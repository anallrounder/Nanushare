package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.service.NoticeBoardService;

import com.share.nanu.controller.RestBoardController;
import com.share.nanu.paging.Criteria;
import com.share.nanu.paging.PageVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/restful/*")
public class RestBoardController {
	
	@Autowired
	private NoticeBoardService nbService;
	
	// 공지사항
		@Transactional
		@GetMapping("/notice")
		public ModelAndView list1(Criteria cri, ModelAndView mav) {
			log.info("list1()");
			log.info(cri.toString());
			mav.setViewName("noticeBoard/rest_list");
			mav.addObject("list", nbService.getlist(cri));

			int total = nbService.getTotal(cri);
			log.info("total" + total);
			mav.addObject("pageMaker", new PageVO(cri, total));

			return mav;
	}
		// 문의사항
		@Transactional
		@GetMapping("/qna")
		public ModelAndView list2(Criteria cri, ModelAndView mav) {
			log.info("list2()");
			log.info(cri.toString());
			mav.setViewName("noticeBoard/qna_list");
			mav.addObject("list", nbService.getlist(cri));

			int total = nbService.getTotal(cri);
			log.info("total" + total);
			mav.addObject("pageMaker", new PageVO(cri, total));

			return mav;
		}
}