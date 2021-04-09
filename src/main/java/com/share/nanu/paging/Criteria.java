package com.share.nanu.paging;

import lombok.ToString;

@ToString

public class Criteria {
	
	private int pageNum; // 페이지 번호
	private int amount; // 한 페이지당 몇 개의 데이터를 보여줄것인가?

	public Criteria() {
		this(1, 10); // 기본 값 1페이지를 10개로 지정한다
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	
}