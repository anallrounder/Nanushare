package com.share.nanu.VO;

import lombok.ToString;

@ToString
public class LottoVO {
	private String lottosuccess; // 로또 성공여부
	private int e_idx; // 이벤트종류인덱스

	public LottoVO() {
		super();
	}

	public LottoVO(String lottosuccess, int e_idx) {
		super();
		this.lottosuccess = lottosuccess;
		this.e_idx = e_idx;
	}

	public String getLottosuccess() {
		return lottosuccess;
	}

	public void setLottosuccess(String lottosuccess) {
		this.lottosuccess = lottosuccess;
	}

	public int getE_idx() {
		return e_idx;
	}

	public void setE_idx(int e_idx) {
		this.e_idx = e_idx;
	}

}
