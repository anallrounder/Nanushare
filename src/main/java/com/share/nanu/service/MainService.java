package com.share.nanu.service;

import java.util.List;

import com.share.nanu.VO.DonationVO;
import com.share.nanu.VO.VmVO;
import com.share.nanu.VO.Vmam;

public interface MainService {

	public List<DonationVO> getMoney();

	public List<DonationVO> getWeekMoney();

	public List<VmVO> getvm();

	public List<VmVO> getvmcat();

	public List<Vmam> getvminven();

	public List<VmVO> getoffvm(Vmam vmamvo);

	public void itemOut(String vm_num, String iname);



	/*
	 * public DonationVO getContent(Date dntdate);
	 */
	
	

	
	

}
