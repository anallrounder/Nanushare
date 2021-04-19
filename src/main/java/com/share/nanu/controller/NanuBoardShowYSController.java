//혜선 인증게시판 컨트롤러 작성 03.22_화ㅣ
// https://www.tutorialrepublic.com/twitter-bootstrap-button-generator.php
package com.share.nanu.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.nimbusds.oauth2.sdk.util.StringUtils;
import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.page.Criteria;
import com.share.nanu.page.pageVO;
import com.share.nanu.security.MemberDetails;
import com.share.nanu.service.NanuBoardShowYSService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Controller
//@RequestMapping("/board/shows/*")
public class NanuBoardShowYSController {

	@Autowired
	private NanuBoardShowYSService service;

	// 인증게시판 리스트 test
	/*
	 * @GetMapping("/testlist") public String boardShowYS(Model model) {
	 * log.info("인증게시판 리스트 컨트롤러"); model.addAttribute("testlist",
	 * service.getlist()); return "board_show/yourSupportList"; }
	 */

	// 인증게시판 페이징 list
	@RequestMapping("/board/shows/list")
	public String boardShowPaging(Criteria cri, Model model, AttachmentVO avo,
			@AuthenticationPrincipal MemberDetails md) throws Exception {
		log.debug("인증게시판 컨트롤러 페이징 리스트" + cri);
		model.addAttribute("list", service.getlist(cri));

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
		model.addAttribute("attachment", attach);

		log.info("getAttachMent b_index Coubt");
		model.addAttribute("attachMentCount", service.getAttachMentCount(avo));

		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new pageVO(cri, total));

		// @AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		/* model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); */
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			model.addAttribute("username", md.getmember().getName());
		}

		return "board_show/yourSupportList";
	}

	// 인증게시판 컨텐트뷰 - 체크
	@GetMapping("/board/shows/content_view")
	public String boardShowContent(BoardVO boardVO, Model model, @AuthenticationPrincipal MemberDetails md)
			throws Exception {
		log.debug("인증게시판 컨트롤러 컨텐트뷰");
		service.uphit(boardVO);
		model.addAttribute("content_view", service.getBoard(boardVO.getB_index()));

		// @AuthenticationPrincipal MemberDetails md 유저정보 가져오기
		/* model.addAttribute("daymoney", mainService.getContent(dnvo.getDntdate())); */
		if (md != null) { // 로그인을 해야만 md가 null이 아님, 일반회원, 관리자 ,소셜로그인 정상 적용
			log.info("로그인한 사람 이름 - " + md.getmember().getName());
			model.addAttribute("username", md.getmember().getName());
		}

		return "board_show/yourSupportContent";
	}

	// 수정창 보기 - 체크
	@GetMapping("/my/board/shows/modify_view")
	public String bsModiview(BoardVO boardVO, Model model) throws Exception {
		log.debug("인증게시판 컨트롤러 컨텐트뷰");
		model.addAttribute("modify_view", service.getBoard(boardVO.getB_index()));
		return "board_show/ysModifyView";
	}

	// 수정 내용 업데이트 -> 오류남. 수정해야함
	/*
	 * @PostMapping("/my/board/shows/modify") public String bsModify(BoardVO
	 * boardVO) throws Exception { log.info("인증게시판 컨트롤러  -- modify() -- 호출");
	 * service.modifyBoard(boardVO); return "redirect:content_view";
	 * ?b_index=${modify_view.b_index} // return "redirect:plist"; }
	 */

	// 게시글 삭제 - 체크
	@GetMapping("/my/board/shows/delete")
	public String bsDelete(BoardVO boardVO) throws Exception {
		log.info("인증게시판 컨트롤러 -- delete() -- 호출");
		service.deleteBoard(boardVO.getB_index());
		return "redirect:plist";
	}

	// 글작성 페이지
	@GetMapping("/my/board/shows/write_view")
	public String vsWriteView(Model model) throws Exception {
		log.debug("인증게시판 컨트롤러  -- write_view() -- 호출");
		return "board_show/ysWriteView";
	}

	// ck 에디터
	@PostMapping("/my/board/shows/imageUpload")
	public void imgUpLoad(HttpServletRequest request, HttpServletResponse response,

			@RequestParam MultipartFile upload) throws Exception {

		log.info("로컬이미지 업로드");
		//log.info("bvo : " + bvo);
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
			String fileName = upload.getOriginalFilename(); //원본이름
			fileName = uid + "_" + fileName; //중복방지 랜덤 문자열
			log.info("파일 이름 : " + fileName);			
			byte[] bytes = upload.getBytes();

			// String ckEditorUpLoadPath = uploadPath +"\\" + uid + "_" + fileName ;

			File dir = new File(uploadPath);
			if (!dir.isDirectory()) {
				dir.mkdir();

			}

			writer = response.getWriter();
			String fileUrl = "/resources/attachment" + "/" + datefolder + "/" + fileName; //path
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
	@PostMapping("/my/board/shows/write")
	public String bsWrite(MultipartHttpServletRequest multiple, BoardVO boardVO, AttachmentVO attachmentVO, Model model,
			@AuthenticationPrincipal MemberDetails md) throws Exception {

		log.info("인증게시판 컨트롤러  -- write() -- 호출");

		final int THUMNAIL_WIDTH = 264;
		final int THUMNAIL_HEIGHT = 336;
		UUID uuid = UUID.randomUUID();

		String loginMember = md.getUsername();
		boardVO.setMember_id(loginMember); // 로그인한 사람
		service.writeBoard(boardVO);
		// 멤버아이디를 이렇게 가져오는게 맞을까? 아니다. 받아올수가 없네. 로그인한 사용자 정보를 받아와야함. 일단 테스트는 쿼리문에서 써야겠다.
		// model.addAttribute("getMember_id",
		// nbsService.getBoard(boardVO.getMember_id()));

		log.info("fileUpload");
		// 이미지 저장 절대경로
		// "C:\\Users\\Hyeseon\\eclipse-workspace\\Nanushare\\src\\main\\webapp\\resources\\attachment";
		// String path = "C:\\Users\\Slim 5\\바탕
		// 화면\\폴더\\eclipse-workspace\\Nanu\\src\\main\\webapp\\resources\\attachment";

		String path = multiple.getSession().getServletContext().getRealPath("/resources/attachment");
		log.info("attachment Path : " + path);

		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String datefolder = sdf.format(dt).toString();
		log.info("오늘날짜로 생성한 폴더 이름 : " + datefolder);

		path = path + "\\" + datefolder;
		log.info("오늘날짜로 생성한 폴더 경로 : " + path);

		File dir = new File(path);
		log.info("오늘날짜로 폴더 생성 확인 : " + dir);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}

		List<MultipartFile> mf = multiple.getFiles("file");
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
				attachmentVO.setB_index(service.getBindex(boardVO));
				attachmentVO.setUuidName(thumNailName);
				service.fileUpload(attachmentVO);
			}
		}
		return "/board_show/yourSupportList";
	}

}
