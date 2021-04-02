package com.share.nanu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.share.nanu.mapper.NoticeBoardMapper;
import com.share.nanu.paging.Criteria;
import com.share.nanu.VO.BoardVO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	@Autowired
	private NoticeBoardMapper nbMapper;
	
	// 게시판 리스트
	@Override
	public List<BoardVO> getlist() {
		log.info("getlist()");
		return nbMapper.getlist();
	}

	// 페이징 리스트
	@Override
	public List<BoardVO> getlist(Criteria cri) {
		log.info("getlist(cri)");
		return nbMapper.getlistWithPaging(cri);
	}
	
	// 페이징 - 게시글 수 카운트
	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotal(cri)");
		return nbMapper.getTotalCount(cri);
	}
	
	// 컨텐트뷰
	@Override
	public BoardVO getBoard(int b_index) {
		log.info("getBoard()");
		return nbMapper.read(b_index);
	}
	
	// 인증게시판 글 조회수
	@Override
	public void uphit(BoardVO boardVO) {
		log.info("글 조회수 uphit()");
		nbMapper.hitUpdate(boardVO);
	}
	
	// 수정사항 업데이트
	@Override
	public void modifyBoard(BoardVO boardVO) {
		log.info("글 수정 modifyBoard()");
		nbMapper.modify(boardVO);
	}
	
	// 글삭제
	@Override
	public void deleteBoard(int b_index) {
		log.info("글 삭제 deleteBoard()");
		nbMapper.delete(b_index);
	}
	
	// 글쓰기
	@Override
	public void writeBoard(BoardVO boardVO) {
		log.info("글 쓰기 writeBoard()");
		nbMapper.insert(boardVO);
	}
	
}
