package com.share.nanu.VO;

public class EcatVO {
	private int ecat_num; // 이벤트 카테고리 분류번호
	private String ename; // 이벤트명

	public EcatVO() {
		super();
	}

	public EcatVO(int ecat_num, String ename) {
		super();
		this.ecat_num = ecat_num;
		this.ename = ename;
	}

	public int getEcat_num() {
		return ecat_num;
	}

	public void setEcat_num(int ecat_num) {
		this.ecat_num = ecat_num;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

}
