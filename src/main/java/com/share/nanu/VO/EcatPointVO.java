package com.share.nanu.VO;

import java.util.List;

import lombok.ToString;

@ToString
public class EcatPointVO {
	private int ecat_num; // 이벤트 카테고리 분류번호
	private String ename; // 이벤트명
	
	private List<PointVO> pointvo;

	public EcatPointVO() {
		super();
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

	public List<PointVO> getPointvo() {
		return pointvo;
	}

	public void setPointvo(List<PointVO> pointvo) {
		this.pointvo = pointvo;
	}


	public EcatPointVO(int ecat_num, String ename, List<PointVO> pointvo) {
		super();
		this.ecat_num = ecat_num;
		this.ename = ename;
		this.pointvo = pointvo;
	}
	
}
