package com.share.nanu.controller;

import java.io.File;

import javax.servlet.http.HttpServletResponse;

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
import com.share.nanu.VO.AttachmentVO;
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
	
	// 인증게시판 게시글 삭제
		// ck에디터로 저장되어지는 이미지는 디비에 저장히자 않아서..... 이미지의 경로를 모른다....
		@GetMapping("/qnaboard/shows/delete/{b_index}")
		public void bsDelete(ModelAndView mav,HttpServletResponse response, BoardVO bvo, AttachmentVO attvo, BoardreplyVO brvo)
				throws Exception {
			// 1. attachment 테이블에서 게시판 글번호 조회 -> 이미지 삭제 -> attachment 테이블에서 조회한 글번호로 첨부파일
			// 데이터 삭제
			// 2. 댓글 테이블에서 게시판 글번호로 댓글 삭제
			// 3. board 테이블에서 b_index 조회 -> 마지막으로 board테이블에서 글삭제
			// 4. 리스트로 이동

			// ck 에디터로 올리는 이미지 삭제는 잠시 보류.. 게시판 글번호를 가져올 수 없어서 찾을 수 없다.
			log.info("인증게시판 글 삭제");
			log.info("getbIndex : " + bvo.getB_index());
			// 1. 썸네일 로컬에서 삭제
			String path = bservice.getAttachmentBindex(bvo.getB_index()); // attachment 에서 삭제할 썸네일 이미지 경로 가져오기
			if (path != null) {

				File deleteFile = new File(path);
				if (deleteFile.exists()) { // 파일의 유뮤 체크
					deleteFile.delete();

					log.info("썸네일 삭제");
				} else {
					log.info("삭제할 썸네일이 업습니다.");
				}

				bservice.deleteAttachment(bvo.getB_index());
				log.info("썸네일 저장 테이블에서 삭제");

			}

			// 2. 댓글 테이블에서 해당 게시판 글번호로 댓글 전부 삭제
			bservice.deleteReply(bvo.getB_index());
			log.info("인증게시판 댓글 삭제");

			// 3. board 테이블에서 인증글 삭제
			bservice.deleteCertificationBoard(bvo.getB_index());
			log.info("인증게시판 글 삭제");
			
			response.sendRedirect("/board/qna");

			/*
			 * mav.setViewName("/board_show/yourSupportList"); return mav;
			 */

		}
	

}