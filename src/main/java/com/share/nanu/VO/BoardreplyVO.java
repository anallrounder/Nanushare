package com.share.nanu.VO;

import java.sql.Date;

public class BoardreplyVO {

	private int r_num;
	private String rcontent;
	private Date rdate;
	private String rid;
	private int b_index;

	public BoardreplyVO() {
		super();
	}

	public BoardreplyVO(int r_num, String rcontent, Date rdate, String rid, int b_index) {
		super();
		this.r_num = r_num;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.rid = rid;
		this.b_index = b_index;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public int getB_index() {
		return b_index;
	}

	public void setB_index(int b_index) {
		this.b_index = b_index;
	}

}
