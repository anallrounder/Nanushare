package com.share.nanu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.mapper.NanuBoardShowYSMapper;
import com.share.nanu.page.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class NanuBoardShowYSServiceImpl implements NanuBoardShowYSService {
	
	@Autowired
	private NanuBoardShowYSMapper mapper;
	
	// 인증게시판 리스트
	@Override
	public List<BoardVO> getlist() {
		log.info("인증게시판 서비스 getlist()");
		return mapper.getlist();
	}

	// 페이징 리스트
	@Override
	public List<BoardVO> getlist(Criteria cri) {
		log.info("인증게시판 서비스 페이징 getlist(cir)"+ cri);
		return mapper.getlistWithPaging(cri);
	}
	
	// 페이징 - 게시글 수 카운트
	@Override
	public int getTotal(Criteria cri) {
		log.info("인증게시판 서비스 글 갯수 카운트 getTotal(cir)");
		return mapper.getTotalCount(cri);
	}
	
	// 인증게시판 콘텐트 뷰
	@Override
	public BoardVO getBoard(int b_index) {
		log.info("인증게시판 서비스 콘텐트뷰 getBoard()");
		return mapper.read(b_index);
	}
	
	// 인증게시판 글 조회수
	@Override
	public void uphit(BoardVO boardVO) {
		log.info("인증게시판 서비스 글 조회수 uphit()");
		mapper.hitUpdate(boardVO);
	}
	
	// 게시글 수정사항 업데이트
	@Override
	public void modifyBoard(BoardVO boardVO) {
		log.info("인증게시판 서비스 글 수정 modifyBoard()");
		mapper.modify(boardVO);
	}
	
	// 인증게시판 글 삭제
	@Override
	public void deleteBoard(int b_index) {
		log.info("인증게시판 서비스 글 삭제 deleteBoard()");
		mapper.delete(b_index);
	}
	
	// 글 입력
	@Override
	public void writeBoard(BoardVO boardVO) {
		log.info("인증게시판 서비스 글 입력 writeBoard()");
		mapper.insert(boardVO);
	}
	// 이미지
	/*
	 * @Override public void fileUpload(int attach_num, String originname, String
	 * path) { HashMap<String, Object> vo = new HashMap<>(); vo.put("attach_num",
	 * attach_num); vo.put("originname", originname); vo.put("path", path);
	 * mapper.uploadFile(vo); }
	 */
	
	//게시판 글번호
	@Override
	public int getBindex(BoardVO boardVO) {
		
		return mapper.getBindex(boardVO);
	}
	
	//이미지 첨부
	@Override
	public void fileUpload(AttachmentVO attachmentVO) {
		mapper.uploadFile(attachmentVO);
	}
	
	
	

}
