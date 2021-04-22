package com.share.nanu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.page.Criteria;

@Mapper
public interface BoardShowsMapper {
	
	// aside 리스트
	public List<BoardVO> asielist(); // 인증게시판 리스트
	
	// 페이징 리스트
	public List<BoardVO> getlistWithPaging(Criteria cri); // 페이징 리스트
	public int getTotalCount(Criteria cri); // 게시글 수 카운트
	
	// 콘텐트 뷰
	public BoardVO read(int b_index); // 인증게시판 콘텐트뷰, modify view
	public void hitUpdate(BoardVO boardVO); // 조회수
	
	// 글 수정
	public void modify(BoardVO boardVO); // 게시글 수정

	// 글 삭제
	public void delete(int b_index); // 게시글 삭제
	
	// 글 입력
	public void insert(BoardVO boardVO); // 게시글 입력
	
	// 이미지 업로드
	/* public void uploadFile(HashMap<String, Object> vo); */
	
	//게시판 글번호
	public int getBindex(BoardVO boardVO);
	
	//이미지 업로드
	public void uploadFile(AttachmentVO attachmentVO);

	// 댓글 리스트
	public List<BoardreplyVO> listComment(BoardreplyVO rvo);
	
	// 댓글 입력
	public void insertReply(BoardreplyVO rvo);
	
	// 댓글 읽기
	public BoardreplyVO getComment(BoardreplyVO rvo);
	
	// 댓글 삭제
	public void removeReply(BoardreplyVO rvo);
	
	// 이미지 첨부파일 리스트
	public List<AttachmentVO> getAttachMent(AttachmentVO avo);

	// 이미지 수 카운트
	public int getAttachMentCount(AttachmentVO avo);

	// 최신댓글 하나 불러오기
	public BoardreplyVO getRecentComment(BoardreplyVO replyVO);

	//attachment 에서 삭제할 이미지 경로 가져오기
	public String getAttachmentBindex(int b_index);

	//인증게시판 글 삭제시 댓글 전부 삭제
	public void deleteReply(int b_index); 
	
	//인증 게시판 글 삭제
	public void deleteCertificationBoard(int b_index);

	//attachment에서 인증게시판 글번호에 해당하는 데이터 삭제
	public void deleteAttachment(int b_index);
	
	//댓글 수정
	public void modifyReply(BoardreplyVO brvo);
	
	//댓글수 카운트
	public int replyCount(BoardreplyVO rvo);
}
