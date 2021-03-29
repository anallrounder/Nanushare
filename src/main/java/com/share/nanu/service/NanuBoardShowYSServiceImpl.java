package com.share.nanu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	private NanuBoardShowYSMapper nbsMapper;
	
	// 인증게시판 리스트
	@Override
	public List<BoardVO> getlist() {
		log.info("인증게시판 서비스 getlist()");
		return nbsMapper.getlist();
	}

	// 페이징 리스트
	@Override
	public List<BoardVO> getlist(Criteria cri) {
		log.info("인증게시판 서비스 페이징 getlist(cir)");
		return nbsMapper.getlistWithPaging(cri);
	}
	
	// 페이징 - 게시글 수 카운트
	@Override
	public int getTotal(Criteria cri) {
		log.info("인증게시판 서비스 글 갯수 카운트 getTotal(cir)");
		return nbsMapper.getTotalCount(cri);
	}
	
	// 인증게시판 콘텐트 뷰
	@Override
	public BoardVO getBoard(int b_index) {
		log.info("인증게시판 서비스 콘텐트뷰 getBoard()");
		return nbsMapper.read(b_index);
	}
	
	// 인증게시판 글 조회수
	@Override
	public void uphit(BoardVO boardVO) {
		log.info("인증게시판 서비스 글 조회수 uphit()");
		nbsMapper.hitUpdate(boardVO);
	}
	
	// 게시글 수정사항 업데이트
	@Override
	public void modifyBoard(BoardVO boardVO) {
		log.info("인증게시판 서비스 글 수정 modifyBoard()");
		nbsMapper.modify(boardVO);
	}
	
	// 인증게시판 글 삭제
	@Override
	public void deleteBoard(int b_index) {
		log.info("인증게시판 서비스 글 삭제 deleteBoard()");
		nbsMapper.delete(b_index);
	}
	
	// 글 입력
	@Override
	public void writeBoard(BoardVO boardVO) {
		log.info("인증게시판 서비스 글 입력 writeBoard()");
		nbsMapper.insert(boardVO);
	}
	// 이미지
	@Override
	public void fileUpload(int attach_num, String originname, String path) {
		HashMap<String, Object> vo = new HashMap<>();
		vo.put("attach_num", attach_num);
		vo.put("originname", originname);
		vo.put("path", path);
		nbsMapper.uploadFile(vo);
	}
	

}
