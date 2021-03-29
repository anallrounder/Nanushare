package com.share.nanu.VO;

import java.sql.Date;
import java.util.List;

import lombok.ToString;

@ToString
public class Board_ListVO {

	private int b_index; // 게시판 index, 로그
	private String member_id;
	private String btitle;
	private String bcontent;
	private int bhit;
	private Date bdate;
	private int bcat_num; // 게시판 분류번호 1 문의 2 인증 3 공지

	private List<BoardreplyVO> reply;
	
	public Board_ListVO() {
		super();
	}

	public int getB_index() {
		return b_index;
	}

	public void setB_index(int b_index) {
		this.b_index = b_index;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public int getBhit() {
		return bhit;
	}

	public void setBhit(int bhit) {
		this.bhit = bhit;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public int getBcat_num() {
		return bcat_num;
	}

	public void setBcat_num(int bcat_num) {
		this.bcat_num = bcat_num;
	}

	public List<BoardreplyVO> getReply() {
		return reply;
	}

	public void setReply(List<BoardreplyVO> reply) {
		this.reply = reply;
	}

	public Board_ListVO(int b_index, String member_id, String btitle, String bcontent, int bhit, Date bdate, int bcat_num,
			List<BoardreplyVO> reply) {
		super();
		this.b_index = b_index;
		this.member_id = member_id;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bhit = bhit;
		this.bdate = bdate;
		this.bcat_num = bcat_num;
		this.reply = reply;
	}

}
