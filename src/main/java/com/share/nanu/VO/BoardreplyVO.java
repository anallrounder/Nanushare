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
public class BoardreplyVO {

	private int r_num;
	private String rcontent;
	private Date rdate;
	private String rid;
	private int b_index;
}
