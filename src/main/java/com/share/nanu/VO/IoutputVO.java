package com.share.nanu.VO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class IoutputVO {
	private int iout_num; //출고번호
	private String vm_num; // 자판기 고유 번호 
	private int outamount; // 출고량
	private Date outputdate; // 지점 출고 날짜
	private int icat_num; //물품 분류 번호
	private int vmindex; // 자판기idx

}
