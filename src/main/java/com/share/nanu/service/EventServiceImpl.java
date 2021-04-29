package com.share.nanu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.nanu.VO.PointVO;

import com.share.nanu.mapper.EventMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventMapper eventMapper;

	// 출첵 포인트 카운트
	@Override
	public int mycount(PointVO pointVO, String member_id) {

		return eventMapper.mycount(pointVO, member_id);
	}

	// 출첵 포인트 넣기
	@Override
	public void getMypoint(PointVO pointVO, String member_id) {
		eventMapper.getMypoint(pointVO, member_id);

	}

	@Override
	public PointVO mypnt(PointVO pointVO) {

		return eventMapper.mypnt(pointVO);
	}

	// 동물상 테스트 카운트
	@Override
	public int myAnimalFaceTestCount(PointVO pointVO, String member_id) {

		return eventMapper.myAnimalFaceTestCount(pointVO, member_id);
	}

	// 동물상 테스트 포인트 입력
	@Override
	public void getMyAnimalFacePoint(PointVO pointVO, String member_id) {
		eventMapper.getMyAnimalFacePoint(pointVO, member_id);
	}
}
