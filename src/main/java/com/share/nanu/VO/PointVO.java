package com.share.nanu.VO;

import java.sql.Date;

public class PointVO {

	private String member_id; // 아이디
	private Date pdate; // 날짜
	private int prtpnt; // 참여포인트
	private int dntpnt; // 기부한포인트
	private int totalpnt; // 총누적포인트
	private int e_idx; // 이벤트인덱스

	public PointVO() {
		super();
	}

	public PointVO(String member_id, Date pdate, int prtpnt, int dntpnt, int totalpnt, int e_idx) {
		super();
		this.member_id = member_id;
		this.pdate = pdate;
		this.prtpnt = prtpnt;
		this.dntpnt = dntpnt;
		this.totalpnt = totalpnt;
		this.e_idx = e_idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public int getPrtpnt() {
		return prtpnt;
	}

	public void setPrtpnt(int prtpnt) {
		this.prtpnt = prtpnt;
	}

	public int getDntpnt() {
		return dntpnt;
	}

	public void setDntpnt(int dntpnt) {
		this.dntpnt = dntpnt;
	}

	public int getTotalpnt() {
		return totalpnt;
	}

	public void setTotalpnt(int totalpnt) {
		this.totalpnt = totalpnt;
	}

	public int getE_idx() {
		return e_idx;
	}

	public void setE_idx(int e_idx) {
		this.e_idx = e_idx;
	}

}
