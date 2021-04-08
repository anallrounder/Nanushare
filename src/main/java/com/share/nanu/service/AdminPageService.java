package com.share.nanu.service;

import java.util.List;

import com.share.nanu.VO.AdminItemOutVO;
import com.share.nanu.VO.IteminvenVO2;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.VmVO;
import com.share.nanu.VO.VmVmamVO;
import com.share.nanu.paging.Criteria;

public interface AdminPageService {
	
	// 관리자페이지-회원관리
	List<MemberVO> getMember(Criteria cri);
	int getTotalCount(Criteria cri);
	List<MemberVO> getMemberView(String member_id);

	//관리자페이지-본사재고관리(조회)
	List<IteminvenVO2> getHeadItem();
	List<VmVO> getvm();
	
	//관리자페이지-지점재고관리(조회)
	List<VmVmamVO> getBranchItem();
	
	//관리자페이지-본사재고관리(입고 업데이트)
	void itemHeadUp(int[] iamount, int[] icat_num);
	
	//관리자페이지-본사재고관리(출고 업데이트)
	void itemOut(AdminItemOutVO adoutvo);

	



}
