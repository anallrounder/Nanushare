package com.share.nanu.VO;

import java.sql.Date;

import lombok.ToString;

@ToString
public class MgetitemVO {

	private String member_id; // 아이디
	private int getamount; // 가져간수량
	private Date getdate; // 가져간 날짜
	private String vm_num; //기계번호
	private String iname; //물품명

	public MgetitemVO() {
	}

	public MgetitemVO(String member_id, int getamount, Date getdate, String vm_num, String iname) {
		this.member_id = member_id;
		this.getamount = getamount;
		this.getdate = getdate;
		this.vm_num = vm_num;
		this.iname = iname;
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

	public String getVm_num() {
		return vm_num;
	}

	public void setVm_num(String vm_num) {
		this.vm_num = vm_num;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

}
