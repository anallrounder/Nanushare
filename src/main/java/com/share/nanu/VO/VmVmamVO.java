package com.share.nanu.VO;

import java.util.ArrayList;
import java.util.List;

import lombok.ToString;

@ToString
public class VmVmamVO {

	private String vm_num; // 자판기번호
	private String lat; // 위도
	private String lng; // 경도
	private String branch; // 지점명

	public VmVmamVO(String vm_num, String lat, String lng, String branch, ArrayList<Vmam> vmamlist) {
	
		this.vm_num = vm_num;
		this.lat = lat;
		this.lng = lng;
		this.branch = branch;
		this.vmamlist = vmamlist;
	}
	
	private ArrayList<Vmam> vmamlist; //vm index, 자판기번호, 수량, 물품명
	
	public VmVmamVO() {
		super();
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

	public List<Vmam> getVmamlist() {
		return vmamlist;
	}

	public void setVmamlist(ArrayList<Vmam> vmamlist) {
		this.vmamlist = vmamlist;
	}


	
}
