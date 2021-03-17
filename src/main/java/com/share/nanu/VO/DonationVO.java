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
public class DonationVO {
	
	private int dnt_paynum; // 기부번호, idx, 로그기록
	private String member_id;
	private int dntprice; // 기부금액
	private Date dntdate; // 기부날짜
	private String dntstat; // 기부처리상태
	private String pg; // pg사
	private int pcat_num; // 기부방식 분류번호
}
