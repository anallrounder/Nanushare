//혜선 인증게시판 컨트롤러 작성 03.22_화ㅣ
// https://www.tutorialrepublic.com/twitter-bootstrap-button-generator.php
package com.share.nanu.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.page.Criteria;
import com.share.nanu.page.pageVO;
import com.share.nanu.service.NanuBoardShowYSService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
//https://kyuhyuk.kr/article/spring-boot/2020/07/21/Spring-Boot-JPA-MySQL-Board-Post-Update-Delete

@Slf4j
@AllArgsConstructor
@Controller
@RequestMapping("/board/shows/*")
public class NanuBoardShowYSController {

	@Autowired
	private NanuBoardShowYSService nbsService;
	
	// 인증게시판 리스트 test
	@GetMapping("/list")
	public String boardShowYS(Model model) {
		log.info("인증게시판 리스트 컨트롤러");
		model.addAttribute("list", nbsService.getlist());
		return "board_show/yourSupportList";
	}
	
	// 인증게시판 페이징 list
	@GetMapping("/plist")
	public String boardShowPaging(Criteria cri, Model model) throws Exception {
		log.debug("인증게시판 컨트롤러 페이징 리스트");
		model.addAttribute("plist", nbsService.getlist(cri));
		
		int total = nbsService.getTotal(cri);
		model.addAttribute("pageMaker", new pageVO(cri, total));
		return "board_show/yourSupportList";
	}
	
	// 인증게시판 컨텐트뷰 - 체크
	@GetMapping("/content_view")
	public String boardShowContent(BoardVO boardVO, Model model) throws Exception {
		log.debug("인증게시판 컨트롤러 컨텐트뷰");
		nbsService.uphit(boardVO);
		model.addAttribute("content_view", nbsService.getBoard(boardVO.getB_index()));
		return "board_show/yourSupportContent";
	}
	
	// 수정창 보기 - 체크
	@GetMapping("/modify_view")
	public String bsModiview(BoardVO boardVO, Model model) throws Exception {
		log.debug("인증게시판 컨트롤러 컨텐트뷰");
		model.addAttribute("modify_view", nbsService.getBoard(boardVO.getB_index()));
		return "board_show/ysModifyView";
	}
	
	// 수정 내용 업데이트 -> 오류남. 수정해야함
	@PostMapping("/modify")
	public String bsModify(BoardVO boardVO) throws Exception {
		log.info("인증게시판 컨트롤러  -- modify() -- 호출");
		nbsService.modifyBoard(boardVO);
		return "redirect:content_view"; /* ?b_index=${modify_view.b_index} */
		//return "redirect:plist";
	}
	
	// 게시글 삭제 - 체크
	@GetMapping("/delete")
	public String bsDelete(BoardVO boardVO) throws Exception {
		log.info("인증게시판 컨트롤러 -- delete() -- 호출");
		nbsService.deleteBoard(boardVO.getB_index());
		return "redirect:plist";
	}
	
	// 글작성 페이지
	@GetMapping("/write_view")
	public String vsWriteView(Model model) throws Exception {
		log.debug("인증게시판 컨트롤러  -- write_view() -- 호출");
		return "board_show/ysWriteView";
	}
	
	// 글 작성 -> 로그인한 사용자의 아이디를 어떻게 불러올 것인가 고민해봐야한다.
	@PostMapping("/write")
	public String bsWrite(MultipartHttpServletRequest multi, BoardVO boardVO, AttachmentVO attachmentVO, Model model) throws Exception {
		log.info("인증게시판 컨트롤러  -- write() -- 호출");
		nbsService.writeBoard(boardVO);
		// 멤버아이디를 이렇게 가져오는게 맞을까? 아니다. 받아올수가 없네. 로그인한 사용자 정보를 받아와야함. 일단 테스트는 쿼리문에서 써야겠다.
		//model.addAttribute("getMember_id", nbsService.getBoard(boardVO.getMember_id()));
		
		log.info("fileUpload");
		// 이미지 저장 절대경로
		String path = "C:\\Users\\Hyeseon\\eclipse-workspace\\Nanushare\\src\\main\\webapp\\resources\\attachment";
		
		File dir = new File(path);
	  	if(!dir.isDirectory()) {
	  		dir.mkdir();
	  	}
	  			  	
	  	List<MultipartFile> mf = multi.getFiles("file");
	  	if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
	  		
	  	}else {
	  		for(int i = 0; i < mf.size(); i++) { //파일명 중복 처리
	  			
	  			UUID uuid = UUID.randomUUID();
	  			//본래 파일명
	  			String originalfileName = mf.get(i).getOriginalFilename();		  		
	  			String ext = FilenameUtils.getExtension(originalfileName);
	  			//저장 될 파일명
	  			//String savefileName=uuid+"."+ext; 
  		
	  			String savePath = path +"\\" + originalfileName; // 저장 될 파일 경로

	            mf.get(i).transferTo(new File(savePath)); // 파일 저장
	 
	            nbsService.fileUpload(attachmentVO.getAttach_num(), originalfileName, savePath);
	            }
	        }
		return "redirect:content_view";
	}
	
}
