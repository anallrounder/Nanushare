package com.share.nanu.VO;

import java.sql.Date;

import lombok.ToString;

@ToString
public class DonationVO {

	private String dnt_paynum; // 기부번호, idx, 로그기록
	private String member_id;
	private String dntprice; // 기부금액
	private Date dntdate; // 기부날짜
	private String dntstat; // 기부처리상태
	private String pg; // pg사
	private String paymethod; // 기부방식 분류번호

	public DonationVO() {
		super();
	}

	public DonationVO(String dnt_paynum, String member_id, String dntprice, Date dntdate, String dntstat, String pg,
			String paymethod) {
		super();
		this.dnt_paynum = dnt_paynum;
		this.member_id = member_id;
		this.dntprice = dntprice;
		this.dntdate = dntdate;
		this.dntstat = dntstat;
		this.pg = pg;
		this.paymethod = paymethod;
	}

	public String getDnt_paynum() {
		return dnt_paynum;
	}

	public void setDnt_paynum(String dnt_paynum) {
		this.dnt_paynum = dnt_paynum;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getDntprice() {
		return dntprice;
	}

	public void setDntprice(String dntprice) {
		this.dntprice = dntprice;
	}

	public Date getDntdate() {
		return dntdate;
	}

	public void setDntdate(Date dntdate) {
		this.dntdate = dntdate;
	}

	public String getDntstat() {
		return dntstat;
	}

	public void setDntstat(String dntstat) {
		this.dntstat = dntstat;
	}

	public String getPg() {
		return pg;
	}

	public void setPg(String pg) {
		this.pg = pg;
	}

	public String getPaymethod() {
		return paymethod;
	}

	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}

}
