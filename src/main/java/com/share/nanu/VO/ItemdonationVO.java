package com.share.nanu.VO;

import java.sql.Date;

import lombok.ToString;

@ToString
public class ItemdonationVO {
	private int idnt_num; // 기부 번호, 기부 idx
	private Date idntdate; // 기부날짜
	private String member_id;
	private int donaamount; // 물건 기부 수량
	private int icat_num; // 물품 분류 번호

	public ItemdonationVO() {
		super();
	}

	public ItemdonationVO(int idnt_num, Date idntdate, String member_id, int donaamount, int icat_num) {
		super();
		this.idnt_num = idnt_num;
		this.idntdate = idntdate;
		this.member_id = member_id;
		this.donaamount = donaamount;
		this.icat_num = icat_num;
	}

	public int getIdnt_num() {
		return idnt_num;
	}

	public void setIdnt_num(int idnt_num) {
		this.idnt_num = idnt_num;
	}

	public Date getIdntdate() {
		return idntdate;
	}

	public void setIdntdate(Date idntdate) {
		this.idntdate = idntdate;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getDonaamount() {
		return donaamount;
	}

	public void setDonaamount(int donaamount) {
		this.donaamount = donaamount;
	}

	public int getIcat_num() {
		return icat_num;
	}

	public void setIcat_num(int icat_num) {
		this.icat_num = icat_num;
	}

}
