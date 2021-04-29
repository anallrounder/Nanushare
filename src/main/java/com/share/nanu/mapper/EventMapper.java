package com.share.nanu.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.share.nanu.VO.PointVO;

@Mapper
public interface EventMapper {

	// 출첵 카운트
	public int mycount(PointVO pointVO, String member_id);

	// 출첵 포인트 insert
	public void getMypoint(PointVO pointVO, String member_id);

	// 출첵 내 포인트 출력
	public PointVO mypnt(PointVO pointVO);

	// 동물상 테스트 카운트
	public int myAnimalFaceTestCount(PointVO pointVO, String member_id);

	// 동물상 테스트 포인트 입력
	public void getMyAnimalFacePoint(PointVO pointVO, String member_id);

}