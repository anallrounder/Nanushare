package com.share.nanu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.nanu.VO.DonationVO;
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
	public List<VmVmamVO> getvm() {
		// TODO Auto-generated method stub
		return mainmapper.getvm();
	}

	@Override
	public List<VmVO> getvmcat() {
		// TODO Auto-generated method stub
		return mainmapper.getvmcat();
	}

	@Override
	public List<Vmam> getvminven() {
		// TODO Auto-generated method stub
		return mainmapper.getvmiven();
	}

	@Override
	public List<VmVO> getoffvm(Vmam vmamvo) {
		// TODO Auto-generated method stub
		return mainmapper.getoffvm(vmamvo);
	}

	@Override
	public void itemOut(String vm_num, String iname) {
		// TODO Auto-generated method stub
		mainmapper.outAmount(vm_num, iname);
	}

	@Override
	public int vmCount(String vm_num, String iname) {
		// TODO Auto-generated method stub
		return mainmapper.vmcount(vm_num, iname);
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

	


}
