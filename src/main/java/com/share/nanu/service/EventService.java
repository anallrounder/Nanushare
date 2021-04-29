package com.share.nanu.service;

import com.share.nanu.VO.PointVO;

public interface EventService {

	// 이벤트 포인트 불러오기
	public PointVO mypnt(PointVO pointVO);

	// 이벤트 - 1일1회 카운트
	public int mycount(PointVO pointVO, String member_id);

	// 룰렛 포인트 쌓기
	public void getMypoint(PointVO pointVO, String member_id);
	
	//동물상 테스트 1일1회 카운트
	public int myAnimalFaceTestCount(PointVO pointVO, String member_id);
	
	//동물상 테스트 포인트 입력
	public void getMyAnimalFacePoint(PointVO pointVO, String member_id);

}
