package com.share.nanu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.nanu.VO.DonationVO;
import com.share.nanu.VO.MgetitemVO;
import com.share.nanu.VO.VmVO;
import com.share.nanu.VO.VmVmamVO;
import com.share.nanu.VO.Vmam;
import com.share.nanu.mapper.MainMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainMapper mainmapper;

	@Override
	public List<VmVmamVO> getVm() {
		// TODO Auto-generated method stub
		return mainmapper.getVm();
	}

	@Override
	public List<VmVO> getVmCat() {
		// TODO Auto-generated method stub
		return mainmapper.getVmCat();
	}

	@Override
	public List<Vmam> getVmInven() {
		// TODO Auto-generated method stub
		return mainmapper.getVmInven();
	}

	@Override
	public void itemOut(String vm_num, String iname) {
		// TODO Auto-generated method stub
		mainmapper.outAmount(vm_num, iname);
	}

	@Override
	public int vmCount(String vm_num, String iname) {
		// TODO Auto-generated method stub
		return mainmapper.vmCount(vm_num, iname);
	}

	@Override
	public int getDailySales(String year, String month, String day) {
		// TODO Auto-generated method stub
		return mainmapper.getDay(year, month, day);
	}

	@Override
	public int getMonthSales(String year, String month) {
		// TODO Auto-generated method stub
		return mainmapper.getMonth(year, month);
	}

	@Override
	public int getYearSales(String year) {
		// TODO Auto-generated method stub
		return mainmapper.getYear(year);
	}

	@Override
	public List<Vmam> getVmItem(String vmNum) {
		// TODO Auto-generated method stub
		return mainmapper.getVmItem(vmNum);
	}

	@Override
	public void memberOut(MgetitemVO mgetItem) {
		// TODO Auto-generated method stub
		mainmapper.memberItemOut(mgetItem);
	}

	


}
