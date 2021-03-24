package com.share.nanu.service;

import java.util.List;

import com.share.nanu.VO.DonationVO;
import com.share.nanu.VO.VmVO;

public interface MainService {

	public List<DonationVO> getMoney();

	public List<DonationVO> getWeekMoney();

	public List<VmVO> getvm();


	/*
	 * public DonationVO getContent(Date dntdate);
	 */
	
	

	
	

}
