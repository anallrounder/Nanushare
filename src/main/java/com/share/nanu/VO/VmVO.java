package com.share.nanu.VO;

public class VmVO {

	private int vmindex; // 자판기인덱스
	private String vm_num; // 자판기번호
	private String lat; // 위도
	private String lng; // 경도
	private String branch; // 지점명
	private int vmamount; // 잔여수량
	private String iname; // 물품이름

	public VmVO() {
		super();
	}

	public VmVO(int vmindex, String vm_num, String lat, String lng, String branch, int vmamount, String iname) {
		super();
		this.vmindex = vmindex;
		this.vm_num = vm_num;
		this.lat = lat;
		this.lng = lng;
		this.branch = branch;
		this.vmamount = vmamount;
		this.iname = iname;
	}

	public int getVmindex() {
		return vmindex;
	}

	public void setVmindex(int vmindex) {
		this.vmindex = vmindex;
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

	public int getVmamount() {
		return vmamount;
	}

	public void setVmamount(int vmamount) {
		this.vmamount = vmamount;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

}
