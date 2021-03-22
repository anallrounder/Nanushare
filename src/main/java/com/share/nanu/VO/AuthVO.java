package com.share.nanu.VO;

import lombok.ToString;

@ToString
public class AuthVO {

	private int authidx; // 권한번호
	private String member_id;
	private String authrole; // 권한이름

	public AuthVO(int authidx, String member_id, String authrole) {
		super();
		this.authidx = authidx;
		this.member_id = member_id;
		this.authrole = authrole;
	}

	public AuthVO() {
		super();
	}

	public int getAuthidx() {
		return authidx;
	}

	public void setAuthidx(int authidx) {
		this.authidx = authidx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getAuthrole() {
		return authrole;
	}

	public void setAuthrole(String authrole) {
		this.authrole = authrole;
	}

}
