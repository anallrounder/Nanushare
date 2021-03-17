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
public class PointVO {
	
	private String member_id; //아이디
	private Date pdate; //날짜
	private int prtpnt; //참여포인트
	private int dntpnt; //기부한포인트        
	private int totalpnt; //총누적포인트
	private int e_idx; //이벤트인덱스

}
