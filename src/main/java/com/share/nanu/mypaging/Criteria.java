package com.share.nanu.mypaging;

import lombok.ToString;

@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	// 검색 위해서 type, keyword 변수 추가
	private String type;  // 변수 추가 _ 셀렉트 종류 (내용, 제목, 작성자)
	private String keyword;  // 변수 추가 _ 검색어 작성 내용 저장
	
	public Criteria() {
		this(1, 5);	
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	// 검색을 위해서 함수 추가
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
}
