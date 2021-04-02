package com.share.nanu.VO;

import java.util.List;
import lombok.ToString;

@ToString
public class ItemInvenIoutPutVO {
	private int icat_num; // 물품 분류 번호
	private String iname; // 물품명
	private int iamount; // 물품 본사 재고수량

	private List<IoutputVO> iout; // 출고(기계번호, 출고량, 출고날짜, 물품분류번호, idx)

	public ItemInvenIoutPutVO() {
		super();
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

	public List<IoutputVO> getIout() {
		return iout;
	}

	public void setIout(List<IoutputVO> iout) {
		this.iout = iout;
	}

	public ItemInvenIoutPutVO(int icat_num, String iname, int iamount, List<IoutputVO> iout) {
		super();
		this.icat_num = icat_num;
		this.iname = iname;
		this.iamount = iamount;
		this.iout = iout;
	}
	
	
	
}