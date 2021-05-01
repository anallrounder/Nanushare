package com.share.nanu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.share.nanu.paging.Criteria;
import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;

@Mapper
public interface QnaBoardMapper {

	// 페이징 리스트
	public List<BoardVO> getlistWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);

	// 콘텐트 뷰
	public BoardVO read(int b_index);
	public void hitUpdate(BoardVO boardVO);

	// 글 추가
	public void writeAdd(BoardVO boardVO);
	
	//문의글 수정
	public void modifyBoard(BoardVO boardVO);
	
	// 글 삭제
	public void delete(int b_index);

	//댓글 추가
	public void reply(BoardreplyVO breplyVO);
	
	//댓글 보기
	public List<BoardreplyVO> replyView(int b_index);
	
	//댓글삭제
	public void replyDelete(int b_index);

	


}