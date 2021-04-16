package com.share.nanu.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.service.NoticeBoardService;
import com.share.nanu.service.QnaBoardService;
import com.share.nanu.controller.QnaBoardController;
import com.share.nanu.page.pageVO;
import com.share.nanu.paging.Criteria;
import com.share.nanu.paging.PageVO;
import com.share.nanu.security.MemberDetails;
import com.google.gson.JsonObject;
import com.nimbusds.oauth2.sdk.util.StringUtils;
import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.VO.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
@RequestMapping("/board/*")
public class QnaBoardController {

	@Autowired
	private QnaBoardService qService;

	// FAQ 게시판 리스트
	@GetMapping("/faq")
	public String list(Model model) {
		model.addAttribute("FAQlist", qService.getlist());
		return "faq/faq_list";
	}

	// QNA 게시판 리스트 조회
	@GetMapping("/qna")
	public String noticeBoardPaging(Criteria cri, Model model, @AuthenticationPrincipal MemberDetails md)
			throws Exception {

		if (md != null) {
			model.addAttribute("username", md.getmember().getName());
		}

		model.addAttribute("list", qService.getlist(cri));

		int total = qService.getTotal(cri);
		model.addAttribute("pageMaker", new PageVO(cri, total));

		return "qnaBoard/qna_list";
	}

	// 문의글 작성 페이지
	@GetMapping("/qna/write")
	public String noticeWrite(Model model, @AuthenticationPrincipal MemberDetails md) throws Exception {
		log.info("공지게시판 write_view");

		return "qnaBoard/write_view";

	}

	// 문의글 추가
	@PostMapping("/qna/write/add")
	public String noticeInsert(Model model, BoardVO boardVO, @AuthenticationPrincipal MemberDetails md)
			throws Exception {
		log.info("공지게시판 글 추가");
		boardVO.setMember_id(md.getUsername());
		qService.writeInsert(boardVO);

		return "redirect:/board/qna";

	}

	// 컨텐트뷰
	@GetMapping("/qna/{b_index}")
	public String bContentView(BoardVO boardVO, BoardreplyVO replyVO, Model model, @AuthenticationPrincipal MemberDetails md) throws Exception {
		log.info("contentView 시작");
		
		if (md != null) { 
			model.addAttribute("username", md.getmember().getName());
		}


		qService.uphit(boardVO);
		model.addAttribute("content_view", qService.getBoard(boardVO.getB_index()));
		model.addAttribute("reply_view", qService.getReplyBoard(replyVO.getB_index()));

		return "qnaBoard/content_view";
	}

	// 수정페이지
	@GetMapping("/qna/modify/{b_index}")
	public String bModifyView(BoardVO boardVO, Model model) throws Exception {
		log.info("공지 게시판 수정페이지");
		model.addAttribute("modify_view", qService.getBoard(boardVO.getB_index()));
		return "qnaBoard/modify_view";
	}

	// 수정
	@PostMapping("/qna/modify") 
	public String bModify(BoardVO boardVO) throws Exception {
		log.info("공지 게시판 수정");
		
		qService.modifyBoard(boardVO);
		
		return "redirect:/board/qna";
	}

	// 글 삭제
	@GetMapping("/qna/delete")
	public String noticeDelete(BoardVO boardVO) throws Exception {
		log.info("공지 게시판 delete");
		qService.deleteBoard(boardVO.getB_index());
		return "redirect:/board/qna";
	}
	
	// 답변 작성
	@PostMapping("/qna/reply")
	public String bReply(BoardreplyVO bReplyVO, @AuthenticationPrincipal MemberDetails md) throws Exception {
		log.info("관리자 답변 페이지view");
		
		bReplyVO.setRid(md.getUsername());
		qService.replyInsert(bReplyVO);

		return "redirect:/board/qna";
	}

}