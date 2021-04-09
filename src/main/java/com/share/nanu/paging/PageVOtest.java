package com.share.nanu.paging;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.ToString;

@ToString

// 페이징의 요소를 담는 객체
public class PageVOtest {
	
	// private int displayPageCount = 10; // 한 페이지당 보여지는 게시글 수
		private int startPage; // 화면에 보여지는 시작번호
		private int endPage; // 화면에 보여지는 마지막번호
		private boolean prev, next; // 이전과 다음으로 이동가능한 링크 표시

		private int total; // 전체 데이터 수
		private Criteria cri;
		private String member_id;

		public PageVOtest(Criteria cri, int total, String member_id) {
			this.cri = cri;
			this.total = total;
			this.member_id = member_id;

			// 최대 10페이지 단위로 보여주어 페이징을 처리한다.(100개 기준)
			this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
			this.startPage = this.endPage - 9;

			// 만약 전체 게시글 수가 100개 미만이면 해당 페이지까지만 보여준다.
			int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
			if (realEnd <= this.endPage) {
				this.endPage = realEnd;
			}

			// 시작번호가 1보다 큰 경우 활성화시킨다.
			this.prev = this.startPage > 1;
			// realEnd가 끝 번호 보다 큰 경우 활성화시킨다.
			this.next = this.endPage < realEnd;
		}

		// 해당 페이지 번호에 따라 URL 뒤에 붙게한다.

		public String makeQuery(int page) {
			UriComponents uriComponentsBuilder = UriComponentsBuilder.newInstance().queryParam("member_id", member_id).queryParam("pageNum", page).queryParam("amount", cri.getAmount())
					.build();
			return uriComponentsBuilder.toUriString();
		}

		public PageVOtest() {
			super();
		}

		public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public boolean isPrev() {
			return prev;
		}

		public void setPrev(boolean prev) {
			this.prev = prev;
		}

		public boolean isNext() {
			return next;
		}

		public void setNext(boolean next) {
			this.next = next;
		}

		public int getTotal() {
			return total;
		}

		public void setTotal(int total) {
			this.total = total;
		}

		public Criteria getCri() {
			return cri;
		}

		public void setCri(Criteria cri) {
			this.cri = cri;
		}

		public String getMember_id() {
			return member_id;
		}

		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}
		
		

		
}
