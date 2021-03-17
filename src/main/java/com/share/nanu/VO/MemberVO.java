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
public class MemberVO {
	
	private String member_id; //아이디 
	private String pw; //비밀번호
	private String name; //이름
	private String gender; //성별
	private Date birth; //생일           
	private String signuppath; //가입경로  
	private int pntnum; //포인트번호
	private int authnum; //등급번호
	private String bklist; //블랙리스트
	private int dntcnt; //후원금기부횟수
	private int itemdntcnt; //물품기부횟수
	private String phone; //핸드폰번호


}
