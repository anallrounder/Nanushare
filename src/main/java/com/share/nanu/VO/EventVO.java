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
public class EventVO {
	private int e_idx; // 로그기록idx
	private int ecat_num; // 이벤트 카테고리 분류번호
	private String prtstat; // 참여여부
	private String member_id; // 참여자
	private Date edate; //참여날짜

}
