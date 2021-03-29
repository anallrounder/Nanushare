package com.share.nanu.service;

import java.util.List;

import com.share.nanu.paging.Criteria;
import com.share.nanu.VO.BoardVO;

public interface NoticeBoardService {

	// 기본 리스트
		public List<BoardVO> getlist(); // 게시판 리스트 불러오기
		
		// 페이징
		public List<BoardVO> getlist(Criteria cri); // 게시판 페이징 리스트 
		public int getTotal(Criteria cri); // 게시글 수 count
		
		// 콘텐트뷰
		public BoardVO getBoard(int b_index); // content view, modify view
		public void uphit(BoardVO boardVO); // 조회수
		
		// 수정사항 업데이트
		public void modifyBoard(BoardVO boardVO);

		// 글삭제
		public void deleteBoard(int b_index);
		
		// 글쓰기
		public void writeBoard(BoardVO boardVO);
}
