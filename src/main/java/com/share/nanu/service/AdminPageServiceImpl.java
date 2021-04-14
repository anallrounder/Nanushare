package com.share.nanu.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.nanu.VO.AdminItemOutVO;
import com.share.nanu.VO.BoardVO;
import com.share.nanu.VO.DonationVO;
import com.share.nanu.VO.EcatPointVO;
import com.share.nanu.VO.IteminvenVO;
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

	@Override
	public List<IteminvenVO> getMemberItem(String member_id, Criteria cri) {
		
		return adminMapper.getMemberItemDona(member_id, cri);
	}

	@Override
	public int getItemCount(String member_id, Criteria cri) {
		
		return adminMapper.getItemCount(member_id, cri);
	}

	@Override
	public List<DonationVO> getMemberMoney(String member_id, Criteria cri) {
		
		return adminMapper.getMemberMoneyDona(member_id, cri);
	}

	@Override
	public int getMoneyCount(String member_id, Criteria cri) {
		
		return adminMapper.getMoneyCount(member_id, cri);
	}

	@Override
	public List<EcatPointVO> getMemberPoint(String member_id, Criteria cri) {
		
		return adminMapper.getPointLog(member_id, cri);
	}

	@Override
	public int getPointCount(String member_id, Criteria cri) {
		
		return adminMapper.getPointCount(member_id, cri);
	}

	@Override
	public List<BoardVO> getMemberQnA(String member_id, Criteria cri) {
		
		return adminMapper.getQnA(member_id, cri);
	}

	@Override
	public int getQnACount(String member_id, Criteria cri) {
		// TODO Auto-generated method stub
		return adminMapper.getQnACount(member_id, cri);
	}

	@Override
	public Map<Integer, Integer> getMonthSales(String year) {
		
		Map<Integer, Integer> monthSale = new HashMap<>();
		
		for(int i= 1; i <13; i++) {
			monthSale.put(i, adminMapper.getMonthSale(year, String.valueOf(i)));
		}
		
		return monthSale; 
	}

	@Override
	public Map<Integer, Integer> getDailySales(String year, String month) {
		Calendar cal = Calendar.getInstance();
        cal.set(Integer.parseInt(year), Integer.parseInt(month), 1);
		
		Map<Integer, Integer> dailySale = new HashMap<>();
		
		for(int i=1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
			dailySale.put(i, adminMapper.getDailySale(year, month, String.valueOf(i)));
		}
		
		return dailySale;
	}

	@Override
	public int getYearSales(String year) {
		
		return adminMapper.getYearSale(year);
	}

	

}
