package com.travel.plan.tripgroup.dao;

import java.util.List;

import com.travel.plan.trip.model.Trip;
import com.travel.plan.tripgroup.model.TripGroup;

public interface TripGroupService {

	void insertGroup(Trip trip);
	List<TripGroup> getTseqList(String id);
	

	List<TripGroup> getTseqId(String id);
	void delTripgroup(int tseq);

	// Ãß°¡
	void inviteGroup(Trip trip);
	List<TripGroup> getTripGroup(int tseq);
	
	//////////
	void inviteMember(TripGroup tg);
	int commonIdCheck(TripGroup tg);
	
	// 170529
	void delTripgroupByTgseq(int tgseq);
}
