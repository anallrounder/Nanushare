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
public class BoardVO {

	private int b_index; // 게시판 index, 로그
	private String member_id;
	private String btitle;
	private String bcontent;
	private int bhit;
	private Date bdate;
	private int bcat_num; // 게시판 분류번호 1 문의 2 인증 3 공지

}
