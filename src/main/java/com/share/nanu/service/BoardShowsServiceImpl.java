package com.share.nanu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.nanu.VO.AttachmentVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.BoardreplyVO;
import com.share.nanu.mapper.BoardShowsMapper;
import com.share.nanu.page.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class BoardShowsServiceImpl implements BoardShowsService {
	
	@Autowired
	private BoardShowsMapper mapper;
	
	// 인증게시판 리스트
	@Override
	public List<BoardVO> asielist() {
		log.info("인증게시판 서비스 asielist(bvo)");
		return mapper.asielist();
	}

	// 페이징 리스트
	@Override
	public List<BoardVO> getlist(Criteria cri) {
		log.info("인증게시판 서비스 페이징 getlist(cir)"+ cri);
		return mapper.getlistWithPaging(cri);
	}
	
	// 페이징 - 게시글 수 카운트
	@Override
	public int getTotal(Criteria cri) {
		log.info("인증게시판 서비스 글 갯수 카운트 getTotal(cir)");
		return mapper.getTotalCount(cri);
	}
	
	// 인증게시판 콘텐트 뷰
	@Override
	public BoardVO getBoard(int b_index) {
		log.info("인증게시판 서비스 콘텐트뷰 getBoard()");
		return mapper.read(b_index);
	}
	
	// 인증게시판 글 조회수
	@Override
	public void uphit(BoardVO boardVO) {
		log.info("인증게시판 서비스 글 조회수 uphit()");
		mapper.hitUpdate(boardVO);
	}
	
	// 게시글 수정사항 업데이트
	@Override
	public void modifyBoard(BoardVO boardVO) {
		log.info("인증게시판 서비스 글 수정 modifyBoard()");
		mapper.modify(boardVO);
	}
	
	// 인증게시판 글 삭제
	@Override
	public void deleteBoard(int b_index) {
		log.info("인증게시판 서비스 글 삭제 deleteBoard()");
		mapper.delete(b_index);
	}
	
	// 글 입력
	@Override
	public void writeBoard(BoardVO boardVO) {
		log.info("인증게시판 서비스 글 입력 writeBoard()");
		mapper.insert(boardVO);
	}
	// 이미지
	/*
	 * @Override public void fileUpload(int attach_num, String originname, String
	 * path) { HashMap<String, Object> vo = new HashMap<>(); vo.put("attach_num",
	 * attach_num); vo.put("originname", originname); vo.put("path", path);
	 * mapper.uploadFile(vo); }
	 */
	
	//게시판 글번호
	@Override
	public int getBindex(BoardVO boardVO) {
		
		return mapper.getBindex(boardVO);
	}
	
	//이미지 첨부
	@Override
	public void fileUpload(AttachmentVO attachmentVO) {
		mapper.uploadFile(attachmentVO);
	}
	
	
	/* 댓글 */
	
	// 댓글 리스트 불러오기
	@Override
	public List<BoardreplyVO> listComment(BoardreplyVO rvo) {
		log.info("댓글 리스트 서비스 listComment()");
		return mapper.listComment(rvo);
	}
	
	// 댓글 입력
	@Override
	public void insertReply(BoardreplyVO rvo) {
		log.info("댓글 등록 서비스 impl inserted-----------" );
		mapper.insertReply(rvo);
		
	}
	
	// 댓글 불러오기
	@Override
	public BoardreplyVO getComment(BoardreplyVO rvo) {
		log.info("새 댓글 불러오기");
		return mapper.getComment(rvo);	
	}
	
	// 댓글 수 카운트
	@Override
	public int replyCount(BoardreplyVO rvo) {
		log.info("댓글 수 카운트 서비스 실행");
		return mapper.replyCount(rvo);
	}
	
	// 댓글 삭제
	@Override
	public void remove(BoardreplyVO rvo) {
		log.info("댓글 삭제");
		mapper.removeReply(rvo);
	}
	
	// 첨부파일 이미지 리스트
	@Override
	public List<AttachmentVO> getAttachment(AttachmentVO avo) {
		log.info("attachmentVO 가져오기");
		return mapper.getAttachMent(avo);
	}
	
	
	//이미지 수 카운트
	@Override
	public int getAttachMentCount(AttachmentVO avo) {
		
		return mapper.getAttachMentCount(avo);
	}
	
	
	// 게시판 내에서 최신 댓글 불러오기 
	@Override
	public BoardreplyVO getRecentComment(BoardreplyVO rvo) {
		return mapper.getRecentComment(rvo);
	}
	
	
	@Override
	public String getAttachmentBindex(int b_index) { //attachment 에서 삭제할 이미지 경로 가져오기
		return mapper.getAttachmentBindex(b_index);
	}
	
	//인증게시판 글 삭제시 댓글 전부 삭제
	@Override 
	public void deleteReply(int b_index) {
		mapper.deleteReply(b_index);
	}
	
	//인증글 삭제
	@Override 
	public void deleteCertificationBoard(int b_index) {
		mapper.deleteCertificationBoard(b_index);
	}

	//attachment에서 인증게시판 글번호에 해당하는 데이터 삭제
	@Override 
	public void deleteAttachment(int b_index) {
		mapper.deleteAttachment(b_index);
	}
	
	//댓글 수정
	@Override 
	public void modifyReply(BoardreplyVO brvo) {
		mapper.modifyReply(brvo);
	}


}
