package com.share.nanu.VO;

import java.sql.Date;

public class MgetitemVO {

	private String member_id; // 아이디
	private int getamount; // 가져간수량
	private Date getdate; // 가져간 날짜
	private int vmindex; // 자판기...

	public MgetitemVO() {
		super();
	}

	public MgetitemVO(String member_id, int getamount, Date getdate, int vmindex) {
		super();
		this.member_id = member_id;
		this.getamount = getamount;
		this.getdate = getdate;
		this.vmindex = vmindex;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getGetamount() {
		return getamount;
	}

	public void setGetamount(int getamount) {
		this.getamount = getamount;
	}

	public Date getGetdate() {
		return getdate;
	}

	public void setGetdate(Date getdate) {
		this.getdate = getdate;
	}

	public int getVmindex() {
		return vmindex;
	}

	public void setVmindex(int vmindex) {
		this.vmindex = vmindex;
	}

}
