package com.share.nanu.page;

import lombok.ToString;

@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1, 10);	
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public int getAmount() {
		return amount;
	}
}
