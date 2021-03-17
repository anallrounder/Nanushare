package com.share.nanu.VO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AuthVO {
	private int authidx; //권한번호 
	private String member_id;
	private String authrole; //권한이름

}
