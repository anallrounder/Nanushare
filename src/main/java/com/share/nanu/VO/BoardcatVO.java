package com.share.nanu.VO;

import lombok.ToString;

@ToString
public class BoardcatVO {

	private int bcat_num; // 게시판 분류번호
	private String bname; // 게시판 종류(1문의, 2인증, 3공지)

	public BoardcatVO() {
		super();
	}

	public BoardcatVO(int bcat_num, String bname) {
		super();
		this.bcat_num = bcat_num;
		this.bname = bname;
	}

	public int getBcat_num() {
		return bcat_num;
	}

	public void setBcat_num(int bcat_num) {
		this.bcat_num = bcat_num;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

}
