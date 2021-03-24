package com.share.nanu.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.nanu.VO.DonationVO;
import com.share.nanu.VO.VmVO;
import com.share.nanu.mapper.MainMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainMapper mainmapper;

	@Override
	public List<DonationVO> getMoney() {
		// TODO Auto-generated method stub
		return mainmapper.dayMoney();
	}

	@Override
	public List<DonationVO> getWeekMoney() {
		// TODO Auto-generated method stub
		return mainmapper.weekMoney();
	}

	@Override
	public List<VmVO> getvm() {
		// TODO Auto-generated method stub
		return mainmapper.getvm();
	}

}
