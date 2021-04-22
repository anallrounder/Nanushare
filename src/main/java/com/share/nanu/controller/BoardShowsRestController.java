//혜선 인증게시판 컨트롤러 작성 03.22_화ㅣ
// https://www.tutorialrepublic.com/twitter-bootstrap-button-generator.php
package com.share.nanu.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.page.Criteria;
import com.share.nanu.page.pageVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.BoardShowsService;
import com.share.nanu.service.NoticeBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
//https://kyuhyuk.kr/article/spring-boot/2020/07/21/Spring-Boot-JPA-MySQL-Board-Post-Update-Delete

@Slf4j
@AllArgsConstructor
@RestController
//@RequestMapping("/board/shows/*")
public class BoardShowsRestController {

	@Autowired
	private BoardShowsService service;
	
	/* 게시글 */
	// 인증게시판 페이징 list
	@GetMapping("/board/shows/list")
	public ModelAndView boardShowPaging(Criteria cri, ModelAndView mav, AttachmentVO avo,
			@AuthenticationPrincipal MemberDetails md) throws Exception {
		log.info("인증게시판 컨트롤러 페이징 리스트" + cri);

		mav.addObject("list", service.getlist(cri));

		// 절대경로 -> 상대경로
		List<AttachmentVO> attach = service.getAttachment(avo);
		log.info("path : " + attach.get(0).getPath());

		// 썸네일을 불러올때마다 db 에있는 모든 경로를 매번 바꾸어 주어야 해서 매우 비효율적...
		for (int i = 0; i < attach.size(); i++) {
			String attachPath = attach.get(i).getPath(); // 절대 경로 가지고 오기
			log.info("attachMent table path : " + attachPath); // attachment table에 저장된 path

			String RelativePath = new File(attachPath).toURI().getPath(); // 절대경로에 \\ 설정 되어 있다. -> //로 수정
			log.info("절대경로 -> 상대경로로 치환중 : " + RelativePath);

			int resources = RelativePath.indexOf("/resources"); // /resources까지 인덱스 번호
			log.info("/resources 까지의 인덱스 번호 :  " + resources);

			String ChangeRelativePath = RelativePath.substring(resources);
			log.info("완성된 상대 경로 : " + ChangeRelativePath);

			attach.get(i).setPath(ChangeRelativePath);
			log.info("저장되어진 경로 : " + attach.get(i).getPath());
		}

		log.info("getAttachMent b_index");
		mav.addObject("attachment", attach);

		log.info("getAttachMent b_index Coubt");
		mav.addObject("attachMentCount", service.getAttachMentCount(avo));

		int total = service.getTotal(cri);
		mav.addObject("pageMaker", new pageVO(cri, total));

		// @AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		/* model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); */
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			mav.addObject("username", md.getmember().getName());
		}

		mav.setViewName("board_show/yourSupportList");

		return mav;
	}

	// 인증게시판 게시글 컨텐트뷰 + 댓글 보기
	@GetMapping("/board/shows/content_view/{b_index}")
	public ModelAndView content_view(BoardVO boardVO, BoardreplyVO rvo, ModelAndView mav,
			@AuthenticationPrincipal MemberDetails md) throws Exception {
		log.info("controller -- content_view -- 호출");
		service.uphit(boardVO);
		
		mav.addObject("list", service.asidelist()); // 인증게시판 aisde에 최신순 뿌려주는 리스트
		//mav.addObject("nlist", service.asideNlist()); // 인증게시판 aisde에 최신순 뿌려주는 리스트
		
		mav.setViewName("board_show/yourSupportContent"); // 이동할 웹페이지 주소

		mav.addObject("content_view", service.getBoard(boardVO.getB_index())); // 게시판 글 불러오기
		log.info("컨텐트 뷰 테스트 BordVO.getB_index()= " + boardVO.getB_index()); // 확인

		mav.addObject("listComment", service.listComment(rvo)); // 게시판글의 댓글 리스트 불러오기
		log.info("컨트롤러 댓글 리스트 테스트 service.listComment(rvo)= " + rvo); // 확인

		mav.addObject("replyCount", service.replyCount(rvo)); // 댓글 수 카운트
		log.info("컨트롤러 댓글 수 확인 service.replyCount(rvo) = " + service.replyCount(rvo)); // 확인

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

	// 글작성 페이지
	@GetMapping("/my/board/shows/write_view")
	public ModelAndView vsWriteView(ModelAndView mav, @AuthenticationPrincipal MemberDetails md) throws Exception {
		log.info("인증게시판 컨트롤러  -- write_view() -- 호출");

		mav.setViewName("board_show/ysWriteView");

		// @AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		// model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate()));
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			mav.addObject("username", md.getmember().getName());
			mav.addObject("member_id", md.getUsername());
		}
		return mav;
	}

	// 수정창 보기 - 체크
	@GetMapping("/my/board/shows/modify_view/{b_index}")
	public ModelAndView bsModiview(BoardVO boardVO, ModelAndView mav) throws Exception {
		log.info("인증게시판 컨트롤러 컨텐트뷰");
		mav.addObject("modify_view", service.getBoard(boardVO.getB_index()));
		mav.setViewName("board_show/ysModifyView");
		return mav;
	}

	// 인증게시판 게시글 수정
	@PutMapping("/board/shows/modify")
	public ResponseEntity<String> bsModify(@RequestBody BoardVO boardVO) throws Exception {
		log.info("인증게시판 컨트롤러  -- modify() -- 호출");
		log.info("boardVO" + boardVO);

		ResponseEntity<String> entity = null;

		try {
			service.modifyBoard(boardVO); // 수정 업데이트

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 인증게시판 게시글 삭제
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

		// 1. 썸네일 로컬에서 삭제
		String path = service.getAttachmentBindex(bvo.getB_index()); // attachment 에서 삭제할 썸네일 이미지 경로 가져오기
		if (path != null) {

			File deleteFile = new File(path);
			if (deleteFile.exists()) { // 파일의 유뮤 체크
				deleteFile.delete();

				log.info("썸네일 삭제");
			} else {
				log.info("삭제할 썸네일이 업습니다.");
			}

			service.deleteAttachment(bvo.getB_index());
			log.info("썸네일 저장 테이블에서 삭제");

		}

		// 2. 댓글 테이블에서 해당 게시판 글번호로 댓글 전부 삭제
		service.deleteReply(bvo.getB_index());
		log.info("인증게시판 댓글 삭제");

		// 3. board 테이블에서 인증글 삭제
		service.deleteCertificationBoard(bvo.getB_index());
		log.info("인증게시판 글 삭제");

		mav.setViewName("/board_show/yourSupportList");
		return mav;

	}

	/* 댓글 */

	// 댓글 입력 insert
	// [Spring] ResponseEntity는 왜 쓰는 것이며 어떻게 쓰는걸까? https://a1010100z.tistory.com/106
	@ResponseBody
	@PostMapping("board/shows/reply_insert")
	public int reply_insert(@RequestBody BoardreplyVO rvo, BoardreplyVO replyVO, Model model,
			@AuthenticationPrincipal MemberDetails md) throws Exception {

		service.insertReply(rvo); // 댓글 입력

		int send = service.getRecentComment(rvo).getR_num();
		System.out.println(service.getRecentComment(rvo).getR_num());

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

	// 댓글 수정
	@PutMapping("board/shows/replyModify")
	public ResponseEntity<String> relpyModify(ModelAndView mav, @RequestBody BoardreplyVO brvo) {
		log.info("댓글 수정");
		log.info("brvo : " + brvo);
		ResponseEntity<String> entity = null;
		try {
			service.modifyReply(brvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// ck 에디터
	@PostMapping("/my/board/shows/imageUpload")
	public void imgUpLoad(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload)
			throws Exception {

		log.info("로컬이미지 업로드");
		// log.info("bvo : " + bvo);
		OutputStream out = null;
		PrintWriter writer = null;
		JsonObject json = new JsonObject();

		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/attachment");
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String datefolder = sdf.format(dt).toString();
		System.out.println("오늘 날짜 : " + datefolder);

		uploadPath = uploadPath + "\\" + datefolder; // 업로드 경로
		System.out.println("ck에디터 이미지 업로드 패스 : " + uploadPath);

		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");

		String uid = UUID.randomUUID().toString();

		try {
			String fileName = upload.getOriginalFilename(); // 원본이름
			fileName = uid + "_" + fileName; // 중복방지 랜덤 문자열
			log.info("파일 이름 : " + fileName);
			byte[] bytes = upload.getBytes();

			// String ckEditorUpLoadPath = uploadPath +"\\" + uid + "_" + fileName ;

			File dir = new File(uploadPath);
			if (!dir.isDirectory()) {
				dir.mkdir();
			}

			writer = response.getWriter();
			String fileUrl = "/resources/attachment" + "/" + datefolder + "/" + fileName; // path
			// 업로드시 이미지 정보에 표시 되어 지는 url, 파일이 저장되어 있는 위치, 이름이 같아야 한다!!!!, resources 에서부터
			// 설정하지 않으면 views아래에서 찾는다.

			upload.transferTo(new File(uploadPath + "\\" + fileName));

			json.addProperty("uploaded", 1);
			json.addProperty("fileName", fileName);
			json.addProperty("url", fileUrl);

			writer.println(json);

			// writer.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1,
			// \"url\":\"" + fileUrl + "\"}");

			writer.flush();

		} catch (Exception e) { // TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (writer != null) {
					writer.close();
				}
			} catch (Exception e) { // TODO:handleexception
				e.printStackTrace();
			}
		}
		return;
	}

	// 글 작성 -> 로그인한 사용자의 아이디를 어떻게 불러올 것인가 고민해봐야한다.
	// @AuthenticationPrincipal MemberDetails md 로 현재 로그인 되어 있는 유저의 정보를 받아올 수 있다.
	// md.getusername() --> 로그인 되어 있는 유저의 member_id -->MemberDetails 참조
	// 가져와서 board.setMember_id(md.getusername) boardVO 객체에 로그인 되어 있는 유저 member_id저장
	// 서비스에 boardVO를 넘겨주고 DB에 저장
	@ResponseBody
	@PostMapping("/my/board/shows/write")
	public int bsWrite(@RequestBody BoardVO boardVO) throws Exception {

		log.info("인증게시판 컨트롤러  -- write() -- 호출");
		log.info("boardvo : " + boardVO);
		service.writeBoard(boardVO);
		// 멤버아이디를 이렇게 가져오는게 맞을까? 아니다. 받아올수가 없네. 로그인한 사용자 정보를 받아와야함. 일단 테스트는 쿼리문에서 써야겠다.
		// model.addAttribute("getMember_id",
		// nbsService.getBoard(boardVO.getMember_id()));

		int bIndex = service.getBindex(boardVO);
		log.info("bindex : " + bIndex);
		return bIndex;
	}

	////////////////////////////////////////////////////////////////////

	@PostMapping("/my/board/shows/upLoadThumNail")
	public ResponseEntity<String> multipartUpload(
			 AttachmentVO attachmentVO, MultipartHttpServletRequest multiple
			) throws Exception {

		log.info("인증게시판 컨트롤러  -- write() -- 호출");
		log.info(multiple.getParameter("b_index"));
		log.info("attachmentVO : " + attachmentVO);
		log.info("formData 파일 : "+ multiple.getParameter("file"));
		
		final int THUMNAIL_WIDTH = 264;
		final int THUMNAIL_HEIGHT = 336;
		UUID uuid = UUID.randomUUID();

		log.info("fileUpload");
		
		ResponseEntity<String> entity = null;
		
		try {
			String path = multiple.getSession().getServletContext().getRealPath("/resources/attachment");
			log.info("attachment Path : " + path);

			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String datefolder = sdf.format(dt).toString();
			log.info("오늘날짜로 생성한 폴더 이름 : " + datefolder);

			path = path + "\\" + datefolder;
			log.info("오늘날짜로 생성한 폴더 경로 : " + path);

			File dir = new File(path);			
			if (!dir.isDirectory()) {
				dir.mkdir();
			}
			log.info("오늘날짜로 폴더 생성 확인 : " + dir);

			List<MultipartFile> mf = multiple.getFiles("file");
			log.info("mf : "+mf);
			
			
			
			if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
				log.info("썸네일이 없습니다.");
			} else {
				for (int i = 0; i < mf.size(); i++) { // 파일명 중복 처리

					// 본래 파일명
					String originalfileName = mf.get(i).getOriginalFilename();// 원본이름
					String uuidName = uuid + "_" + originalfileName;// 랜덤문자열 파일이름 중복 방지
					String extension = FilenameUtils.getExtension(originalfileName);// 확장자
					// 저장 될 파일명
					// String savefileName=uuid+"."+ext;

					String savePath = path + "\\" + uuidName; // 저장 될 파일 경로

					mf.get(i).transferTo(new File(savePath)); // 파일 저장

					// 썸네일

					File originFile = new File(savePath);

					String thumNailName = "thumNail_" + uuid + "_" + originalfileName;
					savePath = path + "\\" + thumNailName;
					log.info("썸네일 경로 : " + savePath);
					File thumNail = new File(path + "\\" + thumNailName);

					BufferedImage originalImage = ImageIO.read(originFile);
					
					BufferedImage thumNailImage = new BufferedImage(THUMNAIL_WIDTH, THUMNAIL_HEIGHT,
					BufferedImage.TYPE_3BYTE_BGR);
					Graphics2D graphic = thumNailImage.createGraphics();
					graphic.drawImage(originalImage, 0, 0, THUMNAIL_WIDTH, THUMNAIL_HEIGHT, null);

					if (extension.equals("jpg")) {
						ImageIO.write(thumNailImage, "jpg", thumNail);
					} else {
						ImageIO.write(thumNailImage, "png", thumNail); // png만 나옴
					}
					log.info("썸네일 생성");

					// 로그 기록을 system.out.println에서 log.info로수정시 로딩속도 향상 그래도 아직 조금 느림

					attachmentVO.setOriginname(originalfileName);
					attachmentVO.setPath(savePath);
					attachmentVO.setExtension(extension);
					attachmentVO.setB_index(Integer.parseInt(multiple.getParameter("b_index")));
					attachmentVO.setUuidName(thumNailName);
					service.fileUpload(attachmentVO);
				}
			}
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		

		
		return entity;
	}

}
