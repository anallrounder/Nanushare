package com.share.nanu.VO;

import java.sql.Date;

public class DonationVO {

	private int dnt_paynum; // 기부번호, idx, 로그기록
	private String member_id;
	private int dntprice; // 기부금액
	private Date dntdate; // 기부날짜
	private String dntstat; // 기부처리상태
	private String pg; // pg사
	private int pcat_num; // 기부방식 분류번호

	public DonationVO() {
		super();
	}

	public DonationVO(int dnt_paynum, String member_id, int dntprice, Date dntdate, String dntstat, String pg,
			int pcat_num) {
		super();
		this.dnt_paynum = dnt_paynum;
		this.member_id = member_id;
		this.dntprice = dntprice;
		this.dntdate = dntdate;
		this.dntstat = dntstat;
		this.pg = pg;
		this.pcat_num = pcat_num;
	}

	public int getDnt_paynum() {
		return dnt_paynum;
	}

	public void setDnt_paynum(int dnt_paynum) {
		this.dnt_paynum = dnt_paynum;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getDntprice() {
		return dntprice;
	}

	public void setDntprice(int dntprice) {
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

	public int getPcat_num() {
		return pcat_num;
	}

	public void setPcat_num(int pcat_num) {
		this.pcat_num = pcat_num;
	}

}
