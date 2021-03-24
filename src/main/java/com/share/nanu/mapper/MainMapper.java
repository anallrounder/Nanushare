package com.share.nanu.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.DonationVO;
import com.share.nanu.VO.VmVO;

@Mapper
public interface MainMapper {

	public List<DonationVO> dayMoney();

	public List<DonationVO> weekMoney();

	public List<VmVO> getvm();
}
