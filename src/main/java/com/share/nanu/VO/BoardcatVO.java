package com.share.nanu.VO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BoardcatVO {

	private int bcat_num; //게시판 분류번호
	private String bname; //게시판 종류(1문의, 2인증, 3공지)
}
