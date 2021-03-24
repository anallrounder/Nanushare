package com.share.nanu.VO;

import java.util.List;
import lombok.ToString;

@ToString
public class IteminvenVO {
	private int icat_num; // 물품 분류 번호
	private String iname; // 물품명
	private int iamount; // 물품 본사 재고수량

	private List<ItemdonationVO> dona;

	public IteminvenVO() {
		super();
	}
	
	public IteminvenVO(int icat_num, String iname, int iamount, List<ItemdonationVO> dona) {
		super();
		this.icat_num = icat_num;
		this.iname = iname;
		this.iamount = iamount;
		this.dona = dona;
	}

	public int getIcat_num() {
		return icat_num;
	}

	public void setIcat_num(int icat_num) {
		this.icat_num = icat_num;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

	public int getIamount() {
		return iamount;
	}

	public void setIamount(int iamount) {
		this.iamount = iamount;
	}

	public List<ItemdonationVO> getDona() {
		return dona;
	}

	public void setDona(List<ItemdonationVO> dona) {
		this.dona = dona;
	}

}