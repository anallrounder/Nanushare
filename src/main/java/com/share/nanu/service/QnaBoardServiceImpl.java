package com.share.nanu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.share.nanu.mapper.QnaBoardMapper;
import com.share.nanu.paging.Criteria;
import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	
	@Autowired
	private QnaBoardMapper mapper;
	
	//리스트
	@Override
	public List<BoardVO> getlist() {
		
		return mapper.getlist();
	}

	// 페이징 리스트
	@Override
	public List<BoardVO> getlist(Criteria cri) {
		
		return mapper.getlistWithPaging(cri);
	}
	
	// 페이징 - 게시글 수 카운트
	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}
	
	// 콘텐트 뷰
	@Override
	public BoardVO getBoard(int b_index) {
		
		return mapper.read(b_index);
	}
	
	//글 조회수
	@Override
	public void uphit(BoardVO boardVO) {
		
		mapper.hitUpdate(boardVO);
	}
	
	//문의글 추가
	@Override
	public void writeInsert(BoardVO boardVO) {
		
		mapper.writeAdd(boardVO);
	}
	
	//문의글 수정
	@Override
	public void modifyBoard(BoardVO boardVO) {
		log.info("boarVO : " + boardVO);
		mapper.modifyBoard(boardVO);
	}
	
	
	// 인증게시판 글 삭제
	@Override
	public void deleteBoard(int b_index) {
		log.info("글 삭제 deleteBoard()");
		mapper.delete(b_index);
	}
	
	
	//댓글 추가
	@Override
	public void replyInsert(BoardreplyVO breplyVO) {
		mapper.reply(breplyVO);
	}

	@Override
	public List<BoardreplyVO> getReplyBoard(int b_index) {
		
		return mapper.replyView(b_index);
	}

	

	

	
}
