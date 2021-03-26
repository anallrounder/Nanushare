package com.share.nanu.page;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.ToString;

@ToString
public class pageVO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	// Getters
	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getTotal() {
		return total;
	}

	public Criteria getCri() {
		return cri;
	}

	public pageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0) * 10);
		
		this.startPage = this.endPage -9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponentsBuilder =  UriComponentsBuilder.newInstance().queryParam("pageNum", page)
				.queryParam("amount", cri.getAmount())
				.build();
		return uriComponentsBuilder.toUriString();
	}
}
