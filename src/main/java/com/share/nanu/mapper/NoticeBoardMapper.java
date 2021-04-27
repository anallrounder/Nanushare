package com.share.nanu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.BoardVO;
import com.share.nanu.paging.Criteria;

@Mapper
public interface NoticeBoardMapper {

	// 일반 리스트
	public List<BoardVO> getlist(); // 인증게시판 리스트

	// 페이징 리스트
	public List<BoardVO> getlistWithPaging(Criteria cri); // 페이징 리스트

	public int getTotalCount(Criteria cri); // 게시글 수 카운트

	// 콘텐트 뷰
	public BoardVO read(int b_index); // 인증게시판 콘텐트뷰, modify view

	public void hitUpdate(BoardVO boardVO); // 조회수

	// 글 삭제
	public void delete(int b_index); // 게시글 삭제

	// 글 입력
	public void insert(BoardVO boardVO); // 게시글 입력

	// 글 수정
	public void modify(BoardVO boardVO); // 게시글 수정

	// 게시판 글번호
	public int getBindex(BoardVO boardVO);
	
	// aside에 뿌려줄 최신 공지사항
	public List<BoardVO> asideNlist();

}