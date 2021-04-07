package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.service.NoticeBoardService;

import com.share.nanu.controller.RestBoardController;
import com.share.nanu.paging.Criteria;
import com.share.nanu.paging.PageVO;
import com.share.nanu.VO.BoardVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/restful/*")
public class RestBoardController {

	@Autowired
	private NoticeBoardService nbService;

	// 공지사항 리스트(페이징)
	@Transactional
	@GetMapping("/notice")
	public ModelAndView noticelist(Criteria cri, ModelAndView mav) {
		log.info("noticelist()");
		log.info(cri.toString());
		mav.setViewName("noticeBoard/rest_list");
		mav.addObject("list", nbService.getList(cri));

		int total = nbService.getTotal(cri);
		log.info("total" + total);
		mav.addObject("pageMaker", new PageVO(cri, total));

		return mav;
	}

	// 컨텐트 뷰
	@GetMapping("/notice/{b_index}")
	public ModelAndView notice_content_view(BoardVO boardVO, ModelAndView mav) {
		log.info("notice_content_view");
		mav.setViewName("noticeBoard/content_view");
		mav.addObject("content_view", nbService.getBoard(boardVO.getB_index()));
		return mav;
	}

	// 작성글 삭제
	// ResponseEntity: 개발자가 직접 결과 데이터와 HTTP 상태 코드를 제어할 수 있는 클래스
	@DeleteMapping("/notice/{b_index}")
	public ResponseEntity<String> notice_delete(BoardVO boardVO, Model model) {
		ResponseEntity<String> entity = null;
		log.info("notice_delete..");

		try {
			nbService.remove(boardVO.getB_index());
			// 삭제가 성공하면 상태메시지 저장
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// 댓글 삭제가 실패하면 BAD_REQUEST를 리턴
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		// 삭제 처리 HTTP 상태 메시지 리턴
		return entity;
	}

	// 작성글 수정
	@PutMapping("/notice/{b_index}")
	public ResponseEntity<String> notice_update(@RequestBody BoardVO boardVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("notice_update..");
		try {
			nbService.modifyBoard(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 글 작성 페이지
	@GetMapping("/notice/write")
	public ModelAndView notice_write_view(ModelAndView mav) {
		log.info("notice_write_view");
		mav.setViewName("noticeBoard/write_view");
		return mav;
	}

	// 글 작성
	@PutMapping("/notice/write")
	public ResponseEntity<String> write_view(@RequestBody BoardVO boardVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("write_view..");
		try {
			nbService.writeBoard(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 답변글 페이지
	@GetMapping("/notice/reply/{b_index}")
	public ModelAndView rest_reply_view(BoardVO boardVO, ModelAndView mav) {
		log.info("rest_reply_view");
		mav.setViewName("noticeBoard/reply_view");
		mav.addObject("reply_view", nbService.getReply(boardVO.getB_index()));
		return mav;
	}

	// 작성글 답변
	@PutMapping("/notice/reply/{b_index}")
	public ResponseEntity<String> rest_reply(@RequestBody BoardVO boardVO, ModelAndView modelAndView) {
		ResponseEntity<String> entity = null;

		log.info("rest_reply..");
		try {
			nbService.replyBoard(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	
	 // 문의사항
	 @Transactional
	 @GetMapping("/qna") 
	 public ModelAndView qnalist(Criteria cri, ModelAndView mav) { 
		 log.info("qnalist()"); 
		 log.info(cri.toString());
		 mav.setViewName("noticeBoard/qna_list"); 
		 mav.addObject("list", nbService.getList(cri));
	 
		 int total = nbService.getTotal(cri); log.info("total" + total);
		 mav.addObject("pageMaker", new PageVO(cri, total));
	 
		return mav; 
	}
}