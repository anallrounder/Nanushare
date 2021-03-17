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
public class ItemdonationVO {
	private int idnt_num; // 기부 번호, 기부 idx
	private Date idntdate; // 기부날짜
	private String member_id;
	private int donaamount; // 물건 기부 수량
	private int icat_num; // 물품 분류 번호

}
