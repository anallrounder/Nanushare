package com.share.nanu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.share.nanu.VO.IteminvenVO2;
import com.share.nanu.VO.MemberVO;
import com.share.nanu.VO.VmVO;
import com.share.nanu.VO.VmVmamVO;

@Mapper
public interface AdminMapper {

	List<MemberVO> member();

	List<MemberVO> member_view(String member_id);

	List<IteminvenVO2> getHeadItem();

	List<VmVO> getVmBranch();

	List<VmVmamVO> getVmVmam();

}
