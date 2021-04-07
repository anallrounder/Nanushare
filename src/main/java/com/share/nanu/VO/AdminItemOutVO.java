package com.share.nanu.VO;

import java.sql.Date;

import lombok.ToString;

@ToString
public class AdminItemOutVO {
	
	private int[] outputData; // 출고량
	private int[] icat_num; // iteminven 본사 물건 idx
	private String[] outDate; // 출고날짜 (jsp datepicker에서 String으로 받기 때문에 String으로 받아서 넘긴다)
	private String[] branch;  //브랜치이름
	private String[] iname; //지점명
	private String[] vm_num; //기계 번호
	
	public int[] getOutputData() {
		return outputData;
	}
	public void setOutputData(int[] outputData) {
		this.outputData = outputData;
	}
	public int[] getIcat_num() {
		return icat_num;
	}
	public void setIcat_num(int[] icat_num) {
		this.icat_num = icat_num;
	}
	public String[] getIname() {
		return iname;
	}
	public void setIname(String[] iname) {
		this.iname = iname;
	}
	public String[] getVm_num() {
		return vm_num;
	}
	public void setVm_num(String[] vm_num) {
		this.vm_num = vm_num;
	}
	public String[] getBranch() {
		return branch;
	}
	public void setBranch(String[] branch) {
		this.branch = branch;
	}
	public String[] getOutDate() {
		return outDate;
	}
	public void setOutDate(String[] outDate) {
		this.outDate = outDate;
	}
	
	
	
}
