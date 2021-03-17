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
public class MgetitemVO {
	
	private String member_id; //아이디
	private int getamount; //가져간수량
	private Date getdate; //가져간 날짜    
	private int vmindex; //자판기...

}
