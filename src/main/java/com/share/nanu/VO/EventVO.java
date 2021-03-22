package com.share.nanu.VO;

import java.sql.Date;

import lombok.ToString;

@ToString
public class EventVO {
	private int e_idx; // 로그기록idx
	private int ecat_num; // 이벤트 카테고리 분류번호
	private String prtstat; // 참여여부
	private String member_id; // 참여자
	private Date edate; // 참여날짜

	public EventVO() {
		super();
	}

	public EventVO(int e_idx, int ecat_num, String prtstat, String member_id, Date edate) {
		super();
		this.e_idx = e_idx;
		this.ecat_num = ecat_num;
		this.prtstat = prtstat;
		this.member_id = member_id;
		this.edate = edate;
	}

	public int getE_idx() {
		return e_idx;
	}

	public void setE_idx(int e_idx) {
		this.e_idx = e_idx;
	}

	public int getEcat_num() {
		return ecat_num;
	}

	public void setEcat_num(int ecat_num) {
		this.ecat_num = ecat_num;
	}

	public String getPrtstat() {
		return prtstat;
	}

	public void setPrtstat(String prtstat) {
		this.prtstat = prtstat;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

}
