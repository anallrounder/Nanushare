package com.share.nanu.VO;

import lombok.ToString;

@ToString
public class Vmam {

	private int vmindex; //vm index
	private String vm_num; // 자판기 번호
	private String vm_amount; // 자판기 수량
	private String iname; // 물품이름

	public Vmam() {
		super();
	}

	public Vmam(int vmindex, String vm_num, String vm_amount, String iname) {
		super();
		this.vmindex = vmindex;
		this.vm_num = vm_num;
		this.vm_amount = vm_amount;
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

	public String getVm_amount() {
		return vm_amount;
	}

	public void setVm_amount(String vm_amount) {
		this.vm_amount = vm_amount;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

}
