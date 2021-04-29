package com.share.nanu.service;

import java.util.List;

import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.page.Criteria;

public interface BoardShowsService {
	
	/* 인증게시판 board service */
	
	/* 게시글 */

	// 어사이드용 리스트
	public List<BoardVO> asidelist(); // 인증게시판 리스트 불러오기
	
	// 인증게시판 페이징 리스트
	public List<BoardVO> getlist(Criteria cri);  
	
	// 게시글 수 count
	public int getTotal(Criteria cri); 
	
	// 글번호에 맞는 게시글 불러오기 - content view, modify view
	public BoardVO getBoard(int b_index); 
	
	// 조회수
	public void uphit(BoardVO boardVO); 
	
	// 게시글 수정사항 업데이트
	public void modifyBoard(BoardVO boardVO);

	// 글 삭제 - 미사용 
	public void deleteBoard(int b_index);
	
	// 글쓰기 - 디비 저장
	public void writeBoard(BoardVO boardVO); // 글 비 저장
	

	/* 댓글 */
	
	// 댓글 리스트 불러오기
	public List<BoardreplyVO> listComment(BoardreplyVO rvo);
	
	// 댓글 수 count
	public int replyCount(BoardreplyVO rvo); 
	
	// 댓글 입력
	public void insertReply(BoardreplyVO rvo);

	// 댓글 하나 불러오기
	public BoardreplyVO getComment(BoardreplyVO rvo);
	
	// 사용자의 최신 댓글 불러오기
	public BoardreplyVO getRecentComment(BoardreplyVO rvo);
		
	//댓글 수정
	public void modifyReply(BoardreplyVO brvo);
	
	// 댓글 하나 삭제 
	public void remove(BoardreplyVO rvo);

	
	/* 썸네일 이미지 첨부파일 */
	
	// 첨부파일 리스트
	public List<AttachmentVO> getAttachment(AttachmentVO avo);
	
	// 첨부파일 갯수 카운트
	public int getAttachMentCount(AttachmentVO avo);
	
	//게시판 글번호 가져오기
	public int getBindex(BoardVO boardVO);
	
	//이미지 첨부
	public void fileUpload(AttachmentVO attachmentVO);

	
	/* 게시판 삭제 + 댓글 + 첨부파일 삭제 */

	//인증게시판 글 삭제시 댓글 전부 삭제
	public void deleteReply(int b_index);
	
	//attachment 에서 삭제할 이미지 경로 가져오기
	public String getAttachmentBindex(int b_index);
		
	//attachment에서 인증게시판 글번호에 해당하는 데이터 삭제
	public void deleteAttachment(int b_index);
	
	//인증글 삭제
	public void deleteCertificationBoard(int b_index);

}
