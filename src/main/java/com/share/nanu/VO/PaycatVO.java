package com.share.nanu.VO;

public class PaycatVO {
	private int pcat_num; // 결제방법분류번호
	private String pmethod; // 결제방법

	public PaycatVO() {
		super();
	}

	public PaycatVO(int pcat_num, String pmethod) {
		super();
		this.pcat_num = pcat_num;
		this.pmethod = pmethod;
	}

	public int getPcat_num() {
		return pcat_num;
	}

	public void setPcat_num(int pcat_num) {
		this.pcat_num = pcat_num;
	}

	public String getPmethod() {
		return pmethod;
	}

	public void setPmethod(String pmethod) {
		this.pmethod = pmethod;
	}

}
