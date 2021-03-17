package com.share.nanu.VO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class VmVO {
	
	private int vmindex; //자판기인덱스
	private String vm_num; //자판기번호
	private String lat; //위도
	private String lng; //경도
	private String branch; //지점명
	private int vmamount; //잔여수량
	private String iname; //물품이름

}
