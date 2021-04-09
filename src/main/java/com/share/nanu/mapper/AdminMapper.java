package com.share.nanu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.DonationVO;
import com.share.nanu.VO.IteminvenVO;
import com.share.nanu.VO.IteminvenVO2;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.VmVO;
import com.share.nanu.VO.VmVmamVO;
import com.share.nanu.paging.Criteria;

@Mapper
public interface AdminMapper {

	List<MemberVO> member(Criteria cri);
	
	int getTotalCount(Criteria cri);

	MemberVO member_view(String member_id);
	
	void upBkCheck(String bklist, String member_id);

	List<IteminvenVO2> getHeadItem();

	List<VmVO> getVmBranch();

	List<VmVmamVO> getVmVmam();

	void itemHeadUp(int iamount, int icat_num);

	void itemOut(int icat_num, int iamount);

	void itemVmam(String vm_num, int iamount, String iname);

	void itemIoutPut(String vm_num, int iamount, String outputdate, int icat_num);

	List<IteminvenVO> getMemberItemDona(String member_id, Criteria cri);

	int getItemCount(String member_id, Criteria cri);

	List<DonationVO> getMemberMoneyDona(String member_id, Criteria cri);

	int getMoneyCount(String member_id, Criteria cri);

	

	

	

}
