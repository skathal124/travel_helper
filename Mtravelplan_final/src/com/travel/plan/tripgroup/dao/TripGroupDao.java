package com.travel.plan.tripgroup.dao;

import java.util.List;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripgroup.model.TripGroup;

public interface TripGroupDao {

	// tseq, id 필요 -> 그룹장용
	void insertGroup(Trip trip);
	// 내가 속한 그룹 tseq를 가져오기 위해
	List<TripGroup> getTseqList(String id);
	

	// 추가
	// id가 같은 tseq들을 가져온다
	List<TripGroup> getTseqId(String id);
	void delTripgroup(int tseq);
	// 나중에 초대용 invite 만들어야한다!
	void inviteGroup(Trip trip); // 초대 입력한 id, tseq 담아
	
	List<TripGroup> getTripGroup(int tseq);
	
	//////////
	void inviteMember(TripGroup tg);
	int commonIdCheck(TripGroup tg);
	
	
	// 170529
	void delTripgroupByTgseq(int tgseq);
	
}
