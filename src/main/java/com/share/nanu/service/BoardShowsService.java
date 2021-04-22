package com.share.nanu.service;

import java.util.List;

import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.page.Criteria;

public interface BoardShowsService {
	
	// 기본 리스트
	public List<BoardVO> asidelist(); // 인증게시판 리스트 불러오기
	
	// 페이징
	public List<BoardVO> getlist(Criteria cri); // 인증게시판 페이징 리스트 
	public int getTotal(Criteria cri); // 게시글 수 count
	
	// 콘텐트뷰
	public BoardVO getBoard(int b_index); // content view, modify view
	public void uphit(BoardVO boardVO); // 조회수
	
	// 게시글 수정사항 업데이트
	public void modifyBoard(BoardVO boardVO);

	// 글 삭제
	public void deleteBoard(int b_index);
	
	// 글쓰기 - 디비 저장
	public void writeBoard(BoardVO boardVO); // 글 비 저장
	
	//이미지 첨부
	public void fileUpload(AttachmentVO attachmentVO);
	
	//게시판 글번호 가져오기
	public int getBindex(BoardVO boardVO);

	/* 댓글 */
	
	// 댓글 리스트 불러오기
	public List<BoardreplyVO> listComment(BoardreplyVO rvo);
	public int replyCount(BoardreplyVO rvo); // 댓글 수 count
	
	// 댓글 입력
	public void insertReply(BoardreplyVO rvo);

	// 로그인한 사람의 댓글 하나 불러오기
	public BoardreplyVO getComment(BoardreplyVO rvo);
	
	public BoardreplyVO getRecentComment(BoardreplyVO rvo);

	// 댓글 삭제
	public void remove(BoardreplyVO rvo);

	// 첨부파일 리스트
	public List<AttachmentVO> getAttachment(AttachmentVO avo);
	
	// 첨부파일 갯수 카운트
	public int getAttachMentCount(AttachmentVO avo);

	//attachment 에서 삭제할 이미지 경로 가져오기
	public String getAttachmentBindex(int b_index);
	
	//인증게시판 글 삭제시 댓글 전부 삭제
	public void deleteReply(int b_index);

	//인증글 삭제
	public void deleteCertificationBoard(int b_index);
	
	//attachment에서 인증게시판 글번호에 해당하는 데이터 삭제
	public void deleteAttachment(int b_index);
	
	//댓글 수정
	public void modifyReply(BoardreplyVO brvo);

	
	
	

	
	

	

	
	

}
