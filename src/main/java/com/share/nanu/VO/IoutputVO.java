package com.share.nanu.VO;

import java.sql.Date;

import lombok.ToString;

@ToString
public class IoutputVO {
	
	private int iout_num; // 출고번호
	private String vm_num; // 자판기 고유 번호
	private int outamount; // 출고량
	private Date outputdate; // 지점 출고 날짜
	private int icat_num; // 물품 분류 번호
	

	public IoutputVO() {
		super();
	}

	public IoutputVO(int iout_num, String vm_num, int outamount, Date outputdate, int icat_num) {
		super();
		this.iout_num = iout_num;
		this.vm_num = vm_num;
		this.outamount = outamount;
		this.outputdate = outputdate;
		this.icat_num = icat_num;
	}

	public int getIout_num() {
		return iout_num;
	}

	public void setIout_num(int iout_num) {
		this.iout_num = iout_num;
	}

	public String getVm_num() {
		return vm_num;
	}

	public void setVm_num(String vm_num) {
		this.vm_num = vm_num;
	}

	public int getOutamount() {
		return outamount;
	}

	public void setOutamount(int outamount) {
		this.outamount = outamount;
	}

	public Date getOutputdate() {
		return outputdate;
	}

	public void setOutputdate(Date outputdate) {
		this.outputdate = outputdate;
	}

	public int getIcat_num() {
		return icat_num;
	}

	public void setIcat_num(int icat_num) {
		this.icat_num = icat_num;
	}

}
