package com.share.nanu.VO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AttachmentVO {

	private int attach_num; // 첨부파일 번호
	private String originname; // 원본파일 이름
	private String path; // 첨부파일 경로
	private String extension; // 확장자
	private int b_index; // idx,로그기록

}
