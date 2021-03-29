package com.share.nanu.VO;

import lombok.ToString;

@ToString
public class AttachmentVO {

	private int attach_num; // 첨부파일 번호
	private String originname; // 원본파일 이름
	private String path; // 첨부파일 경로
	//private String extension; // 확장자
	private int b_index; // idx,로그기록

	public AttachmentVO() {
		super();
	}

	public AttachmentVO(int attach_num, String originname, String path, String extension, int b_index) {
		super();
		this.attach_num = attach_num;
		this.originname = originname;
		this.path = path;
		//this.extension = extension;
		this.b_index = b_index;
	}

	public int getAttach_num() {
		return attach_num;
	}

	public void setAttach_num(int attach_num) {
		this.attach_num = attach_num;
	}

	public String getOriginname() {
		return originname;
	}

	public void setOriginname(String originname) {
		this.originname = originname;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	/*
	public String getExtension() {
		return extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}
	 */
	public int getB_index() {
		return b_index;
	}

	public void setB_index(int b_index) {
		this.b_index = b_index;
	}

}
