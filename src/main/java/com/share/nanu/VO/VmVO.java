package com.share.nanu.VO;

import lombok.ToString;

@ToString
public class VmVO {

	private String vm_num; // 자판기번호
	private String lat; // 위도
	private String lng; // 경도
	private String branch; // 지점명

	public VmVO() {
		super();
	}

	public VmVO(String vm_num, String lat, String lng, String branch) {
		super();
		this.vm_num = vm_num;
		this.lat = lat;
		this.lng = lng;
		this.branch = branch;
	}

	public String getVm_num() {
		return vm_num;
	}

	public void setVm_num(String vm_num) {
		this.vm_num = vm_num;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

}
