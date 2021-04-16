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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.service.NoticeBoardService;

import com.share.nanu.controller.NoticeBoardController;
import com.share.nanu.page.pageVO;
import com.share.nanu.paging.Criteria;
import com.share.nanu.paging.PageVO;
import com.share.nanu.security.MemberDetails;
import com.google.gson.JsonObject;
import com.nimbusds.oauth2.sdk.util.StringUtils;
import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
/* @RequestMapping("/board/*") */
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService nbService;

	// 공지사항 리스트
	@GetMapping("/board/notice")
	public String noticeBoardPaging(Criteria cri, Model model, @AuthenticationPrincipal MemberDetails md)
			throws Exception {
		log.debug("noticelist" + cri);
		model.addAttribute("list", nbService.getlist(cri));

		int total = nbService.getTotal(cri);
		model.addAttribute("pageMaker", new PageVO(cri, total));

		// @AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		/* model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); */
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			model.addAttribute("username", md.getmember().getName());
		}

		return "noticeBoard/notice_list";
	}

	// 컨텐트뷰
	@GetMapping("/board/notice/{b_index}")
	public String boardShowContent(BoardVO boardVO, Model model, @AuthenticationPrincipal MemberDetails md)
			throws Exception {
		log.debug("공지 게시판 컨텐트뷰");
		nbService.uphit(boardVO);
		model.addAttribute("content_view", nbService.getBoard(boardVO.getB_index()));

		// @AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		/* model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); */
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			model.addAttribute("username", md.getmember().getName());
		}

		return "noticeBoard/content_view";
	}

	// 수정
	@GetMapping("/board/notice/{b_index}/modify")
	public String bsModiview(BoardVO boardVO, Model model) throws Exception {
		log.debug("공지 게시판 수정");
		model.addAttribute("modify_view", nbService.getBoard(boardVO.getB_index()));
		return "noticeBoard/modify_view";
	}

	// 수정 내용 업데이트 -> 오류남. 수정해야함
	/*
	 * @PostMapping("/board/notice/modify") public String bsModify(BoardVO boardVO)
	 * throws Exception { log.info("인증게시판 컨트롤러  -- modify() -- 호출");
	 * nbService.modifyBoard(boardVO); return "redirect:content_view";
	 * ?b_index=${modify_view.b_index} // return "redirect:plist"; }
	 */

	// 글 삭제
		@GetMapping("/board/notice/delete")
		public String noticeDelete(BoardVO boardVO) throws Exception {
			log.info("공지 게시판 delete");
			nbService.deleteBoard(boardVO.getB_index());
			return "redirect:";
		}

		
	// 글작성
	@GetMapping("/board/notice/write")
	public String noticeWrite(Model model) throws Exception {
		log.debug("공지게시판 write_view");
		return "noticeBoard/write_view";
	}

}
