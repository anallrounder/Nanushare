package com.share.nanu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.DonationVO;
import com.share.nanu.VO.MgetitemVO;
import com.share.nanu.VO.VmVO;
import com.share.nanu.VO.VmVmamVO;
import com.share.nanu.VO.Vmam;

@Mapper
public interface MainMapper {

	public List<DonationVO> dayMoney();

	public List<DonationVO> weekMoney();

	public List<VmVmamVO> getvm();

	public List<VmVO> getvmcat();

	public List<Vmam> getvmiven();

	public List<VmVO> getoffvm(Vmam vmamvo);

	public void outAmount(String vm_num, String iname);

	public int vmcount(String vm_num, String iname);

	public int getDay(String year, String month, String day);

	public int getMonth(String year, String month);

	public int getYear(String year);

	public List<Vmam> getVmItem(String vmNum);

	public void memberItemOut(MgetitemVO mgetItem);

}
