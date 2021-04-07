package com.share.nanu.service;

import java.util.List;

import com.share.nanu.VO.AdminItemOutVO;
import com.share.nanu.VO.IteminvenVO2;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.VmVO;
import com.share.nanu.VO.VmVmamVO;
import com.share.nanu.paging.Criteria;

public interface AdminPageService {

	List<MemberVO> getMember(Criteria cri);
	
	int getTotalCount(Criteria cri);

	List<MemberVO> getMemberView(String member_id);

	List<IteminvenVO2> getHeadItem();

	List<VmVO> getvm();

	List<VmVmamVO> getBranchItem();

	void itemHeadUp(int[] iamount, int[] icat_num);

	void itemOut(AdminItemOutVO adoutvo);

	



}
