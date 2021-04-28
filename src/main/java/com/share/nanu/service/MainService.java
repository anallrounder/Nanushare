package com.share.nanu.service;

import java.util.List;

import com.share.nanu.VO.DonationVO;
import com.share.nanu.VO.MgetitemVO;
import com.share.nanu.VO.VmVO;
import com.share.nanu.VO.VmVmamVO;
import com.share.nanu.VO.Vmam;

public interface MainService {

	public List<VmVmamVO> getVm();

	public List<VmVO> getVmCat();

	public List<Vmam> getVmInven();

	public void itemOut(String vm_num, String iname);

	public int vmCount(String vm_num, String iname);
	
	//메인 통계 value
	public int getDailySales(String year, String month, String day);
	public int getMonthSales(String year, String month);
	public int getYearSales(String year);

	
	public List<Vmam> getVmItem(String vmNum);
	
	//회원 물건 수령 out
	public void memberOut(MgetitemVO mgetItem);

}
