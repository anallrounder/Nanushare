package com.share.nanu.VO;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class IteminvenVO {
	private int icat_num; // 물품 분류 번호
	private String iname; // 물품명 
	private int iamount; //물품 본사 재고수량

}
