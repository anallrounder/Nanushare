package com.share.nanu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.nanu.VO.AdminItemOutVO;
import com.share.nanu.VO.IteminvenVO2;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.VmVO;
import com.share.nanu.VO.VmVmamVO;
import com.share.nanu.mapper.AdminMapper;
import com.share.nanu.paging.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@AllArgsConstructor
@Service
public class AdminPageServiceImpl implements AdminPageService {

	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public List<MemberVO> getMember(Criteria cri) {
		
		return adminMapper.member(cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri) {
		
		return adminMapper.getTotalCount(cri);
	}

	@Override
	public MemberVO getMemberView(String member_id) {

		return adminMapper.member_view(member_id);
	}
	
	@Override
	public void upBkCheck(String bklist, String member_id) {
		
		adminMapper.upBkCheck(bklist, member_id);
	}

	@Override
	public List<IteminvenVO2> getHeadItem() {
		
		return adminMapper.getHeadItem();
	}

	@Override
	public List<VmVO> getvm() {

		return adminMapper.getVmBranch();
	}

	@Override
	public List<VmVmamVO> getBranchItem() {

		return adminMapper.getVmVmam();
	}
	
	// 본사입고관리
	@Override //for문 돌려서 mapper for문 길이만큼 돌리기(사용하는 이유는 값을 다중으로 넣었을때 한번에 넣는게 안되기때문에 쿼리문을 그만큼 돌린기위해서)
	public void itemHeadUp(int[] iamount, int[] icat_num) {
		for(int i = 0; i < iamount.length; i++) {
			adminMapper.itemHeadUp(iamount[i], icat_num[i]);
		}
	}
	
	// 본사재고관리(출고 db테이블 insert, update)
	@Override
	public void itemOut(AdminItemOutVO adoutvo) {
		for(int i = 0; i < adoutvo.getOutputData().length; i++) {
			adminMapper.itemOut(adoutvo.getIcat_num()[i], adoutvo.getOutputData()[i]); // 본사 재고에서 수량 빼기 update
			adminMapper.itemVmam(adoutvo.getVm_num()[i], adoutvo.getOutputData()[i], adoutvo.getIname()[i]); // vmam 자판기에 수량 업데이트
			adminMapper.itemIoutPut(adoutvo.getVm_num()[i], adoutvo.getOutputData()[i], adoutvo.getOutDate()[i], adoutvo.getIcat_num()[i]); // 출고 테이블 로그 insert
		}
	}




	

}
