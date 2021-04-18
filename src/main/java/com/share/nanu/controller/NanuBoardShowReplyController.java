//혜선 인증게시판 컨트롤러 작성 03.22_화ㅣ
// https://www.tutorialrepublic.com/twitter-bootstrap-button-generator.php
package com.share.nanu.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.NanuBoardShowYSService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
//https://kyuhyuk.kr/article/spring-boot/2020/07/21/Spring-Boot-JPA-MySQL-Board-Post-Update-Delete

@Slf4j
@AllArgsConstructor
@RestController
//@RequestMapping("/board/shows/*")
public class NanuBoardShowReplyController {

	@Autowired
	private NanuBoardShowYSService service;

	// 컨텐트뷰 + 댓글 보기
	@GetMapping("/board/shows/content_view/{b_index}")
	public ModelAndView content_view(BoardVO boardVO, BoardreplyVO rvo, ModelAndView mav,
			@AuthenticationPrincipal MemberDetails md) throws Exception {
		log.info("controller -- content_view -- 호출");
		service.uphit(boardVO);

		mav.setViewName("board_show/yourSupportContent"); // 이동할 웹페이지 주소

		mav.addObject("content_view", service.getBoard(boardVO.getB_index())); // 게시판 글 불러오기
		log.info("컨텐트 뷰 테스트 BordVO.getB_index()= " + boardVO.getB_index()); // 확인

		mav.addObject("listComment", service.listComment(rvo)); // 게시판글의 댓글 리스트 불러오기
		log.info("컨트롤러 댓글 리스트 테스트 service.listComment(rvo)= " + rvo); // 확인

		// mav.addObject("getComment", service.getComment(rvo)); // 로그인한사람의 댓글 확인

		// @AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		// model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate()));
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			mav.addObject("username", md.getmember().getName());
			mav.addObject("member_id", md.getUsername());
		}
		return mav;
	}

	// ck에디터로 저장되어지는 이미지는 디비에 저장히자 않아서..... 이미지의 경로를 모른다....
	@GetMapping("/my/board/shows/delete/{b_index}")
	public ModelAndView bsDelete(ModelAndView mav, BoardVO bvo, AttachmentVO attvo, BoardreplyVO brvo)
			throws Exception {
		// 1. attachment 테이블에서 게시판 글번호 조회 -> 이미지 삭제 -> attachment 테이블에서 조회한 글번호로 첨부파일
		// 데이터 삭제
		// 2. 댓글 테이블에서 게시판 글번호로 댓글 삭제
		// 3. board 테이블에서 b_index 조회 -> 마지막으로 board테이블에서 글삭제
		// 4. 리스트로 이동

		// ck 에디터로 올리는 이미지 삭제는 잠시 보류.. 게시판 글번호를 가져올 수 없어서 찾을 수 없다.
		log.info("인증게시판 글 삭제");

		//1. 썸네일 로컬에서 삭제
		String path = service.getAttachmentBindex(bvo.getB_index()); // attachment 에서 삭제할 썸네일 이미지 경로 가져오기		
		if (path != null) {
			
			File deleteFile = new File(path);
			if(deleteFile.exists()) { //파일의 유뮤 체크
				deleteFile.delete();
				
				log.info("썸네일 삭제");
			}else {
				log.info("삭제할 썸네일이 업습니다.");
			}
			
			service.deleteAttachment(bvo.getB_index());
			log.info("썸네일 저장 테이블에서 삭제");
			
			
		}
		
		//2. 댓글 테이블에서 해당 게시판 글번호로 댓글 전부 삭제
		service.deleteReply(bvo.getB_index());		
		log.info("인증게시판 댓글 삭제");
		
		
		//3. board 테이블에서 인증글 삭제
		service.deleteCertificationBoard(bvo.getB_index());
		log.info("인증게시판 글 삭제");
		
		
		mav.setViewName("board_show/yourSupportList");
		return mav;

	}

	// 댓글 입력 insert
	// [Spring] ResponseEntity는 왜 쓰는 것이며 어떻게 쓰는걸까? https://a1010100z.tistory.com/106
	/*
	 * @PostMapping("board/shows/reply_insert") public ResponseEntity<String>
	 * reply_insert(@RequestBody BoardreplyVO rvo, BoardreplyVO replyVO, BoardVO
	 * boardVO, Model model, @AuthenticationPrincipal MemberDetails md) {
	 * log.info("rvo = " + rvo);
	 * 
	 * ResponseEntity<String> entity = null; log.info("reply_insert");
	 * 
	 * //Date dateChangePaidAt = Date.valueOf();
	 * 
	 * System.out.println(rvo);
	 * 
	 * if (md != null) { model.addAttribute("member_id",
	 * md.getmember().getMember_id()); }
	 * 
	 * 
	 * try { service.insertReply(rvo); //댓글 입력 service.getRecentComment(replyVO);
	 * //최신 저장된 댓글 가져오기 //entity = new ResponseEntity<String>("r_num" ,
	 * service.getRecentComment(replyVO); //최신 저장된 댓글 가져오기);
	 * //replyVO.setR_num(rvo.getR_num()); // 댓글 번호 받아서 넣어주기
	 * //model.addAttribute("recentComment = ", replyVO);
	 * 
	 * System.out.println("rvo = " + rvo); System.out.println("replyvo = " +
	 * service.getRecentComment(replyVO));
	 * 
	 * } catch (Exception e) { e.printStackTrace(); //entity = new
	 * ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); }
	 * 
	 * 
	 * return entity; }
	 */
	// 댓글 입력 insert
	// [Spring] ResponseEntity는 왜 쓰는 것이며 어떻게 쓰는걸까? https://a1010100z.tistory.com/106
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("board/shows/reply_insert") public Map<String, Integer>
	 * reply_insert(@RequestBody BoardreplyVO rvo, BoardreplyVO replyVO, Model
	 * model, @AuthenticationPrincipal MemberDetails md) throws Exception {
	 * 
	 * log.info("rvo = " + rvo); log.info("reply_insert"); System.out.println(rvo);
	 * 
	 * Map<String, Integer> sendR_num = new HashMap<String, Integer>();
	 * service.insertReply(rvo); //댓글 입력 //service.getRecentComment(replyVO); //최신
	 * 저장된 댓글 가져오기 //service.getRid(rvo.getB_index());
	 * 
	 * //System.out.println("r_num = " +
	 * service.getRecentComment(replyVO).getR_num());
	 * //System.out.println("r_num = " + rvo.getR_num());
	 * 
	 * sendR_num.put("r_num", service.getRecentComment(replyVO).getR_num());
	 * System.out.println("r_num = " +
	 * service.getRecentComment(replyVO).getR_num());
	 * 
	 * 
	 * if (md != null) { model.addAttribute("member_id",
	 * md.getmember().getMember_id()); } return sendR_num; }
	 */
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("board/shows/reply_insert") public BoardreplyVO
	 * reply_insert(@RequestBody BoardreplyVO rvo, BoardreplyVO replyVO, Model
	 * model, @AuthenticationPrincipal MemberDetails md) throws Exception {
	 * 
	 * System.out.println(rvo);
	 * 
	 * service.insertReply(rvo); //댓글 입력
	 * 
	 * //replyVO.setB_index(rvo.getR_num());
	 * 
	 * BoardreplyVO send = service.getRecentComment(rvo.getR_num(),
	 * rvo.getB_index());
	 * System.out.println(service.getRecentComment(rvo.getR_num(),
	 * rvo.getB_index()));
	 * 
	 * //service.getRecentComment(replyVO); //최신 저장된 댓글 가져오기 //send.put("b_index" ,
	 * rvo.getB_index()); //send.put("r_num" ,
	 * service.getRecentComment(rvo).getB_index()); //System.out.println("r_num = "
	 * + service.getRecentComment(replyVO).getR_num());
	 * //System.out.println("rvo = " + service.getRecentComment(rvo.getR_num()));
	 * //System.out.println("b_index = " + rvo.getB_index());
	 * 
	 * if (md != null) { model.addAttribute("member_id",
	 * md.getmember().getMember_id()); } return send; }
	 */
	@ResponseBody
	@PostMapping("board/shows/reply_insert")
	public int reply_insert(@RequestBody BoardreplyVO rvo, BoardreplyVO replyVO, Model model,
			@AuthenticationPrincipal MemberDetails md) throws Exception {

		service.insertReply(rvo); // 댓글 입력

		// replyVO.setB_index(rvo.getR_num());
		// BoardreplyVO send = service.getRecentComment(rvo.getR_num(),
		// rvo.getB_index());
		// System.out.println(service.getRecentComment(rvo.getR_num(),
		// rvo.getB_index()));

		int send = service.getRecentComment(rvo).getR_num();
		System.out.println(service.getRecentComment(rvo).getR_num());

		// service.getRecentComment(replyVO); //최신 저장된 댓글 가져오기
		// send.put("b_index" , rvo.getB_index());
		// send.put("r_num" , service.getRecentComment(rvo).getB_index());
		// System.out.println("r_num = " +
		// service.getRecentComment(replyVO).getR_num());
		// System.out.println("rvo = " + service.getRecentComment(rvo.getR_num()));
		// System.out.println("b_index = " + rvo.getB_index());

		if (md != null) {
			model.addAttribute("member_id", md.getmember().getMember_id());
		}
		return send;
	}

	// 댓글 삭제
	@DeleteMapping("board/shows/delete/{r_num}") // 맵핑 자체가 델리트맵핑 /{b_index}/{r_num}
	public ResponseEntity<String> rest_deltete(BoardVO boardVO, BoardreplyVO rvo, Model model) {

		ResponseEntity<String> entity = null; // 레스트풀을 위해 제공하는 대표적인 것 중 하나
		log.info("rest_delete");

		try {
			service.remove(rvo);

			// 삭제가 성공하면 성공 상태 메세지 저장 // 마음대로 전달할 수 있다.
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			// message = "SUCCESS" 이렇게 해도 상관 없다.
		} catch (Exception e) {
			e.printStackTrace();
			// 댓글 삭제가 실패하면 실패 상태메세지 저장
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);// 400
		}
		// 삭제 처리 HTTP 상태 메시지 리턴
		return entity;
	}

	// 댓글 수정 창 보기
	/*
	 * @GetMapping("/board/shows/update_view/updateView") //
	 * /content_view/{bid}/reply/{rid} public ModelAndView updateReplyView(BoardVO
	 * boardVO, BoardreplyVO rvo, ModelAndView mav, @AuthenticationPrincipal
	 * MemberDetails md ) throws Exception {
	 * log.info("controller -- updateReplyView() -- 호출");
	 * 
	 * //mav.setViewName("/content_view/{bid}/reply/{rid}");
	 * mav.addObject("content_view", service.getBoard(boardVO.getB_index()));
	 * //rvo.setRid(md.getUsername()); // 로그인한 사람 id정보를 rvo 댓글작성자 id인 rid에 넣어줌
	 * 
	 * mav.addObject("listComment", service.listComment(rvo));
	 * mav.addObject("getComment", service.getComment(rvo));
	 * 
	 * System.out.println("service.listComment(rvo) = " + service.listComment(rvo));
	 * System.out.println("service.getComment(rvo) = "+ service.getComment(rvo));
	 * 
	 * // @AuthenticationPrincipal MemberDetails md 유저정보 가져오기 //
	 * model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); if
	 * (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
	 * log.info("로그인한 사람 이름 - " + md.getmember().getName());
	 * mav.addObject("username", md.getmember().getName());
	 * mav.addObject("member_id", md.getUsername()); } return mav; }
	 */

}
