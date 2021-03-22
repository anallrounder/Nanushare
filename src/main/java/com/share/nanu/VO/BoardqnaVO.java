package com.share.nanu.VO;

import lombok.ToString;

@ToString
public class BoardqnaVO {
	private String bprivate; // 비공개여부
	private int b_index; // 인덱스

	public BoardqnaVO() {
		super();
	}

	public BoardqnaVO(String bprivate, int b_index) {
		super();
		this.bprivate = bprivate;
		this.b_index = b_index;
	}

	public String getBprivate() {
		return bprivate;
	}

	public void setBprivate(String bprivate) {
		this.bprivate = bprivate;
	}

	public int getB_index() {
		return b_index;
	}

	public void setB_index(int b_index) {
		this.b_index = b_index;
	}

}
