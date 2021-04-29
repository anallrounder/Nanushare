package com.share.nanu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.service.BoardShowsService;
import com.share.nanu.service.NoticeBoardService;
import com.share.nanu.service.QnaBoardService;
import com.share.nanu.controller.QnaBoardController;
import com.share.nanu.paging.Criteria;
import com.share.nanu.paging.PageVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/board/*")
public class QnaBoardController {

	@Autowired
	private QnaBoardService qService;
	
	@Autowired
	private BoardShowsService bservice;
	
	@Autowired 
	private NoticeBoardService nservice;
	
	// FAQ 게시판 리스트
	@GetMapping("/faq")
	public ModelAndView faqList(ModelAndView mov, @AuthenticationPrincipal MemberDetails md) {
		
		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}

		
		mov.addObject("FAQlist", qService.getlist());
		mov.setViewName("faq/faq_list");
		
		return mov;
	}

	// QNA 게시판 리스트 조회
	@GetMapping("/qna")
	public ModelAndView noticeBoardPaging(Criteria cri, ModelAndView mov, @AuthenticationPrincipal MemberDetails md)
			throws Exception {

		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}

		mov.addObject("list", qService.getlist(cri));

		int total = qService.getTotal(cri);
		mov.addObject("pageMaker", new PageVO(cri, total));
		
		mov.setViewName("qnaBoard/qna_list");

		return mov;
	}

	// 문의글 작성 페이지
	@GetMapping("/qna/write")
	public ModelAndView qnaWriteView(ModelAndView mov, @AuthenticationPrincipal MemberDetails md) throws Exception {
		
		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}
		
		mov.addObject("asidelist", bservice.asidelist()); // 인증게시판 aisde에 최신순 뿌려주는 리스트
		mov.addObject("nlist", nservice.asideNlist()); // 인증게시판 aisde에 최신순 뿌려주는 리스트
		
		mov.setViewName("qnaBoard/write_view");
		
		return mov;

	}
	
	// 문의글 추가
	@PostMapping("/qna/qnaWrite")
	public ResponseEntity<String> qnaWrite(@RequestBody BoardVO boardVO, @AuthenticationPrincipal MemberDetails md) {
		
		ResponseEntity<String> entity = null;

		try {
			boardVO.setMember_id(md.getUsername());
			qService.writeInsert(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 컨텐트뷰
	@GetMapping("/qna/{b_index}")
	public ModelAndView qnaContentView(BoardVO boardVO, BoardreplyVO replyVO, ModelAndView mov, @AuthenticationPrincipal MemberDetails md) throws Exception {
		
		if (md != null) { 
			mov.addObject("username", md.getmember().getName());
		}
		
		mov.addObject("asidelist", bservice.asidelist()); // 인증게시판 aisde에 최신순 뿌려주는 리스트
		mov.addObject("nlist", nservice.asideNlist()); // 인증게시판 aisde에 최신순 뿌려주는 리스트
		
		qService.uphit(boardVO);
		mov.addObject("content_view", qService.getBoard(boardVO.getB_index()));
		mov.addObject("reply_view", qService.getReplyBoard(replyVO.getB_index()));		
		mov.setViewName("qnaBoard/content_view");

		return mov;
	}

	// 수정페이지
	@GetMapping("/qna/modify/{b_index}")
	public ModelAndView qnaModifyView(BoardVO boardVO, ModelAndView mov, @AuthenticationPrincipal MemberDetails md) throws Exception {
		
		if (md != null) {
			mov.addObject("username", md.getmember().getName());
		}
		
		mov.addObject("asidelist", bservice.asidelist()); // 인증게시판 aisde에 최신순 뿌려주는 리스트
		mov.addObject("nlist", nservice.asideNlist()); // 인증게시판 aisde에 최신순 뿌려주는 리스트
		
		mov.addObject("modify_view", qService.getBoard(boardVO.getB_index()));
		mov.setViewName("qnaBoard/modify_view");
		
		return mov;
	}
	
	// 문의글 수정
	@PutMapping("/qna/modify")
	public ResponseEntity<String> qnaModify(@RequestBody BoardVO boardVO, @AuthenticationPrincipal MemberDetails md) {
		ResponseEntity<String> entity = null;

		try {
			qService.modifyBoard(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	//글 삭제
	@DeleteMapping("/qna/{b_index}")
	public ResponseEntity<String> qnaDelete(BoardVO boardVO, BoardreplyVO replyVO) {
		ResponseEntity<String> entity = null;

		try {
			qService.deleteReply(replyVO.getB_index());
			qService.deleteBoard(boardVO.getB_index());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 답변 작성
	@PostMapping("/qna/reply")
	public ModelAndView qnaReply(BoardreplyVO bReplyVO, ModelAndView mov, @AuthenticationPrincipal MemberDetails md) throws Exception {
		
		if (md != null) { 
			mov.addObject("username", md.getmember().getName());
		}
		
		bReplyVO.setRid(md.getUsername());
		qService.replyInsert(bReplyVO);
		mov.setViewName("qnaBoard/qna_list");
		
		return mov;
	}

}