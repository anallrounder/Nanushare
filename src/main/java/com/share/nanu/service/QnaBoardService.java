package com.share.nanu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.share.nanu.paging.Criteria;
import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.mapper.QnaBoardMapper;

public interface QnaBoardService {

	// 기본 리스트
	public List<BoardVO> getlist(); 

	// 페이징
	public List<BoardVO> getlist(Criteria cri); 
	public int getTotal(Criteria cri); 

	// 콘텐트뷰
	public BoardVO getBoard(int b_index); // content view, modify view
	public void uphit(BoardVO boardVO); // 조회수

	// 문의글 추가
	public void writeInsert(BoardVO boardVO);
	
	//글 수정
	public void modifyBoard(BoardVO boardVO);
	
	
	// 글 삭제
	public void deleteBoard(int b_index);
	
	//댓글삭제
	public void deleteReply(int b_index);

	//댓글 추가
	public void replyInsert(BoardreplyVO bReplyVO);
	
	//댓글 내용
	public List<BoardreplyVO> getReplyBoard(int b_index);
	
}
